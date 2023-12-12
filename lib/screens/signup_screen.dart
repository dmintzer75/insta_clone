import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/constants/assets.gen.dart';
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

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _usernameTextEditingController.dispose();
    _bioTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                        onPressed: () {},
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
                onTap: () {
                  // Perform login action here
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.highlightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
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
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      // Navigate to register screen
                      print('sign up');
                    },
                    child: Text(
                      'Sign up here',
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
