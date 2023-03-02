import 'package:flutter/material.dart';
import 'package:tygithub/widgets/trend/trend_cell.dart';

class TrendPage extends StatefulWidget {
  const TrendPage({super.key});

  @override
  State<TrendPage> createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TrendCell();
        },
        itemCount: 100,
      ),
    );
  }
}
