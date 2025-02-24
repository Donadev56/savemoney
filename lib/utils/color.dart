import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:save_money/logger/log.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/prefs.dart';

class ColorsManager {
  final prefs = PublicDataManager();
  final String colorsName = "app-main-colors";
  final String appThemeName = "app-theme";

  AppColors darkColors = AppColors(
      primaryColor: Color(0XFF0D0D0D),
      themeColor: Colors.greenAccent,
      greenColor: Colors.greenAccent,
      secondaryColor: Color(0XFF121212),
      grayColor: Color(0XFF353535),
      textColor: Colors.white,
      redColor: Colors.pinkAccent);

  AppColors lightColors = AppColors(
      primaryColor: Colors.white,
      themeColor: Colors.greenAccent,
      greenColor: Colors.greenAccent,
      secondaryColor: Colors.black,
      grayColor: Colors.white70,
      textColor: Colors.black,
      redColor: Colors.pinkAccent);
  Future<bool> saveColors(AppColors colors) async {
    try {
      final res = await prefs.saveDataInPrefs(
          data: json.encode(colors.toJson()), key: colorsName);
      return res;
    } catch (e) {
      logError(e.toString());
      return false;
    }
  }

  Future<AppColors> getColorsFromColors() async {
    try {
      final res = await prefs.getDataFromPrefs(key: colorsName);
      if (res != null) {
        final colorsJson = json.decode(res);
        return AppColors.fromJson(colorsJson);
      } else {
        return darkColors;
      }
    } catch (e) {
      logError(e.toString());
      return darkColors;
    }
  }

  Future<AppColors> getColorsFromTheme() async {
    try {
      final savedTheme = await prefs.getDataFromPrefs(key: appThemeName);

      if (savedTheme != null && (savedTheme).trim().contains("light")) {
        return lightColors;
      } else {
        return darkColors;
      }
    } catch (e) {
      logError(e.toString());
      return darkColors;
    }
  }

  Future<bool> saveThemeColors({required bool toDark}) async {
    if (toDark) {
      return await prefs.saveDataInPrefs(data: "dark", key: appThemeName);
    } else {
      return await prefs.saveDataInPrefs(data: "light", key: appThemeName);
    }
  }
}
