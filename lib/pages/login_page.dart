import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  double? _deviceheight , _devicewidth;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String? _email,_password;

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
                _loginform(),
                _loginbutton(),
                _registerPageLink(),
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
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget _loginbutton() {
  return MaterialButton(
    onPressed: _loginuser,
    minWidth: _devicewidth! * .7,
    height:_deviceheight! * .1,
    color: Color.fromARGB(255, 30, 203, 36),
    child: 
      const Text(
        "Login!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25
        ),
      )
    
  );
}

Widget _loginform() {
  return Container(
    height: _deviceheight! * .2,
    child: Form(
      //a key in a form contains the data that will ge filled in it 
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _emailTextfield(),
          _passTextfield() 
        ],
      )
  )
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

void _loginuser() {
  print(_loginFormKey.currentState!.validate());
  if(_loginFormKey.currentState!.validate()) {
    _loginFormKey.currentState!.save();
  }
}
Widget _registerPageLink() {
  return GestureDetector(

    //here pushNames is used to push the register page on top of the current page 
    //that we can now go back from the register page by clicking the back button
    onTap: () => Navigator.pushNamed(context, 'register'),
    child: const Text(
      "Don't have an account?",
      style: TextStyle(
        color: Color.fromARGB(255, 65, 169, 255),
        fontSize: 15,
      ),
    )
  );
} 
}