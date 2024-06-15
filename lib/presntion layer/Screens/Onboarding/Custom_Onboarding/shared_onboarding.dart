import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';

class OnboardingContent extends StatelessWidget {
  final String img;
  final String? img2;
  final String tittle;
  final String? tittle2;
  final String desc;

  const OnboardingContent(
      {super.key,
      required this.img,
      required this.tittle,
      required this.desc,
      this.tittle2,
      this.img2});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(tittle, style: AppFonts.semiBoldText(context, 24, Colors.black)),
          if (tittle2 != null)
            Text(tittle2!,
                style: AppFonts.semiBoldText(context, 24, Colors.black)),
          SizedBox(
            height: isEnglish() ? 16 : 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: AppFonts.regularText(
                  context,
                  16,
                  AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height < 750
                ? isEnglish()
                    ? 16
                    : 50
                : isEnglish()
                    ? 45
                    : 50,
          ),
          Image(
            image: AssetImage(img),
          ),
          if (img2 != null) ...[
            const SizedBox(
              height: 15,
            ),
            Image(
              image: AssetImage(img2!),
            ),
          ]
        ]);
  }
}

class Dots extends StatelessWidget {
  final Color color;
  final Widget mainScreen;
  const Dots({super.key, required this.color, required this.mainScreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => mainScreen,
          ),
        );
      },
      child: SizedBox(
        width: 15,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    super.key,
    this.text,
    this.textColor,
    this.buttonColor,
    required this.onPressed,
    //required this.nextScreen,
  });
  final Function()? onPressed;
  //final Widget nextScreen;
  final String? text;
  final Color? textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Button(
        text: text ?? S.of(context).next,
        color: buttonColor ?? Colors.white,
        fontsize: 16,
        width: 250,
        height: 44,
        onPressed: onPressed,
        textcolor: textColor ?? AppColors.mainColor);
  }
}

class SkipBtn extends StatelessWidget {
  final Function()? onPressed;
  const SkipBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        S.of(context).skip,
        style: AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
      ),
    );
  }
}
