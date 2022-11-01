import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class MI {
  String title;
  int amount;
  String kind;
  factory MI.fromJson(Map<String, dynamic> json) => MI(
    title: json["title"],
    amount: json["amount"],
    kind: json["kind"]
  );
  Map<String, dynamic> toJson(){
    return {
      "title": this.title,
      "amount": this.amount,
      "map": this.kind,
    };
  }
  MI({
    required this.title,
    required this.amount,
    required this.kind
  });

}
