import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/blocs/post/post_bloc.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/repository/UserRepository.dart';
import 'package:evna_flutter/src/screens/community/parler_comment.dart';
import 'package:evna_flutter/src/screens/community/parler_view.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParlerUI extends StatefulWidget {
  ParlerUI({Key? key}) : super(key: key);

  @override
  ParlerUIState createState() => ParlerUIState();
}

class ParlerUIState extends State<ParlerUI> {
  List postList = [];
  List<UserModel> userList = [];

  var postBloc = AppInjector.get<PostBloc>();
  UserRepository? userRepository = AppInjector.get<UserRepository>();

  var currentUser = "";

  Future<void> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUser = prefs.getString("currentUserId")!;
  }

  @override
  void initState() {
    getCurrentUser();
    postBloc.fetchPosts();
    getAllUsers();

    super.initState();
  }

  getAllUsers() async {
    userList = await userRepository!.getAllUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'parler'.tr,
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: ParlerViewUI(userList: userList),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Text(
                      'show_more'.tr,
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                  ),
                ),

                // BlocConsumer<PostBloc, PostState>(
                //   bloc: postBloc,
                //   listener: (context, state) {
                //     state.when(
                //       idle: () {},
                //       loading: () {},
                //       loaded: (data) {
                //         print("object");
                //         postList = data;
                //       },
                //       showError: (err) {},
                //       postSuccessfully: () {
                //         postBloc.fetchPosts();
                //       },
                //     );
                //   },
                //   builder: (context, state) {
                //     return Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         // Text('HIIIIIIIIIii'),
                //       ],
                //       // List.generate(
                //       //   postList.length > 5 ? 5 : postList.length,
                //       //   (index) {
                //       //     if (postList.length > 0) {
                //       //       BaseModel model = postList[index];
                //       //       return GestureDetector(
                //       //         onLongPress: () {
                //       //           UserModel userData =
                //       //               model.items['userBase'] as UserModel;
                //       //           if (userData.userId == currentUser) {}
                //       //         },
                //       //         child: Column(
                //       //           children: [
                //       //             buildPostWidget(
                //       //               model,
                //       //               ValueKey(model.getObjectId()),
                //       //             ),
                //       //           ],
                //       //         ),
                //       //       );
                //       //     } else {
                //       //       return Container();
                //       //     }
                //       //   },
                //       // ),
                //     );
                //   },
                // ),

                Container(
                  height: 500,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('postBase')
                          // .orderBy('createdAt', descending: true)
                          .snapshots(),
                      builder: (ctx, postSnapshot) {
                        if (postSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final postDocs = postSnapshot.data?.docs ?? null;
                        // print('--------------Helo ${postDocs!.length}');
                        return ListView.builder(
                            reverse: true,
                            itemCount: postDocs?.length ?? 0,
                            itemBuilder: (ctx, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(250)),
                                    child: FadeInImage.assetNetwork(
                                      placeholder:
                                          'assets/images/Default-avatar-blue.png',
                                      image: common_user_image,

                                      // : 'assets/images/person.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: const Text(
                                  'Sophia Hyes MD',
                                  style: TextStyle(
                                      // color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                subtitle: Text(
                                  postDocs![index]['message'],
                                  style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                  ),
                                ),
                              );
                            });

                      }),
                ),

                // ListTile(
                //   leading: CircleAvatar(
                //     radius: 40,
                //     backgroundColor: Colors.white,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.all(Radius.circular(250)),
                //       child: Image.asset(
                //         'assets/images/person.jpeg',
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                //   title: const Text(
                //     'Sophia Hyes MD',
                //     style: TextStyle(
                //       // color: Theme.of(context).primaryColor,
                //     ),
                //   ),
                //   subtitle: Text(
                //     'What are the stages of ....',
                //     style: TextStyle(
                //       color: Theme.of(context).canvasColor,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPostWidget(BaseModel model, key) {
    String message = model.getString(MESSAGE);
    String postId = model.getString(OBJECT_ID);
    List likes = model.getList(LIKES);
    List comments = model.getList(COMMENTS);
    int commentCount = model.getInt(COMMENTS);
    UserModel userData = model.items['userBase'] as UserModel;

    // var image = widget.userList.firstWhere((element) => element.userId == 11"");

    var likedList = likes.where((element) => element == currentUser);
    var likedStatus = false;
    if (likedList.isEmpty)
      likedStatus = false;
    else
      likedStatus = true;

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(250)),
                  child: FadeInImage.assetNetwork(
                    placeholder: (userData.userImage != null)
                        ? 'assets/images/person.jpeg'
                        : 'assets/images/person.jpeg',
                    image: (userData.userImage != "")
                        ? userData.userImage
                        : common_user_image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                userData.firstName + " " + userData.lastName,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                ),
              ),
              subtitle: Text(
                message,
                style: TextStyle(
                    color: Theme.of(context).canvasColor.withOpacity(0.6),
                    fontSize: smTextSize),
              ),
            ),
            // Text(
            //   message,
            //   style: TextStyle(
            //     color: Theme.of(context).canvasColor,
            //   ),
            // ),
            Row(
              children: [
                Spacer(),
                Text(likes.length.toString()),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.heart,
                    color: likedStatus ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    postBloc.likePost(postId, likedStatus ? "UNLIKE" : "LIKE");
                  },
                ),
                Spacer(),
                Text(commentCount.toString()),
                IconButton(
                  icon: Icon(CupertinoIcons.chat_bubble),
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: ParlerCommentUI(postId: postId),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(CupertinoIcons.share),
                  onPressed: () {
                    Share.share(message);
                  },
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }

// Widget buildPostWidget(BaseModel model, key) {
//   String message = model.getString(MESSAGE);
//   UserModel userData = model.items['userBase'];

//   return Card(
//     child: Padding(
//       padding: const EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           ListTile(
//             leading: CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.white,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(250)),
//                 child: FadeInImage.assetNetwork(
//                   placeholder: (userData.userImage != null)
//                       ? 'assets/images/person.jpeg'
//                       : 'assets/images/person.jpeg',
//                   image: (userData.userImage != null)
//                       ? userData.userImage
//                       : 'assets/images/person.jpeg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             title: Text(
//               userData.firstName + " " + userData.lastName,
//               style: TextStyle(
//                 color: Theme.of(context).canvasColor,
//               ),
//             ),
//             subtitle: Text(
//               message,
//               style: TextStyle(
//                   color: Theme.of(context).canvasColor.withOpacity(0.6),
//                   fontSize: smTextSize),
//             ),
//           ),
//           Row(
//             children: [
//               Spacer(),
//               IconButton(
//                 icon: Icon(CupertinoIcons.heart),
//                 onPressed: () {},
//               ),
//               Spacer(),
//               IconButton(
//                 icon: Icon(CupertinoIcons.post_bubble),
//                 onPressed: () {},
//               ),
//               Spacer(),
//               IconButton(
//                 icon: Icon(CupertinoIcons.share),
//                 onPressed: () {},
//               ),
//               Spacer(),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

}
