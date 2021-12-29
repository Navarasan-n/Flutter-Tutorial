import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();

  String? _gender;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                hintText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                prefixIcon: Icon(Icons.supervised_user_circle_rounded),
              ),
            ),
            SizedBox(height: 20.0),

            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                hintText: "Last Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20.0),

            _genderField(size),

            SizedBox(height: 20.0),

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20.0),

            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Phone",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                print("submit");
                print(_firstNameController.text);
                print(_lastNameController.text);
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  Widget _genderField(Size size) {
    return Row(
      children: [

        Container(
          width: (size.width / 2) - 50.0,
          child: RadioListTile(
            title: Text("Male"),
            value: "male",
            groupValue: _gender,
            onChanged: (String? str) {
              print(str);
              setState(() {
                _gender = str;
              });

            },
          ),
        ),

        SizedBox(
            width: 10.0
        ),

        Container(
          width: (size.width / 2) - 50.0,
          child: RadioListTile(
            title: Text("Female"),
            value: "female",
            groupValue: _gender,
            onChanged: (String? str) {
              print(str);
              setState(() {
                _gender = str;
              });
            },
          ),
        ),
      ],
    );
  }
}
