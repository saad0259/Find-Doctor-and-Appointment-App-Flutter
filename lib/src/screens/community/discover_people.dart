import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/screens/community/discover_people_card.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DiscoverPeople extends StatefulWidget {
  DiscoverPeople({Key? key}) : super(key: key);

  @override
  _DiscoverPeopleState createState() => _DiscoverPeopleState();
}

class _DiscoverPeopleState extends State<DiscoverPeople> {
  List userList = [];

  var userBloc = AppInjector.get<UserBloc>();

  var currentUser;

  @override
  void initState() {
    userBloc.userRepository!.getCurrentUser().then((value) {
      currentUser = value[0];
      userBloc.getOtherUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'discover_people'.tr,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              trailing: Text(
                'show_more'.tr,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 230,
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
                          var follow;
                          if (currentUser.following != null) {
                            follow = currentUser.following.where(
                                (element) => element == userList[index].userId);

                            if (follow.length > 0)
                              follow = true;
                            else
                              follow = false;
                          } else {
                            follow = false;
                          }

                          return DiscoverPeopleCard(
                            user: userList[index],
                            followState: follow,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
