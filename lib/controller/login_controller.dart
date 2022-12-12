import 'package:chatbot_template/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var displayName = '';
  var loggedIn = false;

  User? get userProfile => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  void signIn(String email, String password) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      print(user.user?.uid);
      Get.snackbar('success', 'success',
          snackPosition: SnackPosition.TOP,
          backgroundColor: kBlackColor,
          colorText: kBackgroundColor);

      loggedIn = true;
      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kBlackColor,
          colorText: kBackgroundColor);
    } catch (e) {
      Get.snackbar(
        'Error occured!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kBlackColor,
        colorText: kBackgroundColor,
      );
    }
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
    loggedIn = false;
    update();
  }
}
