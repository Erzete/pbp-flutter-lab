import 'package:flutter/material.dart';

var theBudget = <Budget>[]; 

class Budget {
  final String judul;
  final int nominal;
  final String tipe;

  Budget(this.judul, this.nominal, this.tipe);

  // named constructor
  Budget.fromJson(Map<String, dynamic> json)
      : judul = json['judul'],
        nominal = json['nominal'],
        tipe = json['tipe'];
  // method
  Map<String, dynamic> toJson() {
    return {
      'judul': judul,
      'nominal': nominal,
      'tipe': tipe,
    };
  }
 
}