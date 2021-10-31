import 'dart:async';

import 'package:evna_flutter/src/blocs/user/user_bloc.dart';
import 'package:evna_flutter/src/blocs/user/user_state.dart';
import 'package:evna_flutter/src/di/app_injector.dart';
import 'package:evna_flutter/src/models/user.dart';
import 'package:evna_flutter/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUI extends StatefulWidget {
  MapUI({Key? key,required this.user}) : super(key: key);
  final UserModel user;

  @override
  _MapUIState createState() => _MapUIState();
}

class _MapUIState extends State<MapUI> {
  UserBloc? userBloc = AppInjector.get<UserBloc>();
  List availableList = [];

  @override
  void dispose() {
    _googleMapController.dispose();
    userBloc!.getAvailableTimes(widget.user.userId);
    super.dispose();
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    // target: LatLng(37.42796133580664, -122.085749655962),
    target: LatLng(48.8566, 2.3522),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controller = Completer();

  late GoogleMapController _googleMapController;
  late Marker _location;
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight - 250,
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
              availabilityData: (data) {
                availableList = data;

                availableList.forEach((element) {
                  markers.add(
                    Marker(
                      draggable: false,
                      markerId: MarkerId(element.lng.toString()),
                      position: LatLng(element.lat, element.lng),
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: const InfoWindow(
                        title: 'Usted está aquí',
                      ),
                    ),
                  );
                });
              },
              loadCurretUser: (data) {},
            );
          },
          builder: (context, state) {
            return GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _googleMapController = controller;
                _controller.complete(controller);
              },
              // markers: {
              //   if (_location != null) _location,
              // },
              markers: Set<Marker>.of(markers),
              onLongPress: _addMarker,
            );
          },
        ),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    setState(() {
      _location = Marker(
        markerId: const MarkerId('Location'),
        infoWindow: const InfoWindow(title: 'Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
    });
  }
}
