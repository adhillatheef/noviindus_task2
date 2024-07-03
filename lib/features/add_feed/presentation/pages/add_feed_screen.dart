import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_task2/common/themes/app_palatte.dart';
import 'package:noviindus_task2/common/widgets/common_loading_widget.dart';
import 'package:noviindus_task2/features/add_feed/provider/add_feed_provider.dart';
import 'package:provider/provider.dart';

import '../../../home/data/model/categories.dart';
import '../methods/select_image_video.dart';

class AddFeedScreen extends StatefulWidget {
  final List<Category> categoryList;

  const AddFeedScreen({super.key, required this.categoryList});

  @override
  State<AddFeedScreen> createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<int> selectedCategories = [];
  File? _selectedVideo;
  File? _image;
  File? _thumbnailFile;

  _pickVideo() async {
    final pickedVideoData = await SelectImageVideo().pickVideo();
    if (pickedVideoData != null) {
      setState(() {
        _selectedVideo = pickedVideoData['video'];
        _thumbnailFile = pickedVideoData['thumbnail'];
      });
    }
  }

  _pickImage() async {
    final pickedImage = await SelectImageVideo().pickImage();
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddFeedProvider>(context);
    return LoadingWidget(
      isLoading: provider.isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Add Feeds',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate() &&
                      _image != null &&
                      _selectedVideo != null &&
                      selectedCategories.isNotEmpty) {
                    provider.uploadFeed(
                      context: context,
                      video: _selectedVideo!,
                      image: _image!,
                      description: descriptionController.text.trim(),
                      categoryList: selectedCategories,
                    );
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter valid details')),
                    );
                  }
                },
                child: Chip(
                    backgroundColor: AppPalette.red.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: AppPalette.red,
                        )),
                    label: const Text('Share Post')),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickVideo,
                    child: DottedBorder(
                        radius: const Radius.circular(10),
                        borderType: BorderType.RRect,
                        color: AppPalette.borderColor,
                        dashPattern: const [15, 10],
                        child: SizedBox(
                          width: double.infinity,
                          height: 270,
                          child: _thumbnailFile != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _thumbnailFile!,
                                    fit: BoxFit.cover,
                                  ))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/images/upload_image.png'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Select a video from Gallery',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: _pickImage,
                    child: DottedBorder(
                        radius: const Radius.circular(10),
                        borderType: BorderType.RRect,
                        color: AppPalette.borderColor,
                        dashPattern: const [15, 10],
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  height: 130,
                                  width: double.infinity,
                                  _image!,
                                  fit: BoxFit.cover,
                                ))
                            : SizedBox(
                                width: double.infinity,
                                height: 130,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        'assets/images/upload_thumbnail.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Add a Thumbnail',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Add Description',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter the Description'),
                    maxLines: null,
                    controller: descriptionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please add a Description';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Select Categories',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 1,
                      childAspectRatio:
                          2.5, // Adjust as needed for aspect ratio
                    ),
                    itemCount: widget.categoryList.length,
                    itemBuilder: (context, index) {
                      final data = widget.categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          if (selectedCategories.contains(data.id)) {
                            selectedCategories.remove(data.id);
                          } else {
                            selectedCategories.add(data.id!);
                          }
                          setState(() {});
                        },
                        child: Chip(
                          color: selectedCategories.contains(data.id)
                              ? const MaterialStatePropertyAll(
                                  AppPalette.redGradient)
                              : null,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: AppPalette.red.withOpacity(0.2),
                              )),
                          label: Text(data.title!),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
