import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/screens/search/doctor_card.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorList extends StatefulWidget {
  DoctorList({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  UserBloc? userBloc = AppInjector.get<UserBloc>();
  String tabView = "availability";
  List availableList = [];

  @override
  void initState() {
    userBloc!.getAvailableTimes(widget.user.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 0),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight - 300,
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
                data: (data) {},
                loadCurretUser: (data) {},
                availabilityData: (data) {
                  availableList = data;
                },
              );
            },
            builder: (context, state) {
              return ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: availableList.length,
                itemBuilder: (BuildContext context, int index) {
                  return DoctorCard(
                    user: widget.user,
                    day: index + 1,
                    availableTime: availableList[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
