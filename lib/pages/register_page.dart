import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceheight , _devicewidth;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  String? _name,_password,_email;

  File? _image;

  @override
  Widget build(BuildContext context) {
    _deviceheight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
   return Scaffold(
      body:
      SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _devicewidth! * .05
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _titletext(),
                // _loginform(),
                    _profilePic(),
                    _registerform(),
                 
                _registerbutton(),   
                // _registerPageLink(),
              ],
            ),
          )
          )
        )
    );
  }

  Widget _titletext() {
  return const Text(
    "Finstagram",
    style: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _registerbutton() {
  return MaterialButton(
    onPressed: _registeruser,
    minWidth: _devicewidth! * .7,
    height: _deviceheight! * .07,
    color: const Color.fromARGB(255, 11, 94, 161),
    child: const Text(
      "Register",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _registerform() {
  return Container(
    height: _deviceheight! * .25,
    child: Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _namefield(),
          _emailTextfield(),
          _passTextfield()
        ],
      ) 
      ),
    
  );
}

Widget _namefield() {
  return TextFormField(
    decoration: const InputDecoration(hintText: "Enter your name"),
    validator: (_value) => _value!.length > 0 ? null : "Enter a valid name",
    onSaved: (_value) {
      setState(() {
         _name = _value;
      });
    },
  );
}

Widget _emailTextfield() {
  return TextFormField(
    decoration: const InputDecoration(hintText: "Enter your email"),
    onSaved: (_value) {
      setState(() {
        _email =_value;
      });
    },
    
    validator: (_value) {
      bool _result = _value!.contains(
        RegExp(
           r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
          ),
      );
      return _result ? null : "Enter the email correctly";
    },
  );
}

Widget _passTextfield() {
  return TextFormField(
    //to make the password text not visible
    obscureText: true,
    decoration: const InputDecoration(hintText: "Enter your password"),
    onSaved: (_value) {
      setState(() {
        _password =_value;
      });
    },
    //to give an error if the requirements are not met 
    validator: (_value) =>
      _value!.length > 6 ? null : "Password length should be more than 8 characters",
      
    );
}

void _registeruser() {
  print(_registerFormKey.currentState!.validate());
  if(_registerFormKey.currentState!.validate()) {
    _registerFormKey.currentState!.save();
  }
}

Widget _profilePic() {
  var _imagepath = _image != null ? FileImage(_image!) : const NetworkImage("https://i.pravatar.cc/150?img=3");
  return GestureDetector(
    onTap: () {
      //file picker is used to take files from pc 
      //so for this we need to give a variable to store the file 
      // and the variable should be of the type File from dart:io not from dart:html
      FilePicker.platform.pickFiles(
        type: FileType.image
        ).then((_result) {
        setState(() {
          _image = File(_result!.files.first.path!);
        });
        });
    },
    child: Container(
      height: _deviceheight! * .18,
      width: _devicewidth! * .30, 
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: _imagepath as ImageProvider,
        )
      ),
    ),
  );
}


}