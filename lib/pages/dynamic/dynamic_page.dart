import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tygithub/common/ty_http.dart';
import 'package:tygithub/widgets/Dynamic/dynamic_cell.dart';
import 'package:tygithub/api/apis.dart';
import 'package:tygithub/models/dynamic/event.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  List<TYEvent> _events = [];

  @override
  void initState() {
    super.initState();
    _getEvents().then(
      (value) => setState(() {
        _events = value;
      }),
      onError: (error) => print(error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _events.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                TYEvent event = _events[index];
                return DynamicCell(
                  event: event,
                );
              },
              itemCount: _events.length,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // 获取动态数据
  Future<List<TYEvent>> _getEvents() async {
    Options options = Options(
      headers: {
        'Accept': 'application/vnd.github.v3+json',
      },
    );
    final response = await TYHttp().get(
      TYApi.getEventReceived('FlameTinary'),
      options: options,
    );
    if (response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      return data.map((json) => TYEvent.fromJson(json)).toList();
    } else {
      throw Exception(response.data);
    }
  }
}
