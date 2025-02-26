// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/logger/log.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/constant.dart';
import 'package:save_money/widgets/bottom.dart';
import 'package:save_money/widgets/custom_options.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
    AppColors colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        surfaceTintColor: colors.secondaryColor,
        backgroundColor: colors.primaryColor,
        leading: Icon(Icons.arrow_back, color: colors.textColor,),
        title: Text("Settings", style: GoogleFonts.roboto(color: colors.textColor),),
      ),

       body: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [

                 CustomOptionWidget(
              containerRadius: BorderRadius.circular(10),
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              spaceName: "Profile", spaceNameStyle: GoogleFonts.roboto(color: colors.textColor), options: [
              Option(title: "Profile settings", icon: Icon(LucideIcons.user, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
            
         
            ], onTap: (index) {
              log("Element clicked at index $index");
            }) ,
            CustomOptionWidget(
              containerRadius: BorderRadius.circular(10),
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              spaceName: "preferences", spaceNameStyle: GoogleFonts.roboto(color: colors.textColor), options: [
              Option(title: "Change App colors", icon: Icon(LucideIcons.palette, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
                    Option(title: "Daily reminders settings", icon: Icon(LucideIcons.clock, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor), subtitle: Text("Off", style: GoogleFonts.roboto(color: colors.textColor.withOpacity(0.7)),)),
             Option(title: "Autofill settings", icon: Icon(LucideIcons.calendarCog, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor), subtitle: Text("On", style: GoogleFonts.roboto(color: colors.textColor.withOpacity(0.7)),)),
           Option(title: "Alert threshold", icon: Icon(LucideIcons.bell, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
       Option(title: "Currency", icon: Icon(LucideIcons.dollarSign, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor), subtitle: Text('USD', style: GoogleFonts.roboto(color: colors.textColor.withOpacity(0.7)),)),
             Option(title: "Language", icon: Icon(LucideIcons.languages, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor), subtitle: Text("English", style: GoogleFonts.roboto(color: colors.textColor.withOpacity(0.7)),))
            ], onTap: (index) {
              log("Element clicked at index $index");
            }),


                 CustomOptionWidget(
              containerRadius: BorderRadius.circular(10),
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              spaceName: "Premium & more", spaceNameStyle: GoogleFonts.roboto(color: colors.textColor), options: [
              Option(title: "Get Premium", icon: Icon(LucideIcons.sparkle, color: colors.themeColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.themeColor,
                    ) , color: colors.themeColor, titleStyle: GoogleFonts.roboto(color: colors.themeColor), tileColor: colors.themeColor.withOpacity(0.05)),
                  Option(title: "Share your account", icon: Icon(LucideIcons.share, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
            
         
         
            ], onTap: (index) {
              log("Element clicked at index $index");
            }) ,

          
               


                 CustomOptionWidget(
              containerRadius: BorderRadius.circular(10),
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              spaceName: "Help", spaceNameStyle: GoogleFonts.roboto(color: colors.textColor), options: [
              Option(title: "Customer service", icon: Icon(LucideIcons.headphones, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
            
               Option(title: "About", icon: Icon(LucideIcons.circleHelp, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
            
         
            ], onTap: (index) {
              log("Element clicked at index $index");
            }) ,

              CustomOptionWidget(
              containerRadius: BorderRadius.circular(10),
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              spaceName: "Account", spaceNameStyle: GoogleFonts.roboto(color: colors.textColor), options: [
                Option(title: "Logout", icon: Icon(LucideIcons.logOut, color: colors.textColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.textColor,
                    ) , color: colors.textColor, titleStyle: GoogleFonts.roboto(color: colors.textColor)),
            
         
                Option(title: "Delete your account", icon: Icon(LucideIcons.trash, color: colors.redColor,), trailing:Icon(
                      LucideIcons.chevronRight,
                      color: colors.redColor,
                    ) , color: colors.redColor, titleStyle: GoogleFonts.roboto(color: colors.redColor), tileColor: colors.redColor.withOpacity(0.05)),
                  
            
         
            ], onTap: (index) {
              log("Element clicked at index $index");
            }) ,
          ],
        ),
       ),
         bottomNavigationBar: CustomBottomNav(
        appColors: colors,
        currentIndex: 4,
        onTap: (index) {
          final String route = bottomOptions[index]["route"] ?? "/";
          Navigator.pushNamed(context, route);
        },
      ),
    
    );
  }
}