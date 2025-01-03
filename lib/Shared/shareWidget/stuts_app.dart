import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';

class MyAppStuts {
  //!snak barr fail
  static void showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }
  //!snak barr succses

  static void succsessShowSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.green,
      ),
    );
  }

//! looding
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
}

//! alert sucsses form
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
              fontsize: 15,
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
//! shimmer for event

Widget buildShammerWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[500]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 30,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // Background color for shimmer
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Text(
                          "Sample Title",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: const Text(
                          'Nationwide',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const Icon(
                        Icons.access_time,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: const Text(
                        "لم تبدا بعد",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(102, 32),
                              ),
                            ),
                            child: Text("تقديم"))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

//! news loodshimmer
Widget buildNewsShammer() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: double.infinity,
            height: 200.0,
            color: Colors.grey, // Optional: add a color to avoid default black
          ),
        ),
      ),
    ),
  );
}
//! shimmer vote

class BuildCandidategShimmer extends StatelessWidget {
  const BuildCandidategShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return buildVotingShammer(context);
            },
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}

//! shimmer result
class BuildCandidategRusltShimmer extends StatelessWidget {
  const BuildCandidategRusltShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //total voting
              Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[100]!,
                child: const Column(
                  children: [
                    Text(
                      "number vote",
                    ),
                    Text(
                      // todo api
                      "4",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Text(
                  // todo api
                  "voting end after",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildVotingShammer(context);
              },
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

//! widget for two event and result
Widget buildVotingShammer(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300], // Placeholder color for shimmer
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Text(
                      "name candidate",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Text(
                      "job",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
