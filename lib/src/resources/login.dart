import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homebody/src/modules/model.dart' as model;

Future<model.User> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if (googleUser?.email == "") {
    // print(object)
  }
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  return model.User(
    id: userCredential.user?.email ?? model.InvalidUserInfo().id,
    name: userCredential.user!.displayName ?? '',
    image: userCredential.user!.photoURL ?? '',
    date: DateTime.now().toString(),
  );
}
