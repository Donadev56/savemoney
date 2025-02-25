// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Transaction {
  final double amount;
  final String title;
  final String description;
  final IconData icon;
  final int date;
  final Color? color;

  Transaction({
    required this.amount,
    required this.title,
    required this.description,
    required this.icon,
    required this.date,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'title': title,
      'description': description,
      'icon': icon.codePoint,
      'date': date,
      'color': int.parse(color.toString()),
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amount: json['amount'],
      title: json['title'],
      description: json['description'],
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
      date: json['date'],
      color: json['color'],
    );
  }

  @override
  String toString() {
    return 'Transaction(amount: $amount, title: $title, description: $description, icon: $icon, date: $date)';
  }
}

class AppColors {
  final Color primaryColor;
  final Color themeColor;
  final Color greenColor;
  final Color secondaryColor;
  final Color grayColor;
  final Color textColor;
  final Color redColor;

  AppColors({
    Color? primaryColor,
    Color? themeColor,
    Color? greenColor,
    Color? secondaryColor,
    Color? grayColor,
    Color? textColor,
    Color? redColor,
  })  : primaryColor = Color(0XFF0D0D0D),
        themeColor = Colors.greenAccent,
        greenColor = Colors.greenAccent,
        secondaryColor = Color(0XFF121212),
        grayColor = Color(0XFF353535),
        textColor = Colors.white,
        redColor = Colors.pinkAccent;

  Map<String, dynamic> toJson() {
    return {
      'primaryColor': primaryColor.value,
      'themeColor': themeColor.value,
      'greenColor': greenColor.value,
      'secondaryColor': secondaryColor.value,
      'grayColor': grayColor.value,
      'textColor': textColor.value,
      'redColor': redColor.value,
    };
  }

  factory AppColors.fromJson(Map<String, dynamic> json) {
    return AppColors(
      primaryColor: Color(json['primaryColor'] ?? Colors.black.value),
      themeColor: Color(json['themeColor'] ?? Colors.black.value),
      greenColor: Color(json['greenColor'] ?? Colors.black.value),
      secondaryColor: Color(json['secondaryColor'] ?? Colors.black.value),
      grayColor: Color(json['grayColor'] ?? Colors.black.value),
      textColor: Color(json['textColor'] ?? Colors.black.value),
      redColor: Color(json['redColor'] ?? Colors.black.value),
    );
  }

  @override
  String toString() {
    return 'AppColors(primaryColor: $primaryColor, themeColor: $themeColor, greenColor: $greenColor, secondaryColor: $secondaryColor, grayColor: $grayColor, textColor: $textColor, redColor: $redColor)';
  }
}

class Option {
  final String title;
  final Widget icon;
  final Widget trailing;
  final Color color;
  final TextStyle? titleStyle;
  final Color? tileColor;

  Option({
    required this.title,
    required this.icon,
    required this.trailing,
    required this.color,
    this.titleStyle,
    this.tileColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon.runtimeType.toString(),
      'trailing': trailing.runtimeType.toString(),
      'color': color.value,
    };
  }

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      title: json['title'],
      icon: json['icon'] == 'Icon' ? Icon(Icons.home) : SizedBox(),
      trailing: json['trailing'] == ' SizedBox' ? SizedBox() : SizedBox(),
      color: Color(json['color']),
    );
  }

  @override
  String toString() {
    return 'Option(title: $title, icon: $icon, trailing: $trailing, color: $color)';
  }
}


class Contact {
  final String name;
  final int userId;
  final String contactCode;
  final String imageUrl ;


  Contact({
    required this.name,
    required this.userId,
    required this.contactCode,
    this.imageUrl = '',

   
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'userId': userId,
      'contactCode': contactCode,
      'imageUrl': imageUrl, 
    };
  }

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      userId: json['userId'],
      contactCode: json['contactCode'],
      imageUrl: json['imageUrl'],  
    
    );
  }

  @override
  String toString() {
    return 'Contact(name: $name, userId: $userId, contactCode: $contactCode  , imageUrl: $imageUrl)';
  }
}
