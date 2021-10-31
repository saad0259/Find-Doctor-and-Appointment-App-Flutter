class UserModel {
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  late String userId;
  late String userImage;
  late String objectId;
  late String databaseName;
  late String userType;
  late String speciality;
  late List following;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.userId,
    required this.userImage,
    required this.objectId,
    required this.databaseName,
    required this.userType,
    required this.speciality,
    required this.following,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    userId = json['userId'];
    userImage = json['userImage'];
    objectId = json['objectId'];
    databaseName = json['databaseName'];
    userType = json['userType'];
    speciality = json['speciality'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['userId'] = this.userId;
    data['userImage'] = this.userImage;
    data['objectId'] = this.objectId;
    data['databaseName'] = this.databaseName;
    data['userType'] = this.userType;
    data['speciality'] = this.speciality;
    data['following'] = this.following;

    return data;
  }
}

class AvailableTimesModel {
  late String userId;
  late String laboratoryId;
  late String time;
  late String date;
  // AvailableLocationModel location;

  late String addressLine;
  late String adminArea;
  late String lng;
  late String lat;
  late String countryCode;
  late String countryName;
  late String featureName;
  late String locality;
  late String postalCode;
  late String subAdminArea;
  late String subLocality;
  late String subThoroughfare;
  late String thoroughfare;

  AvailableTimesModel({
    required this.userId,
    required this.laboratoryId,
    required this.time,
    required this.date,
    required this.addressLine,
    required this.adminArea,
    required this.lng,
    required this.lat,
    required this.countryCode,
    required this.countryName,
    required this.featureName,
    required this.locality,
    required this.postalCode,
    required this.subAdminArea,
    required this.subLocality,
    required this.subThoroughfare,
    required this.thoroughfare,
  });

  AvailableTimesModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    laboratoryId = json['laboratoryId'];
    time = json['time'];
    date = json['date'];

    addressLine = json['addressLine'];
    adminArea = json['adminArea'];
    lng = json['lng'];
    lat = json['lat'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    featureName = json['featureName'];
    locality = json['locality'];
    postalCode = json['postalCode'];
    subAdminArea = json['subAdminArea'];
    subLocality = json['subLocality'];
    subThoroughfare = json['subThoroughfare'];
    thoroughfare = json['thoroughfare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['laboratoryId'] = this.laboratoryId;
    data['time'] = this.time;
    data['date'] = this.date;

    data['addressLine'] = this.addressLine;
    data['adminArea'] = this.adminArea;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['countryCode'] = this.countryCode;
    data['countryName'] = this.countryName;
    data['featureName'] = this.featureName;
    data['locality'] = this.locality;
    data['postalCode'] = this.postalCode;
    data['subAdminArea'] = this.subAdminArea;
    data['subLocality'] = this.subLocality;
    data['subThoroughfare'] = this.subThoroughfare;
    data['thoroughfare'] = this.thoroughfare;

    return data;
  }
}

class AvailableLocationModel {
  late String addressLine;
  late String adminArea;
  late String lng;
  late String lat;
  late String countryCode;
  late String countryName;
  late String featureName;
  late String locality;
  late String postalCode;
  late String subAdminArea;
  late String subLocality;
  late String subThoroughfare;
  late String thoroughfare;

  AvailableLocationModel({
    required this.addressLine,
    required this.adminArea,
    required this.lng,
    required this.lat,
    required this.countryCode,
    required this.countryName,
    required this.featureName,
    required this.locality,
    required this.postalCode,
    required this.subAdminArea,
    required this.subLocality,
    required this.subThoroughfare,
    required this.thoroughfare,
  });

  AvailableLocationModel.fromJson(Map<String, dynamic> json) {
    addressLine = json['addressLine'];
    adminArea = json['adminArea'];
    lng = json['lng'];
    lat = json['lat'];
    countryCode = json['countryCode'];
    countryName = json['countryName'];
    featureName = json['featureName'];
    locality = json['locality'];
    postalCode = json['postalCode'];
    subAdminArea = json['subAdminArea'];
    subLocality = json['subLocality'];
    subThoroughfare = json['subThoroughfare'];
    thoroughfare = json['thoroughfare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressLine'] = this.addressLine;
    data['adminArea'] = this.adminArea;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['countryCode'] = this.countryCode;
    data['countryName'] = this.countryName;
    data['featureName'] = this.featureName;
    data['locality'] = this.locality;
    data['postalCode'] = this.postalCode;
    data['subAdminArea'] = this.subAdminArea;
    data['subLocality'] = this.subLocality;
    data['subThoroughfare'] = this.subThoroughfare;
    data['thoroughfare'] = this.thoroughfare;

    return data;
  }
}
