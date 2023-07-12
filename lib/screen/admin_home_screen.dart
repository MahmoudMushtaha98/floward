import 'package:floward/model/user_model.dart';
import 'package:floward/screen/regester_screen.dart';
import 'package:floward/widget/textbutton_widget.dart';
import 'package:floward/widget/user_widget.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  List<UserModel> userModels=[];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.80,),
                Column(
                  children: [
                  const SizedBox(height: 20,),
                  if(userModels.isEmpty)...[
                    Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height*0.80,
                        child:  const Text('Add Users...',style: TextStyle(fontSize: 20,))
                    ),]else...[
                    Column(
                      children: [
                        Column(
                          children: List.generate(userModels.length, (index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                                  },
                                    child: UserWidget(username: userModels[index].username)
                                ),
                                const SizedBox(height: 30,)
                              ],
                            );
                          }),
                        )
                      ],
                    )
                  ],
                ],),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButtonWidget(
                  callback: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegesterScreen(),)).then((value) {
                      setState(() {
                        userModels.add(value);
                      });
                    },);
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
      ),
    );
  }
}
