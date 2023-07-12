import 'package:floward/widget/grid_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> data=[
    'Transfer',
    'Po Receive',
    'On Head',
    'Count'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100,left: 8,right: 8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 7/8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GridViewWidget(
              gridTitle: data[index],
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
