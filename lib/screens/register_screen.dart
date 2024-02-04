import 'package:app/components/labeled_input_text.dart';
import 'package:app/components/large_text_button.dart';
import 'package:app/utilities/ui_constants.dart';
import 'package:flutter/material.dart';

// TODO: Implement register form validation + refactor inputs with form inputs
// TODO: Call the register API
// TODO: Handle the response from the register API
// TODO: Add icons to the inputs
// TODO: Back button to the app bar

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, one bad way to fix the keyboard issue ...
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: kSmallSizedBoxHeight),
              const Text(
                "Sign up",
                style: kTitleTextStyle,
              ),
              const Divider(
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(
                height: kSmallSizedBoxHeight,
              ),
              LabeledInputText(
                  controller: emailController,
                  labelText: 'email',
                  obscureText: false),
              const SizedBox(
                height: kSmallSizedBoxHeight,
              ),
              LabeledInputText(
                  controller: passwordController,
                  labelText: 'password',
                  obscureText: true),
              const SizedBox(
                height: kSmallSizedBoxHeight,
              ),
              LabeledInputText(
                  controller: passwordConfirmController,
                  labelText: 'confirm password',
                  obscureText: true),
              const SizedBox(
                height: kSmallSizedBoxHeight,
              ),
              LabeledInputText(
                  controller: firstNameController,
                  labelText: 'first name',
                  obscureText: false),
              const SizedBox(
                height: kSmallSizedBoxHeight,
              ),
              LabeledInputText(
                  controller: lastNameController,
                  labelText: 'last name',
                  obscureText: false),
              const SizedBox(height: kMediumSizedBoxHeight),
              LargeTextButton(
                color: kColorBluePrimary,
                text: 'Submit',
                onPress: validateRegisterForm,
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateRegisterForm() {
    print('Pressed Submit button');
  }
}
