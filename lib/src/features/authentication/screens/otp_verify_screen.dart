import 'package:bulkwork/src/features/authentication/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../utils/utils.dart';

class OtpVerify extends StatefulWidget {
  final String verificationId;
  const OtpVerify({super.key, required this.verificationId});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  bool isLoading = false;
  final otpController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void verifyOtp() async {
    setState(() {
      isLoading = true;
    });
    final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otpController.text);

    try {
      await auth.signInWithCredential(credential);
      if (context.mounted) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/otp.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Text(
                  "Enter the one time password sent to \n your mobile number",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: 20,
                      right: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    controller: otpController,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.password),
                      hintText: "Enter 6 digit Otp",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4),
                  child: ElevatedButton(
                    onPressed: () => verifyOtp(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 36, 70, 222),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    ),
                    child: isLoading
                        ? SizedBox(
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            height: 20,
                            width: 20,
                          )
                        : Text(
                            "Verify otp",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.56,
                ),
                child: Center(
                  child: TextButton(
                    child: Text(
                      "Resend otp",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
