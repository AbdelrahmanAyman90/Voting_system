import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mnc_identifier_face/mnc_identifier_face.dart';
import 'package:mnc_identifier_face/model/liveness_detection_result_model.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/verification_fail.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/verification_successful.dart';

import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class TakePhotoBody extends StatefulWidget {
  TakePhotoBody(
      {super.key,
      required this.selectedNationalIdImage,
      required this.nationalId,
      required this.password});
  final String nationalId;
  final String password;
  PlatformFile? selectedNationalIdImage;

  @override
  State<TakePhotoBody> createState() => _TakePhotoBodyState();
}

class _TakePhotoBodyState extends State<TakePhotoBody>
    with SingleTickerProviderStateMixin {
  LivenessDetectionResult? livenessResult;
  final _mncIdentifierFacePlugin = MncIdentifierFace();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthorizationCubit, UserAuthorizationState>(
      listener: (context, state) async {
        if (state is UserAuthorizationRegisterSucsses) {
          context.loaderOverlay.hide();

          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => VerificationSuccessful(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        } else if (state is UserAuthorizationRegisterFail) {
          context.loaderOverlay.hide();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationFail(
                      errorMassage: state.errorMassage,
                    )),
          );
        } else {
          context.loaderOverlay.show(
            widgetBuilder: (progress) {
              return MyAppStuts.myLooding();
            },
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          children: [
            Text(
              'Resigter',
              style: AppFonts.boldText(context, 28, AppColors.mainColor),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Take Photo For Can Register",
              style: AppFonts.regularText(
                  context, 16, AppColors.secondaryTextColor),
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Image(
                  image: AssetImage('assets/images/Rectangle 167.png'),
                ),
                Positioned(
                  top: 280,
                  child: GestureDetector(
                    onTap: () async {
                      livenessResult = await _mncIdentifierFacePlugin
                          .startLivenessDetection();
                      log(livenessResult.toString());
                      if (livenessResult != null) {
                        final holdStillImage = livenessResult!.detectionResult
                            ?.firstWhere((result) =>
                                result.detectionMode == 'HOLD_STILL')
                            .imagePath;
                        if (holdStillImage != null) {
                          context.read<UserAuthorizationCubit>().userRegister(
                              nationalId: widget.nationalId,
                              password: widget.password,
                              nationalIdImage: widget.selectedNationalIdImage!,
                              personalImage:
                                  await convertToPlatformFile(holdStillImage));
                        }
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: ScaleTransition(
                      scale: Tween(begin: 1.0, end: 1.2).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: const Image(
                        image: AssetImage('assets/images/Group 476.png'),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
