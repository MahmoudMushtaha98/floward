import 'package:floward/widget/textbutton_widget.dart';
import 'package:flutter/material.dart';

import 'admin_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/cfe44b43-9be6-4985-89a7-db3b56d0fbe7.jpg'),
            Image.asset('images/1c755d78-7404-473f-a7bb-96c6a16480ed.jpg'),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Color.fromRGBO(0, 140, 158, 1)),
                    decoration: const InputDecoration(

                      label: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 140, 158, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Color.fromRGBO(0, 140, 158, 1)),
                    decoration: const InputDecoration(
                      label: Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 140, 158, 1),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextButtonWidget(callback: () {

                      }, height: 50, width: 145, text: 'forgot password',color: Colors.white,colorText: const Color.fromRGBO(0, 140, 158, 1),),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.1,)
                  ],
                )
              ],
            ),
            const SizedBox(height: 40,),
            TextButtonWidget(callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomeScreen(),));
            }, height: 50, width: MediaQuery.of(context).size.width*0.5, text: 'login', color: Colors.cyan[900], colorText: Colors.white)
          ],
        ),
      ),
    );
  }
}
