import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_app/components/default_button.dart';
import 'package:fruit_app/constants.dart';
import 'package:fruit_app/size_config.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  FocusNode pin2FocusNode = FocusNode(),
      pin3FocusNode = FocusNode(),
      pin4FocusNode = FocusNode();

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value?.length == 1) {
      focusNode?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeight * .15,
          ),
          DefaultButton(text: "Continue", press: () {}),
        ],
      ),
    );
  }
}
