import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

List<Map<String, dynamic>> bottomOptions = [
  {"icon": LucideIcons.graduationCap, "label": "Learn", "route": "/main/learn"},
  {
    "icon": LucideIcons.layoutList,
    "label": "Transactions",
    "route": "/main/transactions"
  },
  {"icon": Icons.dashboard, "label": "Dashboard", "route": "/main/dashboard"},
  {
    "icon": Icons.account_balance_wallet,
    "label": "Wallets",
    "route": "/main/wallets"
  },
  {"icon": Icons.settings, "label": "Settings", "route": "/main/settings"}
];
