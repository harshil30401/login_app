import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login_app/Widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'edit.dart';
AppBar pageAppBar(String title) {
  return AppBar(
    title: Text(title),
  );
}
Widget formButton(BuildContext context,
    {IconData iconData, String textData, Function onPressed}) {


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
    );

    return RaisedButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),

    );

}
//class ProfilePage extends StatelessWidget {
//
//}
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("User Profile"),
//      ),
//      body: Profile(),
//    );
//  }
//}


class Profile extends StatefulWidget {
  final String user;
  final String uid;
  Profile({@required this.user,@required this.uid}):assert(user!=null || uid!=null);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> userDetails, userData;
  String user;


  String id, name, mobile, age;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  initState() {
    super.initState();

    setUserDetails();
    setSignIn();
    getUserData();
    fetchData();
  }

  void setUserDetails(){
    setState(() {
      user = widget.user;
      id = widget.uid;
//      userDetails = widget.userDetails;
    });
  }



//  Data() async {
//    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
//
//    final prefs = await SharedPreferences.getInstance();
//    setState(() {
//
//    }
//    );
//  }

  void fetchData() async {
//    user = await _auth.currentUser();
  user = widget.user;
    id = widget.uid;

    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
    firebaseDatabase.reference().child('users').child(id);
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      setState(() {
        name = dataSnapshot.value['name'];
        // mobile = dataSnapshot.value['mobile'];
        age = dataSnapshot.value['age'];
      });
    });
  }

  void setSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('isSignIn', true);
      prefs.setStringList('UserDetails', [widget.uid,widget.user]);
    });
  }

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userData = prefs.getStringList('UserData') ?? null;
    });

    if (userData == null) {
      setState(() {
        userData = ['your name', 'your age'];
      });
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Profile Page"),),
        body: Container(
          padding: EdgeInsets.all(12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(


                  child: Text(
                    'Profile Page',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(

                child: Card(
                  color: Colors.blueAccent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        //Image.asset('assets/images.1.png'),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          children: <Widget>[
                            Container(

                              child: Text(
                                'Email:',

                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.user ?? 'Enter your email',

                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 75,
                              child: Text(
                                'Name:',

                              ),
                            ),
                            Flexible(
                              child: Text(
                                name ?? 'your name..',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff2b2d42),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 75,
                              child: Text(
                                'Age:',

                              ),
                            ),
                            Flexible(
                              child: Text(
                                age ?? 'Enter age...',

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        padding: EdgeInsets.symmetric(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile(id: widget.uid,))

                          ).then((_){
                            setState(() {
                              fetchData();
                            });
                          });
                        },
                        child: const Text(
                          'Edit Profile',

                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 45, vertical: 15),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetHomePage()),
                          );
                        },
                        child: const Text(
                          'Widgets',

                        ),
                      ),

                    ],
                  ),
                ],
              ),
              Divider(
                endIndent: 10,
                indent: 10,
                height: 30,
                thickness: 5,
                color: Colors.black,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.lightBlueAccent,
                      padding: EdgeInsets.symmetric(),


                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },

                      child: const Text(
                        'Log Out',

                      ),

                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    }

}