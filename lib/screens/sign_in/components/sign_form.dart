import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fruit_app/api/api.dart';
import 'package:fruit_app/components/custom_suffix_icon.dart';
import 'package:fruit_app/components/default_button.dart';
import 'package:fruit_app/components/form_error.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/models/User.dart';
import 'package:fruit_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:fruit_app/screens/login_success/login_success_screen.dart';
import 'package:fruit_app/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void handleLogin({required username, required password}) async {
    List<User> user = [];
    await API.getUser(username).then((value) {
      setState(() {
        user = value;
      });
    });

    if (user.isNotEmpty) {
      if (user[0].email == username && user[0].password == password) {
        await FlutterSession().set("login", username);
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } else {
        showDialog(
            context: context,
            builder: (ctx) => const AlertDialog(
                  title: Text("Login failed"),
                  content: Text("Username or password is incorrect"),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (ctx) => const AlertDialog(
                title: Text("Login failed"),
                content: Text("Username is incorrect"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFromField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFromField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              const Text('Remember me'),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  'Forgot password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  handleLogin(username: email, password: password);
                }
              })
        ],
      ),
    );
  }

  TextFormField buildPasswordFromField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }

  TextFormField buildEmailFromField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
