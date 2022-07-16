import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_app/presentations/widget/back_elevation_button_widget.dart';

import '../../cubit/auth_cubit.dart';
import '../../utils/static_images.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    Center(
                      child: Image.asset(
                        StaticImages.iFirebaseLogo,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      hint: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      prefixIcon: Icons.alternate_email,
                      controller: controllerEmail,
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      hint: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock_outline_rounded,
                      controller: controllerPassword,
                    ),
                    const SizedBox(height: 30),
                    ButtonWidget(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).signUp(
                          email: controllerEmail.text.trim(),
                          password: controllerPassword.text.trim(),
                        );
                      },
                      text: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: BackElevationButtonWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
