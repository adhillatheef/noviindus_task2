import 'package:flutter/material.dart';
import 'package:noviindus_task2/common/themes/app_palatte.dart';
import 'package:noviindus_task2/features/add_feed/presentation/pages/add_feed_screen.dart';
import 'package:noviindus_task2/features/home/presentation/widgets/feed.dart';
import 'package:noviindus_task2/features/home/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../widgets/shimmer_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController? _currentlyPlayingController;

  void _handlePlay(VideoPlayerController controller) {
    if (_currentlyPlayingController != null &&
        _currentlyPlayingController != controller) {
      _currentlyPlayingController!.pause();
    }
    _currentlyPlayingController = controller;
  }

  @override
  void dispose() {
    _currentlyPlayingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppPalette.red,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddFeedScreen(
                          categoryList: homeScreenProvider.list ?? [],
                        )));
          },
          child: const Icon(
            Icons.add,
            size: 42,
          )),
      body: SafeArea(
        child: homeScreenProvider.isLoading
            ? const ShimmerLoading()
            : Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Hello Maria',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      'Welcome back to section',
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/placeholder.png'),
                    ),
                  ),
                  if (homeScreenProvider.list != null &&
                      homeScreenProvider.list!.isNotEmpty)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: (homeScreenProvider.list ?? [])
                            .map((e) => // how to handle null here
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Chip(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            width: 0.84,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      label: Text(e.title ?? ''),
                                      side: const BorderSide(
                                        color: AppPalette.borderColor,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  if (homeScreenProvider.feedList != null &&
                      homeScreenProvider.feedList!.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                          itemCount: homeScreenProvider.feedList!.length ?? 0,
                          itemBuilder: (context, index) {
                            final data = homeScreenProvider.feedList![index];
                            return Feeds(
                              name: data.user!.name! ?? '',
                              createdAt: data.createdAt.toString() ?? '',
                              videoUrl: data.video! ?? '',
                              description: data.description ?? '',
                              onPlay: _handlePlay,
                            );
                          }),
                    ),
                ],
              ),
      ),
    );
  }
}
