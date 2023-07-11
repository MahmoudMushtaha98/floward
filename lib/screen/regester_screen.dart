import 'package:csc_picker/csc_picker.dart';
import 'package:floward/model/user_model.dart';
import 'package:floward/widget/textbutton_widget.dart';
import 'package:flutter/material.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key? key}) : super(key: key);

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {

  final TextEditingController location=TextEditingController();
  final TextEditingController username=TextEditingController();
  final TextEditingController password=TextEditingController();

  String countryValue='';
  List<String> optionsA = ['Site','Option A1', 'Option A2', 'Option A3'];
  List<String> optionsB = ['warehome','Option B1', 'Option B2', 'Option B3'];
  String? selectedOptionA='Site';
  String? selectedOptionB='warehome';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Create User',style: TextStyle(color: Colors.cyan[900],fontSize: 40)),
                Column(
                  children: [
                    const SizedBox(height: 30,width: double.infinity,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CSCPicker(
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: buildContainer(context,optionsA,selectedOptionA!),
                    ),
                    const SizedBox(height: 20,),
                    if(!selectedOptionA!.contains('Site'))...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: buildContainer(context,optionsB,selectedOptionB!),
                      )
                    ],
                    const SizedBox(height: 20,),
                    if(!selectedOptionB!.contains('warehome'))...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 42,
                        child: TextFormField(
                          controller: location,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Color.fromRGBO(0, 140, 158, 1)),
                          decoration: const InputDecoration(
                            label: Text(
                              'Location',
                              style: TextStyle(
                                color: Colors.grey,),
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
                        height: 42,
                        child: TextFormField(
                          controller: username,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Color.fromRGBO(0, 140, 158, 1)),
                          decoration: const InputDecoration(
                            label: Text(
                              'Username',
                              style: TextStyle(
                                  color: Colors.grey,),
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
                        height: 42,
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Color.fromRGBO(0, 140, 158, 1)),
                          decoration: const InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.grey,),
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
                  UserModel userModel=UserModel(country: countryValue,
                      site: selectedOptionA.toString(),
                      warehouse: selectedOptionB.toString(),
                      location: location.text,
                      username: username.text,
                      password: password.text);
                  Navigator.pop(
                      context,
                      userModel);
                }, height: 50, width: MediaQuery.of(context).size.width*0.5, text: 'regester', color: Colors.cyan[900], colorText: Colors.white)
              ],
            ),
          ),
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
        value: selectOption,
        style: TextStyle(color: Colors.grey[700]),
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black),
        isExpanded: true,
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option,style: const TextStyle(color: Colors.grey)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            if(optionsA.contains(newValue)) {
              selectedOptionA = newValue;
              if (!newValue!.contains('Site')) {
                optionsA.remove('Site');
              }
            }else {
              selectedOptionB = newValue;
              if (!newValue!.contains('warehome')) {
                optionsA.remove('warehome');
              }
            }
          });
        },
      ),
    );
  }
}
