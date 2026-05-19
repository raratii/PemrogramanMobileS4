import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'widget/filter_carousel.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  State<CameraScreen> createState() =>
      _CameraScreenState();
}

class _CameraScreenState
    extends State<CameraScreen> {

  late CameraController _controller;

  late Future<void>
      _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture =
        _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<void>(
        future:
            _initializeControllerFuture,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.done) {

            return Stack(
              children: [

                Positioned.fill(
                  child:
                      CameraPreview(
                    _controller,
                  ),
                ),

                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,

                  child: Center(
                    child:
                        FloatingActionButton(
                      child: const Icon(
                        Icons.camera_alt,
                      ),

                      onPressed:
                          () async {

                        final image =
                            await _controller
                                .takePicture();

                        if (!context
                            .mounted) {
                          return;
                        }

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    PhotoFilterCarousel(
                              imagePath:
                                  image.path,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return const Center(
            child:
                CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}