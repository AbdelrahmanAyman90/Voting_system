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

bool isCandidate(String idUser) {
  return idApprovCandidate.contains(idUser);
}

bool isAddCampiagnValue = false;
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
