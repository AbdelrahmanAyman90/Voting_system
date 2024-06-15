import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/take_photo_body.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(child: TakePhotoBody()),
    ));
  }
}
