import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_clone/constants/assets.gen.dart';
import 'package:insta_clone/resources/auth_methods.dart';
import 'package:insta_clone/responsive/responsive.dart';
import 'package:insta_clone/screens/signup_screen.dart';
import 'package:insta_clone/utils/helpers.dart';
import 'package:insta_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  void signIn() async {
    setState(() {
      _isLoading = true;
    });

    final res = await AuthMethods().signInWithEmailAndPassword(
      email: _emailTextEditingController.text,
      password: _passwordTextEditingController.text,
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

  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
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
              const SizedBox(height: 39),
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
              GestureDetector(
                onTap: signIn,
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
                          )
                        : const Text(
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
                    onTap: navigateToSignUp,
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
