import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
class AuthRepository{
  Future<UniversalData> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> logOutUser() async {
    try {
      await StorageRepository.deleteString(StorageKeys.pinCode);
      await StorageRepository.deleteBool(StorageKeys.welcomeDone);
      await FirebaseAuth.instance.signOut();
      return UniversalData(data: "User Logged Out");
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

}