import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraDeepArController controller;
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffect = Effects.none;
  Filters currentFilter = Filters.none;
  Masks currentMask = Masks.none;
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CameraDeepAr(
            androidLicenceKey:
                "c528c8c8db150e0316dc488f9ba457ddb1924fa2356788c676ddaecaff596ff456af57137460784c",
            iosLicenceKey:
                "ea0d802323c3571ce01b52507c4998be91fc1b8f1a42c02d8e0bf7d5099e752bb1429870540e2c61",
            onCameraReady: (isReady) {
              print("Camera status $isReady");
            },
            onImageCaptured: (path) {
              print("Image Taken $path");
            },
            onVideoRecorded: (path) {
              print("Video Recorded @ $path");
            },
            cameraDeepArCallback: (c) async {
              controller = c;
              setState(() {});
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Masks.values.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      currentPage = index;
                      controller.changeMask(index);
                      setState(() {});
                    },
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        width: index == currentPage ? 50 : 40,
                        height: index == currentPage ? 40 : 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentPage
                                ? Colors.green
                                : Colors.white),
                        child: Text(
                          "$index",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: index == currentPage ? 16 : 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
