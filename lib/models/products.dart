import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

List<Products> welcomeFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String userModelToJson(Products data) => json.encode(data.toJson());

@JsonSerializable()
class Products {
  final int id;
  // ignore: non_constant_identifier_names
  final String prod_name;
  // ignore: non_constant_identifier_names
  final String prod_desc;
  // ignore: non_constant_identifier_names
  final String prod_category;
  // ignore: non_constant_identifier_names
  final String prod_stockqty;
  // ignore: non_constant_identifier_names
  final String prod_unit;
  // ignore: non_constant_identifier_names
  final String prod_saleprice;
  // ignore: non_constant_identifier_names
  final String prod_cost;
  // ignore: non_constant_identifier_names
  final String prod_sell;
  // ignore: non_constant_identifier_names
  final String prod_pic;

  Products(
      {required this.id,
      // ignore: non_constant_identifier_names
      required this.prod_name,
      // ignore: non_constant_identifier_names
      required this.prod_desc,
      // ignore: non_constant_identifier_names
      required this.prod_category,
      // ignore: non_constant_identifier_names
      required this.prod_stockqty,
      // ignore: non_constant_identifier_names
      required this.prod_unit,
      // ignore: non_constant_identifier_names
      required this.prod_saleprice,
      // ignore: non_constant_identifier_names
      required this.prod_cost,
      // ignore: non_constant_identifier_names
      required this.prod_sell,
      // ignore: non_constant_identifier_names
      required this.prod_pic});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: int.parse(json['id']),
      prod_name: json["prod_name"],
      prod_desc: json["prod_desc"],
      prod_category: json["prod_category"],
      prod_stockqty: json["prod_stockqty"],
      prod_unit: json["prod_unit"],
      prod_saleprice: json["prod_saleprice"],
      prod_cost: json["prod_cost"],
      prod_sell: json["prod_sell"],
      prod_pic: json["prod_pic"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "prod_name": prod_name,
        "prod_desc": prod_desc,
        "prod_category": prod_category,
        "prod_stockqty": prod_stockqty,
        "prod_unit": prod_unit,
        "prod_saleprice": prod_saleprice,
        "prod_cost": prod_cost,
        "prod_sell": prod_sell,
        "prod_pic": prod_pic,
      };
}
