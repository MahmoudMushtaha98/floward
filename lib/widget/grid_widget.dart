import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
   GridViewWidget({Key? key, required this.gridTitle}) : super(key: key);

  final String gridTitle;

  double a=180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: a,
            height: a,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.cyan[900],

            ),
          ),
          Container(
          width: a,
          height: a,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),

          ),
          child: Text(
            gridTitle,
            style: const TextStyle(color: Colors.white,fontSize: 20,shadows: [

            ]),
          ),
        ),]
      ),
    );
  }
}
