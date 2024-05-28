import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/presntion%20layer/view_model/layout_viewmodel/cubit/layout_cubit.dart';

class Row2InProfile extends StatefulWidget {
  final IconData icon;
  final String text;
  const Row2InProfile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<Row2InProfile> createState() => _Row2InProfileState();
}

class _Row2InProfileState extends State<Row2InProfile> {
  bool _isSwitched = isEnglish();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (state is EnglishState) {
          _isSwitched = true;
        } else {
          _isSwitched = false;
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Icon(
              widget.icon,
              size: 20,
              color: AppColors.secondaryTextColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: AppFonts.regularText(context, 14, Colors.black),
            ),
            const Spacer(),
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                if (value == false) {
                  BlocProvider.of<LayoutCubit>(context).changeLanguage('ar');
                } else if (value == true) {
                  BlocProvider.of<LayoutCubit>(context).changeLanguage("en");
                }
              },
              activeTrackColor: AppColors.mainColor,
              activeColor: Colors.white,
            ),
          ],
        );
      },
    );
  }
}
