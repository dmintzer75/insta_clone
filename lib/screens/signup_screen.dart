import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/constants/assets.gen.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/responsive/responsive.dart';
import 'package:insta_clone/screens/login_screen.dart';
import 'package:insta_clone/utils/helpers.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final TextEditingController _usernameTextEditingController = TextEditingController();
  final TextEditingController _bioTextEditingController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _usernameTextEditingController.dispose();
    _bioTextEditingController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpWithEmailAndPassword(
      email: _emailTextEditingController.text,
      password: _passwordTextEditingController.text,
      username: _usernameTextEditingController.text,
      bio: _bioTextEditingController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
            tabletScreenLayout: TabletScreenLayout(),
          ),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                Assets.icons.logo,
                colorFilter: ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
              ),
              const SizedBox(height: 40),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundColor: theme.colorScheme.secondary,
                          child: const Icon(
                            Icons.person,
                            size: 80,
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: theme.scaffoldBackgroundColor.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: IconButton(
                        onPressed: selectImage,
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 30,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextFieldInput(
                textEditingController: _usernameTextEditingController,
                hintText: 'Enter your username',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              TextFieldInput(
                textEditingController: _emailTextEditingController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextFieldInput(
                textEditingController: _passwordTextEditingController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
              const SizedBox(height: 12),
              TextFieldInput(
                textEditingController: _bioTextEditingController,
                hintText: 'Enter your bio',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.highlightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
