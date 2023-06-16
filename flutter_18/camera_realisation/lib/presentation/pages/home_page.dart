import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;
  late List<CameraDescription> _cameras;
  List<XFile> album = [];
  late XFile lastImg;

  Future<void> cameraInit() async {
    _cameras = await availableCameras();

    controller = CameraController(_cameras[0], ResolutionPreset.max);
    await controller.initialize();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    unawaited(cameraInit());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isCamera = true;
  int _bottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Camera'),
        ),
        body: _bottomIndex == 0
            ? controller.value.isInitialized == true
                ? Container(
                    child: Stack(
                      children: [
                        CameraPreview(controller),
                        FloatingActionButton(
                          onPressed: () async {
                            lastImg = (await controller.takePicture());
                            album.add(lastImg);
                          },
                        )
                      ],
                    ),
                  )
                : CircularProgressIndicator()
            : SafeArea(
                child: ListView(
                  children: [
                    ...album.map(
                      (e) => Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Image.file(
                            File(e.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _bottomIndex = value;
                value == 0 ? isCamera = true : isCamera = false;
              });
            },
            currentIndex: _bottomIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Camera',
                icon: Icon(Icons.camera_alt_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Gallery',
                icon: Icon(Icons.camera_alt_rounded),
              ),
            ]),
      ),
    );
  }
}
