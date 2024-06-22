import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';

bool isEnglish() {
  if (CashNetwork.GetFromCash(key: 'lang') == 'en') {
    return true;
  } else {
    return false;
  }
}

bool isAddCampiagnValue = false;
String convertEnglishNumberToArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }

  return input;
}

// Method to convert String to PlatformFile
Future<PlatformFile> convertToPlatformFile(String filePath) async {
  File file = File(filePath);

  // Read file bytes
  final bytes = await file.readAsBytes();

  // Create PlatformFile instance
  PlatformFile platformFile = PlatformFile(
    name: file.uri.pathSegments.last, // Get file name
    path: filePath,
    bytes: bytes,
    size: bytes.length,
  );

  return platformFile;
}
// bool isCandidate(String idUser) {
//   return idApprovCandidate.contains(idUser);
// }



// //return list of MultipartFile that can upload to api
// Future<List<MultipartFile>> uploadImageToApi(List<PlatformFile?> fiels) async {
//   List<MultipartFile> fileList = [];
//   for (var i in fiels) {
//     MultipartFile file = await MultipartFile.fromFile(
//       i!.path!,
//       filename: i.name,
//     );
//     fileList.add((file));
//   }
//   return fileList;
// }
