import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastBloc {
//  final _repository = Repository();
//  final _moviesFetcher = PublishSubject<ItemModel>();

  showSuccess(String msg) {
    Fluttertoast.showToast(
        msg: "Success:" + msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showError(String msg) {
    Fluttertoast.showToast(
        msg: "Error:" + msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showWarning(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static int flag = 1;
  Future<void> showMyDialog(context) async {
    print("++++++++++++++++++++++++++++++++" + flag.toString());
    if (flag != 0) {
      print("***************************" + flag.toString());
      // flag = 1;
      print("////////////////////////////" + flag.toString());
      return await showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lost Connection!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(
                      child: Image.asset("assets/images/lostConnection.png")),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Okey',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print(flag);
                  // flag = 0;
                },
              ),
            ],
          );
        },
      ).then((value) => flag = 1);
    }
  }
}

final toast_bloc = ToastBloc();
