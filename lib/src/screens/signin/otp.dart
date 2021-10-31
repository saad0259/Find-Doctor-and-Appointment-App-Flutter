import 'package:evna_flutter/src/blocs/sign_up/sign_up_bloc.dart';
import 'package:evna_flutter/src/blocs/sign_up/sign_up_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/screens/check_user/check_user.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/loading.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpUI extends StatefulWidget {
  OtpUI({Key? key, this.phoneNumber, this.verificationId}) : super(key: key);
  static String routeName = "/otp";
  final phoneNumber;
  final verificationId;

  @override
  OotpUIState createState() => OotpUIState();
}

class OotpUIState extends State<OtpUI> {
  var signUpBloc = AppInjector.get<SignUpBloc>();
  List userList = [];

  late String userType;
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: BlocConsumer<SignUpBloc, SignUpState>(
          bloc: signUpBloc,
          listener: (context, state) {
            state.when(
              idle: () {},
              signUpLoading: () {},
              showError: (err) {
                toast_bloc.showError(err);
              },
              registerSuccessfully: () {
                print("Success");
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CheckUserStatus()),
                  ModalRoute.withName(CheckUserStatus.routeName),
                );
              },
              codeSent: (verificationId, resendToken) {},
              codeAutoRetrievalTimeout: (e) {
                toast_bloc.showWarning(e);
              },
              verificationCompleted: (value) {
                print(value);
              },
              verificationFailed: (e) {
                toast_bloc.showError(e.toString());
              },
            );
          },
          builder: (context, state) {
            if (state is SignUpLoading) {
              return LoadingWidget();
            } else {
              return FloatingBtnExtended(
                text: "Confirm",
                icon: Icons.confirmation_num,
                action: () {
                  signUpBloc.verifyNumber(emailController.text,
                      widget.phoneNumber, widget.verificationId);
                },
                color: Theme.of(context).primaryColor,
              );
            }
          },
        ),
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: new BoxDecoration(
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
          child: Column(
            children: [
              SizedBox(height: 20),
              RoundedInputField(
                readOnly: false,
                icon: Icons.verified_sharp,
                textEditingController: emailController,
                hintText: "OTP Code",
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                onTextTap: () {},
                textValidate: (String) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AJOnW4TR94POuaQdjIEzyBE7B_HxyzIhW0hY3p761aU_UVUyHhkqvFrJYXZ0WrW6uNXHpYIwldS5cgSu5LoSo5d4UgU4LFKbBs9PbxPQwXxwHqm47cbdpSfEsrhslIH9vF3qCotFmFAX7aj4VAo-nlzV1deYxa5LazxFwW-oP02xoLrpK5LOp0nvK0irhlukHqCnEijb7jNnDCIm2V97cBe36pLRfD-S0g
