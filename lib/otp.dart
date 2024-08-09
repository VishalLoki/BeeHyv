import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'createaccount.dart';
import 'appcolor.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
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
    _otpController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });

      try {
        final cred = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: _otpController.text,
        );
        await FirebaseAuth.instance.signInWithCredential(cred);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Createaccount(),
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to verify OTP. Please try again.')),
        );
      } finally {
        setState(() {
          _isLoading = false; // Stop loading
        });
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
          'Confirmation Code',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: TextSelectionTheme(
              data: TextSelectionThemeData(
                cursorColor: AppColors.honeyColor,
                selectionColor: AppColors.honeyColor.withOpacity(0.3),
                selectionHandleColor: AppColors.honeyColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 60),
                        TextFormField(
                          controller: _otpController,
                          focusNode: _phoneFocusNode,
                          decoration: textFieldDecoration.copyWith(
                            labelText: 'Code',
                            labelStyle: const TextStyle(
                              color: AppColors.textFieldColor,
                            ),
                            icon: const Icon(Icons.lock_sharp,
                                color: Colors.black),
                          ),
                          keyboardType: TextInputType.number,
                          cursorColor: AppColors.honeyColor,
                          style: textFieldStyle,
                          validator: (value) {
                            if (value == null || value.length != 6) {
                              return 'Invalid Confirmation Code';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            _onSubmit();
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'We have sent the code to the Phone number.',
                          style: TextStyle(
                            color: AppColors.textFieldColor,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading) // Show progress indicator when loading
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.honeyColor),
              ),
            ),
        ],
      ),
    );
  }
}
