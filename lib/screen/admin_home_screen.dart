import 'package:floward/screen/regester_screen.dart';
import 'package:floward/widget/textbutton_widget.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              //todo add Listview.builder to add users
              width: double.infinity,
              child: Text('no users...'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButtonWidget(
                  callback: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegesterScreen(),));
              },
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.5,
                  text: 'regester',
                  color: Colors.cyan[900],
                  colorText: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
