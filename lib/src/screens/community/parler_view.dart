import 'package:evna_flutter/src/blocs/post/post_bloc.dart';
import 'package:evna_flutter/src/blocs/post/post_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/screens/community/parler_comment.dart';
import 'package:evna_flutter/src/utils/basemodel.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParlerViewUI extends StatefulWidget {
  ParlerViewUI({Key? key, required this.userList}) : super(key: key);
  final List<UserModel> userList;
  @override
  ParlerViewUIState createState() => ParlerViewUIState();
}

class ParlerViewUIState extends State<ParlerViewUI> {
  List postList = [];

  var postBloc = AppInjector.get<PostBloc>();
  var currentUser = "";

  Future<void> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUser = prefs.getString("currentUserId")!;
  }

  @override
  void initState() {
    getCurrentUser();
    postBloc.fetchPosts();

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
          actions: [],
        ),
        body: Container(
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
          child: SingleChildScrollView(
            child: BlocConsumer<PostBloc, PostState>(
              bloc: postBloc,
              listener: (context, state) {
                state.when(
                  idle: () {},
                  loading: () {},
                  loaded: (data) {
                    print("object");
                    print(currentUser);
                    postList = data;
                  },
                  showError: (err) {},
                  postSuccessfully: () {
                    postBloc.fetchPosts();
                    // toast_bloc.showSuccess("Success");
                  },
                );
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(postList.length, (index) {
                    BaseModel model = postList[index];
                    return Column(
                      children: [
                        buildPostWidget(
                          model,
                          ValueKey(model.getObjectId()),
                        ),
                      ],
                    );
                  }),
                );
              },
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
                    image: (userData.userImage != null)
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
}
