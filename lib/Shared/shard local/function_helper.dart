import 'dart:developer';
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
  log("&&&&&&&&&&&&&&&$input");
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

Future<void> prepareDate() async {
  token = CashNetwork.GetFromCash(key: 'token');
  idUser = CashNetwork.GetFromCash(key: 'idUser');
  userName = CashNetwork.GetFromCash(key: 'name');

  userNationalId = CashNetwork.GetFromCash(key: 'national_id');

  userAddress = CashNetwork.GetFromCash(key: 'address');
}
