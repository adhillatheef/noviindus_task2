import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class SelectImageVideo{
  Future<File?> pickImage() async{
    try{
      final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(xFile != null){
        return File(xFile.path);
      }
      return null;
    }catch (e){
      return null;
    }
  }

  Future<Map<String, File?>?> pickVideo() async {
    try {
      final xFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (xFile != null) {
        final videoFile = File(xFile.path);
        final String? thumbnailPath = await VideoThumbnail.thumbnailFile(
          video: xFile.path,
          thumbnailPath: (await getTemporaryDirectory()).path,
          imageFormat: ImageFormat.PNG,
          maxHeight: 270,
          quality: 75,
        );
        if (thumbnailPath != null) {
          final thumbnailFile = File(thumbnailPath);
          return {'video': videoFile, 'thumbnail': thumbnailFile};
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}