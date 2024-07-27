import 'package:flutter/material.dart';
import 'package:weather_task/utils/colors.dart';
import 'package:weather_task/viewModel/phone_number_verify_controller.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {

    TextEditingController otpController = TextEditingController();
    Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(title: const Text("Otp Screen"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Otp',
                    suffixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.MainColor),
                  fixedSize: const MaterialStatePropertyAll(Size(150, 30)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                auth.otpverificationController(verificationId, otpController, context);
              },
              child: const Text(
                "Signup",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ))
        ],
      ),
    );
  }
}