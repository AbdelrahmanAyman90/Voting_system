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

String? eventCases(String event) {
  DateTime now = DateTime.now();
  //event nomination
  DateTime startTime = DateTime(2024, 6, 27, 5, 0); // June 26, 2024 at 5:00 AM
  DateTime endTime = DateTime(2024, 6, 28, 24, 0); //June 26, 2024 at 6:00 PM
//event candidates
  DateTime startTimecandidates =
      DateTime(2024, 5, 27, 5, 0); // June 26, 2024 at 5:00 AM
  DateTime endTimecandidates =
      DateTime(2024, 5, 28, 24, 0); //June 26, 2024 at 6:00 PM
// event elections
  DateTime startTimeelections =
      DateTime(2024, 6, 27, 5, 0); // June 26, 2024 at 5:00 AM
  DateTime endTimeelections = DateTime(2024, 6, 28, 18, 0);
  log(now.toString()); //June 26, 2024 at 6:00 PM
  if (event == "nomination") {
    if (now.isAfter(startTime) && now.isBefore(endTime)) {
      return "now";
    } else if (now.isBefore(startTime)) {
      return "not start";
    } else {
      return "end";
    }
  } else if (event == "candidates") {
    if (now.isAfter(startTimecandidates) && now.isBefore(endTimecandidates)) {
      return "now";
    } else if (now.isBefore(startTimecandidates)) {
      return "not start";
    } else {
      return "end";
    }
  } else if (event == "elections") {
    log("خش");
    if (now.isAfter(startTimeelections) && now.isBefore(endTimeelections)) {
      return "now";
    } else if (now.isBefore(startTimeelections)) {
      return "not start";
    } else {
      return "end";
    }
  } else {
    log("خخخخ");
    return null;
  }
}

Future<void> prepareDate() async {
  token =await CashNetwork.GetFromCash(key: 'token');
  idUser =await CashNetwork.GetFromCash(key: 'idUser');
  userName =await CashNetwork.GetFromCash(key: 'name');

  userNationalId =await CashNetwork.GetFromCash(key: 'national_id');

  userAddress =await CashNetwork.GetFromCash(key: 'address');

  isCandidateSelf =
     await CashNetwork.GetFromCash(key: 'isCandidatSelf') == "true" ? true : false;
}
