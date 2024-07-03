import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/data/models/election/election_result.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/result_list.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RusltBody extends StatefulWidget {
  RusltBody({super.key});

  @override
  State<RusltBody> createState() => _RusltBodyState();
}

class _RusltBodyState extends State<RusltBody> {
  WebSocketChannel? channel;
  ApiServes api = ApiServes(dio: creatdio());
  @override
  void initState() {
    super.initState();
    _connectWebSocket();
  }

  Future<void> _connectWebSocket() async {
    final url = linkWebSocket;
    final headers = {
      'authorization': 'Bearer $token',
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

  Future<ElectionResult> getDataAfterEventEnd() async {
    final headers = {
      'authorization': 'Bearer $token',
    };
    String endpoint = "election";
    var result = await api.get(endPoint: endpoint, headerRequst: headers);

    log("1111111111");
    log(result.toString());
    return ElectionResult.fromJson(result);
  }

  @override
  void dispose() {
    log("websocket is cancel");
    channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return channel == null
        ? const Padding(
            padding: EdgeInsets.only(
              top: 12,
            ),
            child: BuildCandidategRusltShimmer(),
          )
        : StreamBuilder(
            stream: channel!.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const BuildCandidategRusltShimmer();
              } else if (snapshot.hasData) {
                var data = jsonDecode(snapshot.data as String);
                List<Results> results = (data['results'] as List)
                    .map((item) => Results.fromJson(item))
                    .toList();

                return BodyWhenDataCame(
                  results: results,
                  totalCount: data['totalCount'],
                  end: false,
                );
              } else {
                return FutureBuilder<ElectionResult>(
                  future: getDataAfterEventEnd(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                        child: BuildCandidategRusltShimmer(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child:
                              Center(child: Text('Error: ${snapshot.error}')));
                    } else if (!snapshot.hasData) {
                      return const Center(
                          child: Center(child: Text('No data available')));
                    } else {
                      ElectionResult data = snapshot.data!;
                      return BodyWhenDataCame(
                        totalCount: data.data!.results!.totalCount!,
                        results: data.data!.results!.results!,
                        end: true,
                      );
                    }
                  },
                );
              }
            },
          );
  }
}
