import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// ignore: must_be_immutable
class FlutterVizYoutubePlayer extends StatefulWidget {
  String? url;
  bool? autoPlay;
  bool? looping;
  bool? mute;
  bool? showControls;
  bool? showFullScreen;

  FlutterVizYoutubePlayer({
    this.url,
    this.autoPlay = false,
    this.looping = false,
    this.mute = false,
    this.showControls = true,
    this.showFullScreen = true,
  });

  @override
  _FlutterVizYoutubePlayerState createState() => _FlutterVizYoutubePlayerState();
}

class _FlutterVizYoutubePlayerState extends State<FlutterVizYoutubePlayer> {
  final String defaultYoutubeId = "9xwazD5SyVg";

  @override
  Widget build(BuildContext context) {
    return YoutubeViewer(
      videoID: widget.url ?? defaultYoutubeId,
      autoPlay: widget.autoPlay ?? false,
      mute: widget.mute ?? false,
      loop: widget.looping ?? false,
      showControls: widget.showControls ?? true,
      showFullScreen: widget.showFullScreen ?? true,
    );
  }
}

class YoutubeViewer extends StatefulWidget {
  final String videoID;
  final bool autoPlay;
  final bool loop;
  final bool mute;
  final bool showControls;
  final bool showFullScreen;

  const YoutubeViewer({
    required this.videoID,
    required this.autoPlay,
    required this.loop,
    required this.mute,
    required this.showControls,
    required this.showFullScreen,
  });

  @override
  _YoutubeViewerState createState() => _YoutubeViewerState();
}

class _YoutubeViewerState extends State<YoutubeViewer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      // videoId: widget.videoID,
      params: YoutubePlayerParams(
        // autoPlay: widget.autoPlay,
        loop: widget.loop,
        mute: widget.mute,
        showControls: widget.showControls,
        showFullscreenButton: widget.showFullScreen,
        showVideoAnnotations: false,
        enableJavaScript: true,
        enableCaption: true,
        playsInline: true,
        // useHybridComposition: true,
      ),
    );

    // _controller!.onExitFullscreen = () {
    //   Navigator.of(context).pop();
    // };
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      key: UniqueKey(),
      controller: _controller,
      child: Container(
        height: 200,
        //padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        child: Container(),
      ),
    );
  }
}