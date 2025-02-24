import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/languages/languages.dart';
import 'package:save_money/logger/log.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/constant.dart';
import 'package:save_money/widgets/bottom.dart';
import 'package:save_money/widgets/custom_options.dart';

class LearnView extends StatefulWidget {
  const LearnView({super.key});

  @override
  State<LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView> {
  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primaryColor,
      appBar: AppBar(
        backgroundColor: appColors.primaryColor,
        surfaceTintColor: appColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: appColors.textColor,
            )),
        title: Text(
          AppLocale.learnText.getString(context),
          style: GoogleFonts.roboto(color: appColors.textColor),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          CustomOptionWidget(
           onTap: (index) {
            log("Element taped $index");

           },
            spaceNameStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
            backgroundColor: appColors.secondaryColor,
            options: [
              Option(
      titleStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),

                  title: "Join Discussions",
                  icon: Icon(
                    LucideIcons.messagesSquare,
                    color: appColors.textColor,
                  ),
                  trailing: Icon(
                    LucideIcons.chevronRight,
                    color: appColors.textColor,
                  ),
                  color: appColors.textColor),
                   Option(
                 titleStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),

                  title: "Join Telegram",
                  icon: Icon(
                    LucideIcons.send,
                    color: appColors.textColor,
                  ),
                  trailing: Icon(
                    LucideIcons.chevronRight,
                    color: appColors.textColor,
                  ),
                  color: appColors.textColor),
                    Option(
             titleStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),

                  title: "Join WhatsApp",
                  icon: Icon(
                    LucideIcons.messageCircle,
                    color: appColors.textColor,
                  ),
                  trailing: Icon(
                    LucideIcons.chevronRight,
                    color: appColors.textColor,
                  ),
                  color: appColors.textColor)
            ],
            spaceName: "SM Community",
           containerRadius: BorderRadius.circular(10),
            shapeBorder:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),


          SizedBox(height: 10,),


             CustomOptionWidget(
           onTap: (index) {
            log("Element taped $index");

           },
             backgroundColor: appColors.secondaryColor,

            spaceNameStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
            options: [
              Option(  
                
                  tileColor:appColors.themeColor.withOpacity(0.05),
                  title: "Chat with Sauraya AI",
                  titleStyle: GoogleFonts.roboto(color:  appColors.themeColor, fontSize: 16),
                  icon: Icon(
                    LucideIcons.botMessageSquare,
                    color:  appColors.themeColor,
                  ),
                  trailing: Icon(
                    LucideIcons.chevronRight,
                    color: appColors.themeColor,
                  ),
                  color:appColors.textColor),
                 
             
            ],
            spaceName: "AI Advices",
            containerRadius: BorderRadius.circular(10),
            shapeBorder:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),

          SizedBox(height: 10,),


             CustomOptionWidget(
           onTap: (index) {
            log("Element taped $index");

           },
             backgroundColor: appColors.secondaryColor,

            spaceNameStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
            options: [
              Option(
                  title: "Chat with friends",
                  titleStyle: GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
                  icon: Icon(
                    LucideIcons.messageSquare,
                    color: appColors.textColor,
                  ),
                  trailing: Icon(
                    LucideIcons.chevronRight,
                    color: appColors.textColor,
                  ),
                  color: appColors.textColor),
                 
             
            ],
            spaceName: "Discussions",
            containerRadius: BorderRadius.circular(10),
            shapeBorder:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
      ) ,
      floatingActionButton: TextButton.icon(onPressed: () {} , style: ElevatedButton.styleFrom(backgroundColor: appColors.secondaryColor), icon: Icon(LucideIcons.messageSquare, color: appColors.textColor,),label: Text("Chat with friends", style: GoogleFonts.roboto(color: appColors.textColor),),),
      bottomNavigationBar: CustomBottomNav(
        appColors: appColors,
        currentIndex: 0,
        onTap: (index) {
          final String route = bottomOptions[index]["route"] ?? "/";
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
