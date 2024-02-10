import 'package:app/components/large_text_button.dart';
import 'package:app/services/network/api_common.dart';
import 'package:app/services/network/user_api.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// TODO: Add icons to the inputs
// TODO: Add a password visibility toggle
// TODO: Add a password confirmation visibility toggle
// TODO: Add hint text to the inputs

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, one bad way to fix the keyboard issue ...
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: kSmallSizedBoxHeight),
            const Text(
              'Sign up',
              style: kTitleTextStyle,
            ),
            const Divider(
              indent: 40,
              endIndent: 40,
            ),
            const SizedBox(
              height: kSmallSizedBoxHeight,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: kInputTextWidth, // Set the desired width here
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please insert your email';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Colors.black), // Change the text color here
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: kInputTextWidth, // Set the desired width here
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(value)) {
                          return 'Password must contain at least 8 characters, including uppercase, lowercase, and numeric characters.';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: kInputTextWidth, // Set the desired width here
                    child: TextFormField(
                      controller: passwordConfirmController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Colors.black), // Change the text color here
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: kInputTextWidth, // Set the desired width here
                    child: TextFormField(
                      controller: firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Colors.black), // Change the text color here
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: kInputTextWidth, // Set the desired width here
                    child: TextFormField(
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      style: const TextStyle(
                          color: Colors.black), // Change the text color here
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            LargeTextButton(
                color: kColorBluePrimary,
                text: 'Submit',
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    // Implement the api call
                    ApiResponse response = await UserApiClient().register(
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text);
                    if (response.success) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Registration successful. You will be redirected to the login page.'),
                        duration: Duration(seconds: 3), // Set the duration here
                        behavior: SnackBarBehavior
                            .floating, // Set the behavior to floating
                      ));
                      await Future.delayed(const Duration(seconds: 3),
                          () => {Navigator.pop(context)});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(response.errorMessage),
                          duration: const Duration(
                              seconds: 2), // Set the duration here
                          behavior: SnackBarBehavior
                              .floating, // Set the behavior to floating
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid Data'),
                        duration: Duration(seconds: 2), // Set the duration here
                        behavior: SnackBarBehavior
                            .floating, // Set the behavior to floating
                      ),
                    );
                  }
                })
          ]),
        ),
      ),
    );
  }
}
