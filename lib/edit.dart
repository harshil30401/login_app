import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_app/main.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: EditProfile(id: null,),
    );
  }
}

class EditProfile extends StatefulWidget {
  final String id;
  EditProfile({@required this.id});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  List storedData = ['', '', '', ''];
  var id;
  @override
  void initState() {
    super.initState();
//    _loadData();
  }

  _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      storedData = prefs.getStringList('my_string_list_key');
      id = storedData[1];
      if (id == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  void _edit(String name, String age) {
    if (_formKey.currentState.validate()) {
      FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
      DatabaseReference databaseReference =  firebaseDatabase.reference();
      databaseReference.child(id).set({
        'name': name,
        'age': age,
      }).then((value) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            "Edit Successful",
          ),
        ));
        Navigator.pop(context);
      }).catchError((onError) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Edit Unsuccessful",
            ),
          ),
        );
      });
    }
  }


  String numberValidator(String value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '$value is not a valid number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 50.0),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  // ignore: missing_return
                  validator: (String value) {
                    if(value.length==0){
                      return 'ADD PROPER NAME';
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                  validator: numberValidator,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue,
                      padding:
                      EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      onPressed: () {
//                        Scaffold.of(context).showSnackBar(
//                          SnackBar(
//                            content: Text(
//                              "Checking",
//                            ),
//                          ),
//                        );
                        _edit(nameController.text, ageController.text);
                        Navigator.pop(context);

                      },
                      child:  Text(
                        'Done',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }


}