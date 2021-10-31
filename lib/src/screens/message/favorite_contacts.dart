import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/message_model.dart';
import 'package:evna_flutter/src/repository/AuthRepository.dart';
import 'package:evna_flutter/src/screens/message/chat_screen.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteContacts extends StatefulWidget {
  FavoriteContacts({Key? key}) : super(key: key);

  @override
  _FavoriteContactsState createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  List userList = [];
  var currentUser = "";

  var userBloc = AppInjector.get<UserBloc>();

  @override
  void initState() {
    userBloc.getCurrentUser();
    userBloc.getFollowingUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Text(
                //   'Favorite Contacts',
                //   style: TextStyle(
                //     color: Colors.blueGrey,
                //     fontSize: 18.0,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 1.0,
                //   ),
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.more_horiz,
                //   ),
                //   iconSize: 30.0,
                //   color: Colors.blueGrey,
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          Container(
            height: 120.0,
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
                    loadCurretUser: (data) {
                      currentUser = data[0].userId;
                    },
                    availabilityData: (data) {},
                  );
                },
                builder: (context, state) {
                  return ListView.builder(
                    padding: EdgeInsets.only(left: 10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              user: userList[index],
                              currentUID: currentUser,
                              otherUID: userList[index].userId,
                              getValues: (value) {},
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35.0,
                                backgroundColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(250)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/person.jpeg',
                                    image: userList[index].userImage != ""
                                        ? userList[index].userImage
                                        : common_user_image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // CircleAvatar(
                              //   // backgroundImage:
                              //   //     AssetImage('assets/images/person.jpeg'),
                              //   backgroundImage:
                              //       AssetImage('assets/images/person.jpeg'),

                              //   // backgroundImage: userList[index].userImage !=
                              //   //             null &&
                              //   //         userList[index].userImage != ""
                              //   //     ? NetworkImage(userList[index].userImage)
                              //   //     : AssetImage('assets/images/person.jpeg'),
                              //   radius: 35.0,
                              // ),
                              // CircleAvatar(
                              //   radius: 35.0,
                              //   backgroundImage:
                              //       AssetImage(userList[index].userImage),
                              // ),
                              SizedBox(height: 6.0),
                              Text(
                                userList[index].firstName,
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
