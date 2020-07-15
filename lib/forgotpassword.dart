import 'package:flutter/material.dart';
import 'package:login_app/googlesigninbutton.dart';


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
Widget snackbar(BuildContext context,String text){
  return Scaffold(
    body: SnackBar(content:
    Text(text),
      duration: Duration(seconds: 2),),
  );
}


class ResetPasswordPage extends StatefulWidget {
  _ResetPasswordPageState createState() {
    return _ResetPasswordPageState();
  }
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: pageAppBar("Reset Password"),
        body: Builder(
          builder: _resetPasswordPageForm,
        ));
  }

  Form _resetPasswordPageForm(BuildContext context) {
    final _resetPasswordFormKey = GlobalKey<FormState>();
    TextEditingController _emailResetPasswordPageController =
    new TextEditingController();

    return Form(
        key: _resetPasswordFormKey,
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
              controller: _emailResetPasswordPageController,
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
            SizedBox(
              height: 16,
            ),
            formButton(context,
                iconData: Icons.lock_open,
                textData: "Reset Password", onPressed: () async {
                  if (_resetPasswordFormKey.currentState.validate()) {
                    try{
                      resetPassword(_emailResetPasswordPageController.text).then((_){
                        Navigator.pop(context);
                      });

                    }catch(error){
                      snackbar(context, error);
                    }
                    // _resetPasswordFormKey.currentState.save();
                    // try{
                    //   Auth().resetPassword(_emailResetPasswordPageController.text);
                    //   // Scaffold.of(context)
                    //   //       .showSnackBar(SnackBar(content: Text("User created ")));
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => HomePage()),
                    //     );
                    // }catch(error){
                    //   Scaffold.of(context).showSnackBar(
                    //     SnackBar(content: Text("reset password failed")));
                    // }
                  } else {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Enter valid email ID")));
                  }
                }),
          ],
        ));
  }
}



