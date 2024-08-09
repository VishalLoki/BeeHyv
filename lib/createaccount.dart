import 'package:flutter/material.dart';
import 'chatmain.dart';
import 'appcolor.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChatMain(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackColor,
      appBar: AppBar(
        backgroundColor: AppColors.honeyColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Your Name',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: TextSelectionTheme(
                data: TextSelectionThemeData(
                  cursorColor: AppColors.honeyColor,
                  selectionColor: AppColors.honeyColor.withOpacity(0.3),
                  selectionHandleColor: AppColors.honeyColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    TextFormField(
                      controller: _nameController,
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: AppColors.textFieldColor),
                        icon: Icon(Icons.person, color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.honeyColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.honeyColor),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        } else if (value.length > 15) {
                          return 'Name cannot exceed 15 characters';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) => _onSubmit(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Let's get started with your name.",
                      style: TextStyle(
                        color: AppColors.textFieldColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Please note, a maximum of 15 characters are allowed.",
                      style: TextStyle(
                        color: AppColors.textFieldColor,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
