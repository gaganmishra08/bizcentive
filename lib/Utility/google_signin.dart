import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
class SignIn{
  final FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<FirebaseUser> signIn() async {
    try {
    GoogleSignInAccount gAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gAuth = await gAccount.authentication;
    AuthCredential gCredential = GoogleAuthProvider.getCredential(
        idToken: gAuth.idToken, accessToken: gAuth.accessToken);
    final AuthResult authResult = await auth.signInWithCredential(gCredential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(user.getIdToken() != null);
    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    return user;
  }
    catch(e){
    Get.snackbar('Error', e.toString());
    }

  }
  Future<FirebaseUser> signInWithEmail(String email, String password) async{
    try {
      final AuthResult authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(!user.isEmailVerified);
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);


      return user;
    }
    catch(e){
      Get.snackbar('Error', e.toString());
    }


  }
  Future<FirebaseUser> signUpWithEmail(String email, String password) async{
    try {
      final AuthResult authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final FirebaseUser user = authResult.user;
      assert(!user.isAnonymous);
      assert(!user.isEmailVerified);
      assert(user != null);
      return user;
    }
    catch(e){
      Get.snackbar('Error', e.toString());
    }


  }
  signOut() async {
    await auth.signOut();
    await _googleSignIn.signOut();
    print(_googleSignIn.currentUser.toString());
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await auth.currentUser();
    return user;}
}
