import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Theme.of(context).backgroundColor,
                      Theme.of(context).dialogBackgroundColor,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              // color: Colors.blue,
              child: Text(''),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(60, 100),
                  topRight: Radius.elliptical(60, 100),
                ),
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 2,
              child: Text(''),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
