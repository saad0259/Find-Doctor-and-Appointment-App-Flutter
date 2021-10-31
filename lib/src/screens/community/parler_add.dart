import 'package:evna_flutter/src/blocs/post/post_bloc.dart';
import 'package:evna_flutter/src/blocs/post/post_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/loading.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParlerAddUI extends StatefulWidget {
  ParlerAddUI({Key? key}) : super(key: key);

  @override
  ParlerAddUIState createState() => ParlerAddUIState();
}

class ParlerAddUIState extends State<ParlerAddUI> {
  String hintText = "Say something";
  TextEditingController textController = TextEditingController();
  FocusNode focusText = FocusNode();
  var postBloc = AppInjector.get<PostBloc>();

  @override
  void initState() {
    focusText.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Parler'),
          backgroundColor: Theme.of(context).backgroundColor,
          actions: [
            BlocProvider(
              create: (context) => PostBloc(),
              child: BlocConsumer<PostBloc, PostState>(
                bloc: postBloc,
                listener: (context, state) {
                  state.when(
                    idle: () {},
                    loading: () {},
                    showError: (err) {
                      toast_bloc.showError(err);
                    },
                    postSuccessfully: () {
                      toast_bloc.showSuccess("Success");
                      textController.text = "";
                      focusText.unfocus();
                    },
                    loaded: (data) {},
                  );
                },
                builder: (context, state) {
                  if (state is Loading) {
                    return LoadingWidget();
                  } else {
                    return FlatButton(
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {
                        onPostTap();
                      },
                      child: Text(
                        "POST",
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: xs1TextSize,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
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
                  maxLine: 4,
                  icon: Icons.merge_type,
                  textEditingController: textController,
                  // focusNode: focusText,
                  hintText: hintText,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {},
                  onTextTap: () {},
                  textValidate: (String) {},
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPostTap() {
    if (textController.text != "") {
      postBloc.addPost(
        textController.text,
      );
      textController.text = "";
    } else {
      toast_bloc.showWarning("Post cannot be empty");
    }
  }
}
