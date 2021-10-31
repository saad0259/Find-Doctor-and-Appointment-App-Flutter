import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evna_flutter/src/utils/constants.dart';

class BaseModel {
  Map<String, dynamic> items = new Map();
  Map<String, Object> itemsToUpdate = new Map();
  // BaseModel userModel = BaseModel();

  BaseModel({required Map items, DocumentSnapshot? doc}) {
    if (items != null) {
      Map<String, Object> theItems = Map.from(items);
      this.items = theItems;
    }
    if (doc != null && doc.exists) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
      this.items = data;
      this.items[OBJECT_ID] = doc.id;
    }
  }

  void put(String key, Object value) {
    items[key] = value;
    itemsToUpdate[key] = value;
  }

  void putInList(String key, Object value, {bool add = true}) {
    //items[key] = value;
    // List list = items[key] ?? [];
    List list = [];
    if (add)
      list.add(value);
    else
      list.remove(value);
    items[key] = list;
    itemsToUpdate[key] =
        add ? FieldValue.arrayUnion([value]) : FieldValue.arrayRemove([value]);
  }

  void putIntValue(String key, int value, {bool add = true}) {
    //items[key] = value;
    // num item = items[key] ?? [];
    num item = 0;
    if (add) {
      item = item + value;
    } else {
      item = item - value;
    }
    ;
    items[key] = item;
    itemsToUpdate[key] =
        add ? FieldValue.increment(value) : FieldValue.increment(-value);
  }

  void remove(String key) {
    items.remove(key);
    itemsToUpdate[key] = null as Object;
  }

  String getObjectId() {
    Object value = items[OBJECT_ID] as Object;
    return value == null || !(value is String) ? "" : value.toString();
  }

  List getList(String key) {
    if (items[key] != null) {
      Object value = items[key] as Object;
      return value == null || !(value is List) ? [] : List.from(value);
    } else {
      return [];
    }
  }

  Map getMap(String key) {
    Object value = items[key] as Object;
    return value == null || !(value is Map)
        ? new Map<String, String>()
        : Map.from(value);
  }

  Object get(String key) {
    return items[key] as Object;
  }

  String getString(String key) {
    Object value = items[key] as Object;

    return value == null || !(value is String) ? "" : value.toString();
  }

  int getInt(String key) {
    if (items[key] != null) {
      Object value = items[key] as Object;

      return value == null ? 0 : value as int;
    } else {
      return 0;
    }
  }

  String getFullName(item) {
    // return "${bm.getString(FIRST_NAME)}";
    BaseModel bm;
    if (item is Map) {
      bm = BaseModel(items: item);
    } else {
      bm = item;
    }
    return "${bm.getString(FIRST_NAME)} ${bm.getString(LAST_NAME)} ";
  }

  int getTime() {
    if (items[CREATED_AT] is FieldValue) return items[TIME] as int;

    Timestamp time = getCreatedAt();
    if (time != null) return getCreatedAt().millisecondsSinceEpoch;

    return items[TIME] as int;
  }

  getCreatedAt() {
    return items[CREATED_AT];
  }

  String getUserId() {
    Object value = items[USER_ID] as Object;

    return value == null || !(value is String) ? "" : value.toString();
  }

  // bool myItem() {
  //   // return false;
  //   return getUserId() == (userModel.getObjectId());
  // }

  bool getBoolean(String key) {
    Object value = items[key] as Object;
    return value == null || !(value is bool) ? false : value;
  }
}
