// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:mime/mime.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:voting/Shared/const/const_vrible.dart';
// import 'package:voting/Shared/network/api_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Multiple File Upload',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final Dio _dio = creatdio();

//   List<PlatformFile?> _selectedImages = List.generate(7, (_) => null);

//   Future<void> pickAndUploadImage(int index) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.image,
//     );

//     if (result != null && result.files.isNotEmpty) {
//       setState(() {
//         _selectedImages[index] = result.files.first;
//       });
//     }
//   }

//   Future<void> sendImages() async {
//     List<PlatformFile> selectedFiles = _selectedImages
//         .where((image) => image != null)
//         .map((image) => image!)
//         .toList();

//     if (selectedFiles.isEmpty) {
//       print('No images selected.');
//       return;
//     }

//     List<MultipartFile> multipartFiles = [];

//     for (var file in selectedFiles) {
//       var mimeType = lookupMimeType(file.path!) ?? 'application/octet-stream';
//       var multipartFile = await MultipartFile.fromFile(
//         file.path!,
//         filename: file.name,
//         contentType: MediaType.parse(mimeType),
//       );
//       multipartFiles.add(multipartFile);
//     }
//     Map<String, dynamic> headerRequest = {
//       'authorization': "bearer ${token}",
//     };
//     FormData formData = FormData.fromMap({
//       'images': multipartFiles,
//     });
//     formData.fields.add(MapEntry('name', 'test1 candidate'));
//     formData.fields.add(MapEntry('job', 'SW Engineer'));
//     formData.fields.add(MapEntry('education', 'doctor'));
//     try {
//       Response response = await _dio.post(
//         'https://graduation-project-yok6.onrender.com/api/candidate', // Replace with your API endpoint
//         data: formData,
//         options: Options(headers: headerRequest),
//       );

//       if (response.statusCode == 200) {
//         print('Images uploaded successfully: ${response.data}');
//       } else {
//         print('Failed to upload images: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error uploading images: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Multiple Image Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             for (int i = 0; i < 7; i++)
//               ElevatedButton(
//                 onPressed: () => pickAndUploadImage(i),
//                 child: Text('Select Image ${i + 1}'),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: sendImages,
//               child: Text('Send Images'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
