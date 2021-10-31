import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/screens/signin/otp.dart';
import 'package:evna_flutter/src/utils/loading.dart';
import 'package:evna_flutter/src/utils/rounded_button.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MobileLogin extends StatefulWidget {
  MobileLogin({Key? key}) : super(key: key);

  @override
  _MobileLoginState createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {
  TextEditingController phoneController = TextEditingController();
  var signUpBloc = AppInjector.get<SignUpBloc>();

  String _selectedCountryCode = "+33";
  List<String> _countryCodes = ['+91', '+23'];

  @override
  void initState() {
    super.initState();
  }

  countryCode(CountryCode country){
     print(country.dialCode);
     _selectedCountryCode = country.dialCode ?? "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          decoration: new BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white60,
            ),
            gradient: new LinearGradient(
                colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).dialogBackgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                             /* DropdownButton(
                                value: _selectedCountryCode,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).selectedRowColor,
                                ),
                                iconSize: 24,
                                elevation: 0,
                                style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                                dropdownColor: Theme.of(context).primaryColor,
                                underline: SizedBox(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCountryCode = value.toString();
                                  });
                                },
                                items: _countryCodes.map((String value) {
                                  return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(
                                        value,
                                        style: TextStyle(fontSize: 12.0),
                                      ));
                                }).toList(),
                              ),*/
                              CountryCodePicker(
                                onChanged: countryCode,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'FR',
                                textStyle: TextStyle(color: Colors.white,),
                              ),
                             /* DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    dropdownColor: Colors.black,
                                    value: _selectedCountryCode,
                                    items: _countryCodes.map((String value) {
                                      return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(
                                            value,
                                            //style: TextStyle(fontSize: 12.0, color: Colors.black),
                                          ));
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedCountryCode = value.toString();
                                      });
                                    },
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),*/
                              Expanded(
                                child: RoundedInputField(
                                  icon: Icons.phone,
                                  textEditingController: phoneController,
                                  hintText: "phone_no".tr,
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {},
                                  onTextTap: () {},
                                  textValidate: (String) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocProvider(
                          create: (context) => SignUpBloc(),
                          child: BlocConsumer<SignUpBloc, SignUpState>(
                            bloc: signUpBloc,
                            builder: (context, state) {
                              if (state is SignUpLoading) {
                                return LoadingWidget();
                              } else {
                                return RoundedButton(
                                  textColor: Theme.of(context).canvasColor,
                                  text: "sign_up".tr,
                                  press: () {
                                    onSignInWithPhoneTap();
                                  },
                                  color: Theme.of(context).primaryColor,
                                );
                              }
                            },
                            listener: (context, state) {
                              state.when(
                                idle: () {},
                                signUpLoading: () {},
                                showError: (err) {},
                                registerSuccessfully: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CheckUserStatus()),
                                    ModalRoute.withName(
                                        CheckUserStatus.routeName),
                                  );
                                },
                                codeAutoRetrievalTimeout: (e) {
                                  toast_bloc.showWarning(e);
                                },
                                verificationCompleted: (value) {
                                  print(value);
                                },
                                verificationFailed: (e) {
                                  toast_bloc.showError(e.toString());
                                },
                                codeSent: (verificationId, resendToken) {
                                  var _data;
                                  toast_bloc.showSuccess("code_send".tr);
                                  _data = verificationId;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => OtpUI(
                                        phoneNumber:
                                            phoneController.text.trim(),
                                        verificationId: verificationId,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSignInWithPhoneTap() async {
    signUpBloc.sendOTP(_selectedCountryCode + phoneController.text.trim());
  }
}
