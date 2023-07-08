import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({Key? key}) : super(key: key);

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {

  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.45,
                      child: Text('select your country ',style: TextStyle(fontSize: 20,))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.cyan)
                      ),
                      child: CountryCodePicker(
                        onChanged: (value) {
                          debugPrint(value.toLongString());
                          country=value.toString();
                        },
                        initialSelection: 'JO',
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        showDropDownButton: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(height: 20,),
              if(country!=null)...[

              ]
            ],
          ),
        ),

    );
  }
}