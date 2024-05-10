import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/presntion%20layer/view_model/layout_view_model/cubit/layout_cubit.dart';

class row2_in_profile extends StatefulWidget {
  final IconData icon;
  final String text;
  const row2_in_profile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<row2_in_profile> createState() => _row2_in_profileState();
}

class _row2_in_profileState extends State<row2_in_profile> {
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
              style: AppFonts.regularText(
                fontSize: 12,
              ),
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
