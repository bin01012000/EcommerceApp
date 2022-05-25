import 'dart:convert';
import 'package:fruit_app/models/Categories.dart';
import 'package:fruit_app/models/Fav.dart';
import 'package:fruit_app/models/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/User.dart';

class API {
  static const String url = "https://ecom-dier.herokuapp.com";
  static List<CategoryModel> parseCate(String res) {
    var list = json.decode(res) as List<dynamic>;
    List<CategoryModel> dataCate =
        list.map((e) => CategoryModel.fromJson(e)).toList();
    return dataCate;
  }

  static List<ProductModel> parseProduct(String res) {
    var list = json.decode(res) as List<dynamic>;
    List<ProductModel> dataPro =
        list.map((e) => ProductModel.fromJson(e)).toList();
    return dataPro;
  }

  static List<Fav> parseFav(String res) {
    var list = json.decode(res) as List<dynamic>;
    List<Fav> dataPro = list.map((e) => Fav.fromJson(e)).toList();
    return dataPro;
  }

  static List<User> parseUser(String res) {
    var list = json.decode(res) as List<dynamic>;
    List<User> dataUser = list.map((e) => User.fromJson(e)).toList();
    return dataUser;
  }

  static Future<List<ProductModel>> getFav(String u) async {
    final res = await http.get(Uri.parse("$url/getfav?email=$u"));
    if (res.statusCode == 200) {
      return compute(parseProduct, res.body);
    } else if (res.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get cate');
    }
  }

  static Future<List<CategoryModel>> getCategory() async {
    final res = await http.get(Uri.parse("$url/fourcate"));
    if (res.statusCode == 200) {
      return compute(parseCate, res.body);
    } else if (res.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get cate');
    }
  }

  static Future<List<ProductModel>> getProduct() async {
    final res = await http.get(Uri.parse("$url/fourproduct"));
    if (res.statusCode == 200) {
      return compute(parseProduct, res.body);
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
