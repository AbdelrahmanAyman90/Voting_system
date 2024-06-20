import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/custom_result_candidate_widget.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RusltBody extends StatefulWidget {
  RusltBody({super.key});

  @override
  State<RusltBody> createState() => _RusltBodyState();
}

class _RusltBodyState extends State<RusltBody> {
  WebSocketChannel? channel;

  @override
  void initState() {
    super.initState();
    _connectWebSocket();
  }

  Future<void> _connectWebSocket() async {
    final url = linkWebSocket;
    final headers = {
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2Njc5M2Q1NjQzNWIwZWM1OTkzMzExNCIsIm5hbWUiOiJkZWZhdWx0IiwiYXBwcm92ZWQiOnRydWUsImRhdGVPZkJpcnRoIjoiMTkwMi0wNC0yMVQwMDowMDowMC4wMDBaIiwibmF0aW9uYWxJZCI6IjIwMjAyODA4ODAwMzM1IiwiaWF0IjoxNzE4NzUyMTIzLCJleHAiOjE3MjEzNDQxMjN9.nE3D5pOI4GJJ0ZXaS1lZ-Y0nyNx3IjhzRI2acAN_ChU',
    };

    try {
      final socket = await WebSocket.connect(url, headers: headers);
      setState(
        () {
          channel = IOWebSocketChannel(socket);
        },
      );
    } catch (e) {
      print('Failed to connect to WebSocket: $e');
    }
  }

  @override
  void dispose() {
    channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return channel == null
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : StreamBuilder(
            stream: channel!.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                );
              } else if (snapshot.hasData) {
                final data = jsonDecode(snapshot.data as String);
                final results = data['results'] as List;
                return Container(
                  color: AppColors.secondbackgroundcolor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //total voting
                            Column(
                              children: [
                                Text(
                                  S.of(context).total_vote,
                                  style: AppFonts.regularText(context, 14,
                                      AppColors.secondaryTextColor),
                                ),
                                Text(
                                  // todo api
                                  isEnglish()
                                      ? '${data['totalCount']}'
                                      : "${convertEnglishNumberToArabicNumber(data['totalCount'].toString())}",

                                  style: AppFonts.semiBoldText(
                                    context,
                                    16,
                                    AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                            //voting end
                            Text(
                              // todo api
                              S.of(context).voting_end,
                              style: AppFonts.regularText(
                                  context, 14, AppColors.secondaryTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        //all voter

                        const SizedBox(height: 10),
                        // todo list candidate
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return index == 0
                                  ? CustomResultCndidate(
                                      count: results[index]['count'],
                                      name: results[index]['candidate']['name'],
                                      image: results[index]['candidate']
                                          ['image'],
                                      color: true,
                                      standing: index + 1,
                                    )
                                  : CustomResultCndidate(
                                      count: results[index]['count'],
                                      name: results[index]['candidate']['name'],
                                      image: results[index]['candidate']
                                          ['image'],
                                      color: false,
                                      standing: index + 1,
                                    );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                            itemCount: results.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Center(child: Text('No data received')),
                );
              }
            });
  }
}
