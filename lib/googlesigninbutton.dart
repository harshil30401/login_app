import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();


Future<List> signInWithGoogle() async {
  List userDetails;
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  userDetails = [currentUser.uid, currentUser];
  // userDetails = [user.uid,user.email];
  print(userDetails);

  return userDetails;
}

void signOutGoogle() async {
  await _googleSignIn.signOut();
  print("User Sign Out");
}



Future<FirebaseUser> handleSignIn() async {
  FirebaseUser user;
  bool isSignedIn = await _googleSignIn.isSignedIn();
  if (isSignedIn) {
    user = await _auth.currentUser();
  } else {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.idToken);
    user = (await _auth.signInWithCredential(credential)).user;
  }

  return user;
}



Future<List> signInWithEmail(String _email, String _password) async {

  List<String> userDetails, loginDetails;
  await _auth
      .signInWithEmailAndPassword(email: _email, password: _password)
      .then((AuthResult result) async {
    final prefs = await SharedPreferences.getInstance();
    userDetails = [result.user.uid, result.user.email];
    loginDetails = [_email, _password];
    // prefs.setStringList('UserDetails',userDetails);

    // LocalStorage().saveUserDetails(userDetails)
    // .then((_) async {
    //   await LocalStorage().saveLogInDetails(loginDetails);
    // }
    // );
  });
  // print("In Firebase function userdetails as $userDetails");
  return userDetails;
}

Future<void> signOutEmail() async {
  await _auth.signOut();
}

Future<void> createUserWithEmail(String _email, String _password) async {
  await _auth.createUserWithEmailAndPassword(
      email: _email, password: _password);
}

Future<void> resetPassword(String _email) async {
  await _auth.sendPasswordResetEmail(email: _email);
}
