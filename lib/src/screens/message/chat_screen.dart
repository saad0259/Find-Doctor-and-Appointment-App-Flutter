import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evna_flutter/src/blocs/chat/chat_bloc.dart';
import 'package:evna_flutter/src/blocs/chat/chat_state.dart';
import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/chat_model.dart';
import 'package:evna_flutter/src/models/message_model.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/models/user_model.dart';
import 'package:evna_flutter/src/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final UserModel user;
  final String otherUID;
  final String currentUID;
  final ValueChanged<dynamic> getValues;

  ChatScreen(
      {required this.user,
      required this.otherUID,
      required this.currentUID,
      required this.getValues});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var chatID = "";

  List messageList = [];
  var chatBloc = AppInjector.get<ChatBloc>();
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    chatID = getChatId();
    chatBloc.getMessagesByChatId(chatID);
    widget.getValues(1);
  }

  getChatId() {
    List values = [widget.otherUID, widget.currentUID];
    values.sort();
    return values[0] + values[1];
  }

  _buildMessage(ChatDetailModel message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).primaryColor
            : Theme.of(context).dialogBackgroundColor,
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: isMe
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  message.createdAt,
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  message.message,
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  message.createdAt,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  message.message,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        // IconButton(
        //   icon: message.isLiked
        //       ? Icon(Icons.favorite)
        //       : Icon(Icons.favorite_border),
        //   iconSize: 30.0,
        //   color: message.isLiked
        //       ? Theme.of(context).primaryColor
        //       : Colors.blueGrey,
        //   onPressed: () {},
        // )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.photo),
          //   iconSize: 25.0,
          //   color: Theme.of(context).primaryColor,
          //   onPressed: () {},
          // ),
          Expanded(
            child: TextField(
              controller: textController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              style: TextStyle(color: Theme.of(context).canvasColor),
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ChatBloc(),
            child: BlocConsumer<ChatBloc, ChatState>(
              bloc: chatBloc,
              listener: (context, state) {
                state.when(
                  idle: () {},
                  loading: () {},
                  loaded: (data) {
                    messageList = [];
                    messageList = data;
                  },
                  showError: (err) {
                    toast_bloc.showError(err);
                  },
                  postSuccessfully: () {
                    // toast_bloc.showSuccess("Success");
                    textController.text = "";
                    chatBloc.getMessagesByChatId(chatID);
                  },
                );
              },
              builder: (context, state) {
                return IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 25.0,
                  color: Theme.of(context).selectedRowColor,
                  onPressed: () {
                    sendMessage();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  sendMessage() {
    if (textController.text != "") {
      chatBloc.sendMessage(
        widget.currentUID,
        widget.otherUID,
        chatID,
        textController.text,
      );
    } else {
      toast_bloc.showWarning("Message cannot be empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.firstName,
          style: TextStyle(
            fontSize: 28.0,
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.more_horiz),
          //   iconSize: 30.0,
          //   color: Theme.of(context).backgroundColor,
          //   onPressed: () {},
          // ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: BlocBuilder<ChatBloc, ChatState>(
                  bloc: chatBloc,
                  builder: (context, state) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.only(top: 15.0),
                        itemCount: messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ChatDetailModel message = messageList[index];
                          final bool isMe = message.userId == widget.currentUID;
                          return _buildMessage(message, isMe);
                        },
                      ),
                    );
                  },
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(30.0),
                //     topRight: Radius.circular(30.0),
                //   ),
                //   child: ListView.builder(
                //     reverse: true,
                //     padding: EdgeInsets.only(top: 15.0),
                //     itemCount: messages.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       final Message message = messages[index];
                //       final bool isMe = message.sender.id == currentUser.id;
                //       return _buildMessage(message, isMe);
                //     },
                //   ),
                // ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
