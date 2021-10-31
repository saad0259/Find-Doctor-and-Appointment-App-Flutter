class ChatHeadModel {
  late String objectId;
  late String databaseName;
  late String createdAt;
  // List<PeopleChat> people;
  late List<dynamic> people;

  ChatHeadModel({
    required this.objectId,
    required this.databaseName,
    required this.createdAt,
    required this.people,
  });

  ChatHeadModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    databaseName = json['databaseName'];
    createdAt = json['createdAt'];
    if (json['people'] != null) {
      people = new List<dynamic>.empty(growable: true);
      json['people'].forEach((v) {
        people.add(v);
      });
    }
    // if (json['people'] != null) {
    //   people = new List<PeopleChat>.empty(growable: true);
    //   json['people'].forEach((v) {
    //     people.add(new PeopleChat.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['databaseName'] = this.databaseName;
    data['createdAt'] = this.createdAt;
    if (this.people != null) {
      data['people'] = this.people.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class PeopleChat {
  late String firstName;
  late String lastName;
  late String userImage;
  late String userId;

  PeopleChat({
    required this.firstName,
    required this.lastName,
    required this.userImage,
    required this.userId,
  });

  PeopleChat.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userImage = json['userImage'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userImage'] = this.userImage;
    data['userId'] = this.userId;

    return data;
  }
}

class ChatDetailModel {
  late String chatHeadId;
  late String objectId;
  late String databaseName;
  late String message;
  late String createdAt;
  late String userId;
  late List<String> readyBy;

  late List<PeopleChat> people;

  ChatDetailModel({
    required this.chatHeadId,
    required this.objectId,
    required this.databaseName,
    required this.message,
    required this.createdAt,
    required this.userId,
    required this.readyBy,
  });

  ChatDetailModel.fromJson(Map<String, dynamic> json) {
    chatHeadId = json['chatHeadId'];
    objectId = json['objectId'];
    databaseName = json['databaseName'];
    message = json['message'];
    createdAt = json['createdAt'];
    userId = json['userId'];
    if (json['people'] != null) {
      people = new List<PeopleChat>.empty(growable: true);
      json['people'].forEach((v) {
        people.add(new PeopleChat.fromJson(v));
      });
    }
    if (json['readyBy'] != null) {
      readyBy = new List<String>.empty(growable: true);
      json['readyBy'].forEach((v) {
        readyBy.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['databaseName'] = this.databaseName;
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    data['userId'] = this.userId;
    if (this.people != null) {
      data['people'] = this.people.map((v) => v.toJson()).toList();
    }
    if (this.readyBy != null) {
      data['readyBy'] = this.readyBy;
    }

    return data;
  }
}
