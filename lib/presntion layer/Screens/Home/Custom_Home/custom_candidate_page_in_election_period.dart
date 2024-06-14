import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/const_vrible.dart';

import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidates_list_widget.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';

class CustomCandidatePageInElection extends StatelessWidget {
  const CustomCandidatePageInElection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCandidateCubit, GetCandidateState>(
      builder: (context, state) {
        if (state is GetCandidateSuccess) {
          return ListView.builder(
            itemCount: state.allCandidate.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  // width: MediaQuery.of(context).size.width * 335 / 375,
                  // height: MediaQuery.of(context).size.height * 122 / 812,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CandidateList(
                        img: imagePath + state.allCandidate[index].image!,
                        name: state.allCandidate[index].name!,
                        bio: state.allCandidate[index].job!,
                        candidateId: state.allCandidate[index].sId!,
                        UserCandate: state.allCandidate[index].user!,
                      )),
                ),
              );
            },
          );
        }
        if (state is GetCandidateFail) {
          return Center(child: Text(state.errorMassage));
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          );
        }
      },
    );
  }
}
