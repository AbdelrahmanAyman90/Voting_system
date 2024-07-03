import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidates_list_widget.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';

class CustomCandidatePageInElection extends StatelessWidget {
  const CustomCandidatePageInElection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCandidateCubit, GetCandidateState>(
      builder: (context, state) {
        if (state is GetCandidateSuccess) {
          return _buildCandidateList(state);
        } else if (state is GetCandidateFail) {
          return _buildError(state.errorMassage);
        } else {
          return _buildLoading();
        }
      },
    );
  }

  Widget _buildCandidateList(GetCandidateSuccess state) {
    return ListView.builder(
      itemCount: state.allCandidate.length,
      itemBuilder: (context, index) {
        final candidate = state.allCandidate[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CandidateList(
                img: imagePath + candidate.image!,
                selectCandidate: index,
                name: candidate.name!,
                bio: candidate.job!,
                candidateSId: candidate.sId!,
                userCandate: candidate.user!,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildError(String errorMessage) {
    return Center(child: Text(errorMessage));
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.mainColor,
      ),
    );
  }
}
