import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/Notification_Form_Body.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class CustomHelloText extends StatelessWidget {
  const CustomHelloText({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<UserAuthorizationCubit>(context);

    return Row(
      children: [
        Text(cubit.userData!.data!.user!.name!,
            style: AppFonts.semiBoldText(
              context,
              24,
              AppColors.mainColor,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: NotificationFormBody()),
                );
              },
            );
          },
          icon: Icon(Icons.notifications_outlined,
              size: 24, color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }
}
