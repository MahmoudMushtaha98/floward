
import 'package:flutter/material.dart';

import '../widget/textbutton_widget.dart';
import 'login_screen.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  List<String> images = [
    'images/flower2.png',
    'images/hinsdale-store.jpg',
    'images/flower1.webp',
  ];
  List<String> prag = [
    'A flower shop is a wonderful place where you can find a delightful selection of beautiful and cheerful flowers.',
    'Whether you are looking for a single rose to gift to someone special or wanting to create a luxurious bouquet, the flower shop offers an inspiring shopping experience.',
    'You will discover various types of flowers in different colors with a delightful fragrance.',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children:[
          Container(
            height: MediaQuery.of(context).size.height*0.6,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Image.asset(
                images[currentIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            height: 80,
            child: Center(
              child: Text(
                prag[currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.cyan[900],fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((image) {
              int index = images.indexOf(image);
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentIndex ? Colors.cyan[900] : Colors.grey,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (currentIndex == images.length - 1) ...[
                const SizedBox(width: 10),
                TextButtonWidget(callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                },width: 70,height: 45,text: 'Skip',color: Colors.cyan[900],colorText: Colors.white),
              ]else ...[
                const SizedBox(width: 1,)
              ],
              SizedBox(width: MediaQuery.of(context).size.width*0.3,),
              TextButtonWidget(callback: () {
                setState(() {
                  currentIndex = (currentIndex + 1) % images.length;
                });
              },height: 45,width: 70,text: 'next',color: Colors.cyan[900],colorText: Colors.white),
              SizedBox(width: MediaQuery.of(context).size.width*0.2,),

            ],
          ),

        ],
      ),
    );
  }

}
