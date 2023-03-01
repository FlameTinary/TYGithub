import 'package:flutter/material.dart';
import 'package:tygithub/widgets/Dynamic/dynamic_cell.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return DynamicCell();
        },
        itemCount: 100,
      ),
    );
  }
}
