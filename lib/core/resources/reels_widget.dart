import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class InstagramReels extends StatefulWidget {
  @override
  _InstagramReelsState createState() => _InstagramReelsState();
}

class _InstagramReelsState extends State<InstagramReels> {
  List<String> videoUrls = [
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4', // Replace with actual video URLs
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // 'https://www.exit109.com/~dnn/clips/RW20seconds_1.mp4',
  ];

  PageController _pageController = PageController();
  List<BetterPlayerController> _betterPlayerControllers = [];

  @override
  void initState() {
    super.initState();
    _initializePlayers();
  }

  void _initializePlayers() {
    for (var url in videoUrls) {
      BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        url,
      );
      BetterPlayerController betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          autoPlay: true,
          looping: true,
          autoDispose: false,
          aspectRatio: 9 / 16, // For vertical videos
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableFullscreen: false,
            enableAudioTracks: false,
            enableMute: false,
            enableOverflowMenu: false,
            enablePip: false,
            enablePlaybackSpeed: false,
            enablePlayPause: true,
            enableProgressBar: true,
            enableProgressBarDrag: false,
            enableProgressText: false,
            enableQualities: false,
            enableRetry: false,
            enableSkips: false,
            enableSubtitles: false,
          ),
        ),
        betterPlayerDataSource: dataSource,
      );
      _betterPlayerControllers.add(betterPlayerController);
    }
  }

  @override
  void dispose() {
    print("######## DISPOSE");
    _pageController.dispose();
    for (int i = 0; i < _betterPlayerControllers.length; i++) {
      _betterPlayerControllers[i].pause();
    }
    for (var controller in _betterPlayerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void deactivate() {
    print("######## DEACTIVATE");

    _pageController.dispose();
    for (var controller in _betterPlayerControllers) {
      controller.dispose();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        onPageChanged: (index) {
          _pauseAllExcept(index);
        },
        itemBuilder: (context, index) {
          return _buildReelItem(index);
        },
      ),
    );
  }

  Widget _buildReelItem(int index) {
    return Stack(
      children: [
        BetterPlayer(controller: _betterPlayerControllers[index]),
        Positioned(
          bottom: 50,
          left: 16,
          child: _buildReelDetails(index),
        ),
      ],
    );
  }

  void _pauseAllExcept(int playingIndex) {
    for (int i = 0; i < _betterPlayerControllers.length; i++) {
      if (i != playingIndex) {
        _betterPlayerControllers[i].pause();
      } else {
        _betterPlayerControllers[i].play();
      }
    }
  }

  Widget _buildReelDetails(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('@user_$index',
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 8),
        const Text('Likes: 123',
            style: TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}
