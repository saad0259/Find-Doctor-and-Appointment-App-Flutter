import 'package:evna_flutter/src/blocs/toaster_message/toast_block.dart';
import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/utils/floatingBtnExtended.dart';
import 'package:evna_flutter/src/utils/rounded_button.dart';
import 'package:evna_flutter/src/utils/rounded_input_field.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';

class AddAvailableTime extends StatefulWidget {
  const AddAvailableTime({
    Key? key,
    required this.getValues,
    @required this.userId,
  }) : super(key: key);

  final userId;
  final ValueChanged<String> getValues;

  @override
  AaddAvailableTimeState createState() => AaddAvailableTimeState();
}

class AaddAvailableTimeState extends State<AddAvailableTime> {
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController searchLocationController = TextEditingController();
  TextEditingController selectedLocationController = TextEditingController();

  var location;

  List resultList = [];

  FocusNode focusText = FocusNode();
  UserBloc? userBloc = AppInjector.get<UserBloc>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocProvider(
        create: (context) => UserBloc(),
        child: BlocConsumer<UserBloc, UserState>(
          bloc: userBloc,
          listener: (context, state) {
            state.when(
              idle: () {},
              loading: () {},
              showError: (err) {},
              success: () {
                widget.getValues("data");
                Navigator.pop(context);
              },
              data: (data) {},
              loadCurretUser: (data) {},
              availabilityData: (data) {},
            );
          },
          builder: (context, state) {
            return FloatingBtnExtended(
              text: "Add",
              icon: Icons.add,
              action: () {
                // if (location != null) {
                if (timeController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  userBloc!.addAvailableTime(
                    timeController.text,
                    dateController.text,
                    "laboratory",
                    location,
                  );
                } else
                  toast_bloc.showError("Fill Required Details");
                // } else {
                //   toast_bloc.showError("Please Select Location");
                // }
              },
              color: Theme.of(context).primaryColor,
            );
          },
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        // iconTheme: IconThemeData(
        //   color: kHeaderTitleColor,
        // ),
        title: Text("Add Available Time"),
        backgroundColor: Theme.of(context).backgroundColor,
        actions: <Widget>[
          // //ThemeSelection(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RoundedInputField(
                        maxLine: 1,
                        icon: Icons.lock_clock,
                        textEditingController: timeController,
                        // focusNode: focusText,
                        hintText: "Select Time",
                        keyboardType: TextInputType.text,
                        onChanged: (value) {},
                        onTextTap: () {
                          _showTimePickerDialog('', timeController);
                        },
                        textValidate: (String) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RoundedInputField(
                        maxLine: 1,
                        icon: Icons.date_range,
                        textEditingController: dateController,
                        hintText: "Select Date",
                        keyboardType: TextInputType.text,
                        onChanged: (value) {},
                        onTextTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(new Duration(days: 14)),
                          ).then((value) {
                            if (value != null)
                              dateController.text = DateFormat.yMMMMd()
                                  .format(DateTime.parse(value.toString()))
                                  .toString();
                          });
                        },
                        textValidate: (String) {},
                      ),
                    ),
                  ],
                ),
                if (!isLocationSelected)
                  Row(
                    children: [
                      Expanded(
                        child: RoundedInputField(
                          maxLine: 1,
                          icon: Icons.location_city,
                          textEditingController: searchLocationController,
                          hintText: "Select Location",
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            searchLocation();
                          },
                          // onTextTap: () {
                          //   searchLocation();
                          // },
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                      ),
                    ],
                  ),
                if (isLocationSelected)
                  Row(
                    children: [
                      Expanded(
                        child: RoundedInputField(
                          readOnly: true,
                          maxLine: 1,
                          icon: Icons.location_city,
                          textEditingController: selectedLocationController,
                          hintText: "Selected Location",
                          keyboardType: TextInputType.text,
                          onChanged: (String value) {},
                          onTextTap: () {},
                          textValidate: (String) {},
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: RoundedButton(
                          textColor: Theme.of(context).canvasColor,
                          text: "Clear",
                          press: () {
                            setState(() {
                              selectedLocationController.text = "";
                              isLocationSelected = false;
                              location = new AvailableLocationModel(
                                addressLine: '',
                                adminArea: '',
                                lng: '',
                                lat: '',
                                countryCode: '',
                                countryName: '',
                                featureName: '',
                                locality: '',
                                postalCode: '',
                                subAdminArea: '',
                                subLocality: '',
                                subThoroughfare: '',
                                thoroughfare: '',
                              );
                            });
                          },
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                Divider(),
                if (resultList.length > 0)
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: resultList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedLocationController.text =
                                          resultList[index].featureName;
                                      isLocationSelected = true;
                                      searchLocationController.text = "";

                                      location = resultList[index];
                                      resultList = [];
                                    });
                                  },
                                  child: Container(
                                    width: 120,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      elevation: 5,
                                      clipBehavior: Clip.antiAlias,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 10),
                                          ListTile(
                                            title: Text(
                                              resultList[index].featureName,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            ),
                                            subtitle: Text(
                                                resultList[index].addressLine),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isLocationSelected = false;
  Future<Function?> searchLocation() async {
    // try {
    //   print("object");
    //   final query = searchLocationController.text;

    //   if (query.length > 4) {
    //     var addresses = await Geocoder.local
    //         .findAddressesFromQuery(query)
    //         .catchError((onError) {
    //       if (onError is PlatformException) {
    //         if (onError.code == 'not_available') {
    //           print("not_available");
    //         } else {
    //           print("Not Found");
    //         }
    //       }
    //     });

    //     if (addresses != null) {
    //       var first = addresses.first;
    //       print("${first.featureName} : ${first.coordinates}");

    //       setState(() {
    //         resultList = addresses;
    //       });
    //     } else {
    //       resultList = [];
    //     }
    //   }
    // } catch (e) {
    //   print("err");
    // }
  }

  late String selectedTimeString;
  Future<void> _showTimePickerDialog(_tTime, controller) async {
    if (_tTime.toString().isEmpty) {
      _tTime = "00:00:00";
    }
    var time = _tTime.toString().split(":").toList();
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: int.parse(time[0]), minute: int.parse(time[1])),
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (selectedTime!.minute.toString().length == 1) {
      selectedTimeString = DateTime.parse("2020-01-01T" +
              selectedTime.hour.toString() +
              ":" +
              "0" +
              selectedTime.minute.toString() +
              ":" +
              "00")
          .toString();
      controller.text = DateFormat.jm()
          .format(DateTime.parse("2020-01-01T" +
              selectedTime.hour.toString() +
              ":" +
              "0" +
              selectedTime.minute.toString() +
              ":" +
              "00"))
          .toString();
    } else
      selectedTimeString = DateTime.parse("2020-01-01T" +
              selectedTime.hour.toString() +
              ":" +
              selectedTime.minute.toString() +
              ":" +
              "00")
          .toString();
    controller.text = DateFormat.jm()
        .format(DateTime.parse("2020-01-01T" +
            selectedTime.hour.toString() +
            ":" +
            selectedTime.minute.toString() +
            ":" +
            "00"))
        .toString();
  }
}
