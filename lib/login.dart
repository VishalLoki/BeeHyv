import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'otp.dart';
import 'appcolor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _phoneFocusNode = FocusNode();
  bool _isLoading = false; // Added loading state

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_phoneFocusNode);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });

      final phoneNumber = '+91${_phoneController.text.trim()}';

      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {
            if (kDebugMode) {
              print(error.toString());
            }
            setState(() {
              _isLoading = false; // Stop loading
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to verify phone number.')),
            );
          },
          codeSent: (verificationId, forceResendingToken) {
            setState(() {
              _isLoading = false; // Stop loading
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(verificationId: verificationId),
              ),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {
            if (kDebugMode) {
              print("Auto Retrieval Timeout");
            }
            setState(() {
              _isLoading = false; // Stop loading
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP auto-retrieval timed out.')),
            );
          },
        );
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        setState(() {
          _isLoading = false; // Stop loading
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textFieldStyle = TextStyle(
      color: Colors.black,
    );

    const InputDecoration textFieldDecoration = InputDecoration(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.honeyColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.honeyColor),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.whiteBackColor,
      appBar: AppBar(
        backgroundColor: AppColors.honeyColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Your Phone',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 60),
                      TextFormField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        decoration: textFieldDecoration.copyWith(
                          labelText: 'Phone number',
                          labelStyle: const TextStyle(
                            color: AppColors.textFieldColor,
                            fontSize: 19,
                          ),
                          icon: const Icon(Icons.phone_sharp,
                              color: Colors.black),
                        ),
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.honeyColor,
                        style: textFieldStyle,
                        validator: (value) {
                          if (value == null || value.length != 10) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          _onSubmit();
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Please enter a 10-digit Indian phone number.',
                        style: TextStyle(
                          color: AppColors.textFieldColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Only Indian phone numbers are verified. Make sure your number is correct to receive the OTP.',
                        style: TextStyle(
                          color: AppColors.textFieldColor,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isLoading) // Show progress indicator when loading
              const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.honeyColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
