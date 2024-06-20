import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';

class MyAppStuts {
  static void showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  static Widget myLooding() {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(.6),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }

  // static mySuccsessAlert(context, {required String massage}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       AlertDialog(
  //         backgroundColor: Colors.white,
  //         content: Padding(
  //           padding: const EdgeInsets.only(top: 3),
  //           child: Column(
  //             children: [
  //               SvgPicture.asset(
  //                 'assets/images/Clip path group.svg',
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               Text(
  //                 massage,
  //                 style: AppFonts.regularText(
  //                   context,
  //                   18,
  //                   AppColors.secondaryTextColor,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               Button(
  //                   text: S.of(context).Ok,
  //                   color: AppColors.mainColor,
  //                   fontsize: 16,
  //                   width: 66,
  //                   height: 25,
  //                   onPressed: () {
  //                     Navigator.pushReplacement(
  //                       context,
  //                       MaterialPageRoute<void>(
  //                         builder: (BuildContext context) => const HomeScreen(),
  //                       ),
  //                     );
  //                   },
  //                   textcolor: Colors.white)
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

class SuccsesAlert extends StatefulWidget {
  final String message;

  const SuccsesAlert({Key? key, required this.message}) : super(key: key);

  @override
  _SuccsesAlertState createState() => _SuccsesAlertState();
}

class _SuccsesAlertState extends State<SuccsesAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: SvgPicture.asset(
                    'assets/images/Clip path group.svg',
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              textAlign: TextAlign.center,
              widget.message,
              style: TextStyle(fontSize: 18, color: AppColors.secondaryTextColor
                  // Replace with your desired color
                  ),
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              text: S.of(context).Ok,
              color: AppColors.mainColor,
              fontsize: 16,
              width: 66,
              height: 25,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomeScreen(),
                  ),
                );
              },
              textcolor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
