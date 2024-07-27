import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_task/views/Authentication/otpscreen.dart';
import 'package:weather_task/views/main_screen/main_screen.dart';

class Auth {
  Future<void> phoneverificationController(
      TextEditingController phoneController, BuildContext context) async {
    print("Starting phone verification");
    ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please wait...')),
        );

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        // Handle automatic code retrieval or manual code input.
        print("Verification completed automatically.");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Verification failed: ${e.message}')),
        );
      },
      codeSent: (String verificationId, int? resendToken) async{
        print("Code sent to ${phoneController.text}");
       await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Auto retrieval timeout: $verificationId");
      },
    );
  }

  Future<void> otpverificationController(
      String verificationId, TextEditingController otpController, BuildContext context) async {
    try {
      print("Starting OTP verification");
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        print("OTP verification successful");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      });
    } catch (e) {
      print("Error during OTP verification: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during OTP verification: $e')),
      );
    }
  }
}
