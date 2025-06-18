import 'package:flutter_viz/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlutterVizVideoPlayer extends StatefulWidget {
  final String? url;

  FlutterVizVideoPlayer({this.url});

  @override
  _FlutterVizVideoPlayerState createState() => _FlutterVizVideoPlayerState();
}

class _FlutterVizVideoPlayerState extends State<FlutterVizVideoPlayer> {
  late VideoPlayerController _controller;
  static const _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];
  String? prevURL = "";

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url!)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Future<void> init() async {
    if (widget.url != prevURL) {
      _controller = VideoPlayerController.network(widget.url!)
        ..initialize().then((_) {
          prevURL = widget.url;
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  Stack(
                    children: <Widget>[
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 50),
                        reverseDuration: Duration(milliseconds: 200),
                        child: _controller.value.isPlaying
                            ? SizedBox.shrink()
                            : Container(
                                color: Colors.black26,
                                child: Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 80.0,
                                  ),
                                ),
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.value.isPlaying ? _controller.pause() : _controller.play();
                          setState(() {});
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton<double>(
                          initialValue: _controller.value.playbackSpeed,
                          tooltip: language!.playbackSpeed,
                          onSelected: (speed) {
                            _controller.setPlaybackSpeed(speed);
                          },
                          itemBuilder: (context) {
                            return [
                              for (final speed in _examplePlaybackRates)
                                PopupMenuItem(
                                  value: speed,
                                  child: Text('${speed}x'),
                                )
                            ];
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              // Using less vertical padding as the text is also longer
                              // horizontally, so it feels like it would need more spacing
                              // horizontally (matching the aspect ratio of the video).
                              vertical: 12,
                              horizontal: 16,
                            ),
                            child: Text('${_controller.value.playbackSpeed}x'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            )
          : Container(
              child: Text(language!.invalidUrl, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
