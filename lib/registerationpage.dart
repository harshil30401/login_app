
import 'package:flutter/material.dart';

import 'googlesigninbutton.dart';
AppBar pageAppBar(String title) {
  return AppBar(
    title: Text(title),
  );
}
Widget formButton(BuildContext context,
    {IconData iconData, String textData, Function onPressed}) {
  return RaisedButton(
    onPressed: onPressed,
    color: Theme.of(context).accentColor,
    padding: EdgeInsets.only(
      top: 8,
      bottom: 8,
      left: 48,
      right: 48,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          // Icons.lock_open,
          iconData,
        ),
        SizedBox(
          width: 4,
        ),
        Text(textData),
      ],
    ),
  );
}

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() {



    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: pageAppBar("Register Page"),
        body: Builder(
          builder: _registerPageForm,
        ));
  }

  Widget _registerPageForm(BuildContext context) {
    TextEditingController _passwordRegisterPageController1 =
    new TextEditingController();
    TextEditingController _passwordRegisterPageController2 =
    new TextEditingController();
    TextEditingController _emailRegisterPageController =
    new TextEditingController();

    return Form(
        key: _registerFormKey,
        child: ListView(
          padding: EdgeInsets.all(32.0),
          children: <Widget>[
            Center(
              child: Icon(
                Icons.people,
                size: 128,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _emailRegisterPageController,
              validator: (String content) {
                if (content.contains('@')) {
                  if (content.length == 0) {
                    return 'Please enter your Email ID';
                  } else {
                    return null;
                  }
                } else {
                  return 'Please enter a VALID Email ID';
                }
              },
              decoration: InputDecoration(
                  labelText: "Email ID",
                  hintText: "Enter your Email ID",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passwordRegisterPageController1,
              obscureText: true,
              validator: (String content) {
                if (content.length < 8) {
                  return 'Minimum 8 DIGIT password';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Enter Password",
                hintText: "Enter Your Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            TextFormField(
              controller: _passwordRegisterPageController2,
              obscureText: true,
              validator: (String content) {
                if (content.length < 8) {
                  return 'Minimum 8 DIGIT password';
                } else if (_passwordRegisterPageController2.text !=
                    _passwordRegisterPageController1.text) {
                  return 'Password not match';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Retype Password",
                hintText: "Retype Your Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            formButton(context,
                iconData: Icons.verified_user,
                textData: "  Register", onPressed: () async {
                  if (_registerFormKey.currentState.validate()) {
                    try {
                      _registerFormKey.currentState.save();
                      createUserWithEmail(_emailRegisterPageController.text, _passwordRegisterPageController1.text).then((_){
                        print("Registered successful");
                        Navigator.pop(context);
                      });
                    } catch(e){
                      print("something happened");
                    }
                    }


                    // try {
                    //   Auth()
                    //       .signUp(_emailRegisterPageController.text,
                    //           _passwordRegisterPageController1.text)
                    //       .then((value) {
                    //     Scaffold.of(context)
                    //         .showSnackBar(SnackBar(content: Text("User created ")));
                    //     Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => HomePage()),
                    //     );
                    //   });
                    // } catch (error) {
                    //   Scaffold.of(context).showSnackBar(SnackBar(
                    //       content: Text("Error in registering new user ")));
                    // }
                    // }
                  }
                ),
          ],
        ));
  }
}
