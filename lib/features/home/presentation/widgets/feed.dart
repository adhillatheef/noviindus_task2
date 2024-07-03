import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:noviindus_task2/common/themes/app_palatte.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;

class Feeds extends StatefulWidget {
  final String name;
  final String createdAt;
  final String videoUrl;
  final String description;
  final Function(VideoPlayerController) onPlay;

  const Feeds({
    super.key,
    required this.name,
    required this.createdAt,
    required this.videoUrl,
    required this.description,
    required this.onPlay,
  });

  @override
  State<Feeds> createState() => _FeedState();
}

class _FeedState extends State<Feeds> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://frijo.noviindus.in${widget.videoUrl}'),
    )..initialize().then((_) {
      setState(() {});
    });

    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  String timeAgo(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(dateTime);
    return timeago.format(now.subtract(difference), locale: 'en');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      widget.onPlay(_controller);
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/placeholder.png'),
          ),
          title: Text(
            widget.name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            timeAgo(widget.createdAt),
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        if (_controller.value.isInitialized)
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                _PlayPauseOverlay(controller: _controller, onPlayPause: _handlePlayPause),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          )
        else
          Container(
            height: 200,
            color: Colors.black,
            child: const Center(
              child: SpinKitDoubleBounce(
                color: AppPalette.red,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.description.toLowerCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.5,
            ),
          ),
        )
      ],
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({required this.controller, required this.onPlayPause});

  final VideoPlayerController controller;
  final VoidCallback onPlayPause;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPlayPause,
      child: Stack(
        children: <Widget>[
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
            ),
          ),
          Center(
            child: Icon(
              controller.value.isPlaying ? null : Icons.play_arrow,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}