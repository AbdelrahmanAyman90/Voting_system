import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

Future uploadIDImage(PlatformFile image) async {
  return MultipartFile.fromFile(image.path!,
      filename: image.path!.split('/').last);
}

Future uploadPersonalImage(PlatformFile image) async {
  return MultipartFile.fromFile(image.path!,
      filename: image.path!.split('/').last);
}
