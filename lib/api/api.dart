import 'dart:convert';
import 'package:fruit_app/models/Categories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/User.dart';

class API {
  static const String url = "http://192.168.100.7:5000";
  static List<Categories> parseCate(String res) {
    var list = json.decode(res) as List<dynamic>;
    List<Categories> dataCate =
        list.map((e) => Categories.fromJson(e)).toList();
    return dataCate;
  }

  static List<User> parseUser(String res) {
    var list = json.decode(res) as List<dynamic>;
    List<User> dataUser = list.map((e) => User.fromJson(e)).toList();
    return dataUser;
  }

  static Future<List<Categories>> getCategory() async {
    final res = await http.get(Uri.parse("$url/allcategory"));
    if (res.statusCode == 200) {
      print(res.body);
      return compute(parseCate, res.body);
    } else if (res.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get cate');
    }
  }

  static Future<List<User>> getUser(String u) async {
    final res = await http.get(Uri.parse("$url/login?username=$u"));
    if (res.statusCode == 200) {
      return compute(parseUser, res.body);
    } else if (res.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get cate');
    }
  }

  static Future<List<User>> getExistUser(String u) async {
    final res = await http.get(Uri.parse("$url/existuser?email=$u"));
    if (res.statusCode == 200) {
      return compute(parseUser, res.body);
    } else if (res.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get user');
    }
  }

  static Future<User> postUser(
      String p, String e, String a, String f, String l, int ph) async {
    final res = await http.post(Uri.parse(
        "$url/signup?password=$p&email=$e&address=$a&firstname=$f&lastname=$l&phone=$ph"));

    if (res.statusCode == 200) {
      return userModelFromJson(res.body);
    } else if (res.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get cate');
    }
  }
}
