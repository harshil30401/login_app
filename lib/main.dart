
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import"package:login_app/googlesigninbutton.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/registerationpage.dart';
import 'package:login_app/forgotpassword.dart';
import 'package:login_app/profilepage.dart';
import 'package:login_app/edit.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();


  final FirebaseAuth _auth = FirebaseAuth.instance;
//  Future<List <dynamic>> userDetails;
  List<dynamic> userDetails;
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
                          controller: userController,
                          decoration: new InputDecoration(labelText: "Enter Email"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>value.isEmpty?'email':null,
                            onSaved:(value)=>_email=value,

                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new TextFormField(
                            controller: passController,
                            decoration:
                            new InputDecoration(labelText: "Enter Password"),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                              validator: (value) =>value.isEmpty?'password':null,
                              onSaved:(value)=>_password=value,
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(20.0),
                        ),
                        new RaisedButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            onPressed:  ()async {
                                             print(userController.text + passController.text);
    //TEST CODE
                                             FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
                                                  AuthResult authResult = await _firebaseAuth
                                                  .signInWithEmailAndPassword(email: userController
                                                  .text, password: passController.text);
                                                  FirebaseUser user = authResult.user;
                                                  if (user == null) {return;}
                               else     {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Profile(uid: (authResult.user.uid).toString(),user: (authResult.user.email).toString(),)
                                    ),
                                    );
                                    }}
                                                  ),


                    new RaisedButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("Newuser"),
                    onPressed:  (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage(),
                                                  ),
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
                        new RaisedButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("google signin"),
                            onPressed:  ()async{userDetails= await signInWithGoogle();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Profile(uid:userDetails[0],user: userDetails[1],),
                                ),
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
