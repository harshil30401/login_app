import 'package:flutter/material.dart';

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

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Stack(
        fit: StackFit.expand,
        children:<Widget> [
          new Image(
          image: AssetImage('assets/road.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,

    ),
new Column(
  mainAxisAlignment: MainAxisAlignment.center,
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
                                ),
                     new TextFormField(
                                  decoration:
                                      new InputDecoration(labelText: "enter password"),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                new Padding(
                                    padding: const EdgeInsets.all(20.0),
                                ),
                                new MaterialButton(
                                  color: Colors.teal,
                                    textColor: Colors.white,
                                    child: new Text("login"),
                                    onPressed: () =>{},
                                    ),


                              ],
                            ),
                          )
                        ],
               ),
             ])
                );


              }
            }
