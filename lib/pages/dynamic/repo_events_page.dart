import 'package:flutter/material.dart';
import 'package:tygithub/models/dynamic/event.dart';

class RepoEventsPage extends StatefulWidget {
  const RepoEventsPage({super.key});

  @override
  State<RepoEventsPage> createState() => _RepoEventsPageState();
}

class _RepoEventsPageState extends State<RepoEventsPage> {
  @override
  Widget build(BuildContext context) {

    // 获取路由传值
    TYEvent event = ModalRoute.of(context)!.settings.arguments as TYEvent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repo Events Page'),
      ),
      body: const Placeholder(),
    );
  }
}