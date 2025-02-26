import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/types/types.dart';

typedef OnTapWithIndex = void Function(int index);

List<Map<String, dynamic>> bottomOptions = [
  {"icon": LucideIcons.graduationCap, "label": "Learn", "route": "/main/learn"},
  {
    "icon": LucideIcons.layoutList,
    "label": "Transactions",
    "route": "/main/transactions"
  },
  {
    "icon": LucideIcons.layoutDashboard,
    "label": "Dashboard",
    "route": "/main/dashboard"
  },
  {
    "icon": Icons.account_balance_wallet,
    "label": "Wallets",
    "route": "/main/wallets"
  },
  {"icon": Icons.settings, "label": "Settings", "route": "/main/settings"}
];
Map<String, List<Transaction>> detailedTransactions = {
  "2025-02-25": [
    Transaction(
        amount: 125,
        title: "Market money",
        description: "Money spent on the evening market.",
        icon: Icons.shopping_bag,
        date: 1737412954,
        color: Colors.greenAccent),
    Transaction(
        amount: 75,
        title: "Groceries",
        description: "Money spent on the groceries.",
        icon: Icons.local_grocery_store,
        date: 1737499354,
        color: Colors.pinkAccent),
    Transaction(
        amount: 150,
        title: "Eating out",
        description: "Money spent on the dinner.",
        icon: Icons.restaurant,
        date: 1737585754),
    Transaction(
        amount: 100,
        title: "Transportation",
        description: "Money spent on the car rental.",
        icon: Icons.directions_car,
        date: 1737672154,
        color: Colors.lightBlueAccent),
    Transaction(
        amount: 200,
        title: "Healthcare",
        description: "Money spent on the doctor's visit.",
        icon: Icons.local_hospital,
        date: 1737758554),
    Transaction(
        amount: 175,
        title: "Entertainment",
        description: "Money spent on the movie theater.",
        icon: Icons.movie_filter,
        date: 1737844954,
        color: Colors.amberAccent),
  ],
  "2025-02-24": [
    Transaction(
        amount: 100,
        title: "Groceries",
        description: "Money spent on the groceries.",
        icon: Icons.local_grocery_store,
        date: 1737844954,
        color: Colors.pinkAccent),
    Transaction(
        amount: 75,
        title: "Market money",
        description: "Money spent on the evening market.",
        icon: Icons.shopping_bag,
        date: 1737844954,
        color: Colors.greenAccent),
    Transaction(
        amount: 150,
        title: "Eating out",
        description: "Money spent on the dinner.",
        icon: Icons.restaurant,
        date: 1737844954),
  ],
  "2025-01-03": [
    Transaction(
        amount: 175,
        title: "Entertainment",
        description: "Money spent on the movie theater.",
        icon: Icons.movie_filter,
        date: 1737844954,
        color: Colors.amberAccent),
    Transaction(
        amount: 100,
        title: "Healthcare",
        description: "Money spent on the doctor's visit.",
        icon: Icons.local_hospital,
        date: 1737844954),
    Transaction(
        amount: 200,
        title: "Transportation",
        description: "Money spent on the car rental.",
        icon: Icons.directions_car,
        date: 1737844954,
        color: Colors.lightBlueAccent),
  ],
};
