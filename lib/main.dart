
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import"package:login_app/googlesigninbutton.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/registeration page.dart';
import 'package:login_app/forgotpassword.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final formKey= new GlobalKey<FormState>();
  List<String> userDetails;
  List loginDetails;
  FirebaseUser user;
  void validateAndSave(){
   final form=formKey.currentState;
   if(form.validate()){
     form.save();
     print("form is valid");
   }
     else{
     print("form is invalid");
   }

  }

  Widget signInButton(Function onPressed) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
//        backgroundColor: Colors.green,
//        body: new Stack(
//            fit: StackFit.expand,
//            children:<Widget> [
//              new Image(
//                image: AssetImage('assets/road1.jpg'),
//                fit: BoxFit.cover,
//                color: Colors.black87,
//                colorBlendMode: BlendMode.darken,


        body:      new ListView(
//                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlutterLogo(
                    size: 100.0,
                  ),
                  new Form(

                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>
                      [  new TextFormField(
                          decoration: new InputDecoration(labelText: "enter email"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>value.isEmpty?'email':null,
                            onSaved:(value)=>_email=value,

                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new TextFormField(
                            decoration:
                            new InputDecoration(labelText: "enter password"),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                              validator: (value) =>value.isEmpty?'password':null,
                              onSaved:(value)=>_password=value,
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(20.0),
                        ),
                        new MaterialButton(
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("login"),
                          onPressed: validateAndSave,
                        ),
                     
                        signInButton(() async {
                          final prefs = await SharedPreferences.getInstance();
                          await handleSignIn().then((value) {
                            setState(() {
                              user = value;
                              userDetails = [user.uid, user.email];
                            });
                            print(userDetails);
                            // LocalStorage().saveUserDetails(userDetails);
                            prefs.setStringList('UserDetails', userDetails);

                            // userDetails = await signInWithGoogle().whenComplete(() {
                            print("userDetails are as $userDetails");
                            print("Logged in successfully");



//                            Navigator.pushReplacement(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => LoginPage(
//                                      userDetails: userDetails,
//                                    )));
                          });
                        }),
                    new RaisedButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("Newuser"),
                    onPressed:  (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                    }
                    ),

                        new RaisedButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("forgotpassword"),
                            onPressed:  (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                              );
                            }
                        ),

                      ],

                    ),
                  )
                ],
              ),
            );



  }
}
