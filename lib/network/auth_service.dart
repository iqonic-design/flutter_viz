import 'package:flutter_viz/main.dart';
import 'package:flutter_viz/model/login_response.dart';
import 'package:flutter_viz/network/rest_apis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

Future<LoginResponse?> signInWithGoogle() async {
  GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await auth.signInWithCredential(credential);
    final User user = authResult.user!;

    assert(!user.isAnonymous);

    final User currentUser = auth.currentUser!;
    assert(user.uid == currentUser.uid);

    signOutGoogle();
    LoginResponse? loginResponse;
    Map req = {
      "email": currentUser.email,
      "name": currentUser.displayName,
    };
    await googleLogin(req).then((value) async {
      loginResponse = value;
    }).catchError((e) {
      throw e;
    });
    return loginResponse;
  } else {
    throw errorSomethingWentWrong;
  }
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
}
