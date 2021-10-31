import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:evna_flutter/src/utils/storyview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryList extends StatefulWidget {
  StoryList({Key? key}) : super(key: key);

  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  List userList = [];

  var userBloc = AppInjector.get<UserBloc>();

  @override
  void initState() {
    userBloc.getFollowingUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: SizeConfig.screenWidth,
      child: BlocProvider(
        create: (context) => UserBloc(),
        child: BlocConsumer<UserBloc, UserState>(
          bloc: userBloc,
          listener: (context, state) {
            state.when(
              idle: () {},
              loading: () {},
              showError: (err) {},
              success: () {},
              data: (data) {
                userList = data;
              },
              loadCurretUser: (data) {},
              availabilityData: (data) {},
            );
          },
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return StoryView(
                  user: userList[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
