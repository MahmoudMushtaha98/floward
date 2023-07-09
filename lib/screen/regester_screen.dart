import 'package:csc_picker/csc_picker.dart';
import 'package:floward/widget/textbutton_widget.dart';
import 'package:flutter/material.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key? key}) : super(key: key);

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {

  String countryValue='';
  List<String> optionsA = ['Site','Option A1', 'Option A2', 'Option A3'];
  List<String> optionsB = ['HomeWhere','Option A1', 'Option A2', 'Option A3'];
  String? selectedOptionA = 'Site';
  String? selectedOptionB = 'HomeWhere';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Create User',style: TextStyle(color: Colors.cyan[900],fontSize: 40)),
            Column(
              children: [
                const SizedBox(height: 30,width: double.infinity,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: CSCPicker(
                    countryDropdownLabel: 'legal entity',
                    selectedItemStyle: const TextStyle(color: Colors.grey),
                    dropdownDecoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: const Color.fromRGBO(0, 140, 158, 1))
                    ),
                    showCities: false,
                    showStates: false,
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged:(value) {
                    },
                    onCityChanged:(value) {
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                buildContainer(context,optionsA,selectedOptionA!),
                const SizedBox(height: 20,),
                if(!selectedOptionA!.contains('Site'))...[
                  buildContainer(context,optionsB,selectedOptionB!)
                ],
                const SizedBox(height: 20,),
                if(!selectedOptionB!.contains('HomeWhere'))...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width*0.7,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: const Color.fromRGBO(0, 140, 158, 1))
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Location',style: TextStyle(color: Colors.grey)),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Color.fromRGBO(0, 140, 158, 1)),
                      decoration: const InputDecoration(

                        label: Text(
                          'Username',
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
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
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
                ],
              ],
            ),
            TextButtonWidget(callback: () {
              Navigator.pop(context);
            }, height: 50, width: MediaQuery.of(context).size.width*0.5, text: 'regester', color: Colors.cyan[900], colorText: Colors.white)
          ],
        ),
      ),

    );
  }

  Container buildContainer(BuildContext context,List<String> options,String selectOption) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width*0.7,
      height: 42,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: const Color.fromRGBO(0, 140, 158, 1))
      ),
      child: DropdownButton<String>(
        style: TextStyle(color: Colors.grey[700]),
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black),
        isExpanded: true,
        value: selectOption,
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option,style: const TextStyle(color: Colors.grey)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            if(selectOption.contains('Site')) {
              selectedOptionA = newValue;
            } else {
              selectedOptionB=newValue;
            }
          });
        },
      ),
    );
  }
}
