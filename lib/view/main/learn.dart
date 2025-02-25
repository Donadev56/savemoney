import 'dart:ui';

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

  List<Contact> contacts = [
    Contact(name: "Anais", userId: 254468, contactCode: "Anais-424256", imageUrl: "https://instagram.fbzv3-1.fna.fbcdn.net/v/t51.29350-15/433387024_1352054588790866_5209624141049262214_n.jpg?stp=dst-jpg_e35_p1080x1080_tt6&_nc_ht=instagram.fbzv3-1.fna.fbcdn.net&_nc_cat=102&_nc_oc=Q6cZ2AEzSS5Xo1-bgYDSBiVjeHV9F1LxmKj0bXUYJuxJxspKGcm5GRogN-axCCzXHMXozRq7Cm8yBlZBnpOqMnJGl_5u&_nc_ohc=voZjRhtURnYQ7kNvgH7gNhS&_nc_gid=5d069ac8753d48f690a46773b4754931&edm=ANTKIIoBAAAA&ccb=7-5&oh=00_AYAm7mmLqEJZdoGSYP9423rk5SoK49HsHbi7b-24MdfrdA&oe=67C37D92&_nc_sid=d885a2"), 
    Contact(name: "Jacques", userId: 254467, contactCode: "Jacques-789456", imageUrl: "https://img.freepik.com/free-photo/day-walk-person-male-success-using_1303-2923.jpg?semt=ais_hybrid"),
    Contact(name: "Mariam", userId: 254466, contactCode: "Mariam-123456", imageUrl: "https://img.freepik.com/premium-photo/fashion-outdoor-street-style-portrait-beautiful-young-african-american-woman-posing-outside_124463-4354.jpg?ga=GA1.1.1383255082.1740485538&semt=ais_hybrid"),
  
  ];

  @override
  Widget build(BuildContext context) {
   final height = MediaQuery.of(context).size.height;
   final width = MediaQuery.of(context).size.width;

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
        // head
        child: Column(
          children: [
            // first child
            CustomOptionWidget(
              onTap: (index) {
                log("Element taped $index");
              },
              spaceNameStyle:
                  GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
              backgroundColor: appColors.secondaryColor,
              options: [
                Option(
                    titleStyle: GoogleFonts.roboto(
                        color: appColors.textColor, fontSize: 16),
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
                    titleStyle: GoogleFonts.roboto(
                        color: appColors.textColor, fontSize: 16),
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
                    titleStyle: GoogleFonts.roboto(
                        color: appColors.textColor, fontSize: 16),
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
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 10,
            ),
            // second child
            CustomOptionWidget(
              onTap: (index) {
                log("Element taped $index");
              },
              backgroundColor: appColors.secondaryColor,
              spaceNameStyle:
                  GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
              options: [
                Option(
                    tileColor: appColors.themeColor.withOpacity(0.05),
                    title: "Chat with Sauraya AI",
                    titleStyle: GoogleFonts.roboto(
                        color: appColors.themeColor, fontSize: 16),
                    icon: Icon(
                      LucideIcons.botMessageSquare,
                      color: appColors.themeColor,
                    ),
                    trailing: Icon(
                      LucideIcons.chevronRight,
                      color: appColors.themeColor,
                    ),
                    color: appColors.textColor),
              ],
              spaceName: "AI Advices",
              containerRadius: BorderRadius.circular(10),
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 10,
            ),
            // third child
            CustomOptionWidget(
              onTap: (index) {
                log("Element taped $index");
              },
              backgroundColor: appColors.secondaryColor,
              spaceNameStyle:
                  GoogleFonts.roboto(color: appColors.textColor, fontSize: 16),
              options: [
                Option(
                    title: "Chat with friends",
                    titleStyle: GoogleFonts.roboto(
                        color: appColors.textColor, fontSize: 16),
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
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
      floatingActionButton: TextButton.icon(
        onPressed: () {
          showModalBottomSheet(
              clipBehavior: Clip.antiAlias,
              backgroundColor: appColors.primaryColor,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext ctx) {
                return Container(
                  height: height * 0.9,
                  width: width ,
                  decoration: BoxDecoration(
                      color: appColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                          child: Column(
                            spacing: 15,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
                                height: 45,
                                width:  width * 0.9,
                                child:TextField(
                                
                                  cursorColor: appColors.textColor.withOpacity(0.8),
                                  scrollPadding:const EdgeInsets.all(0),
                                  style: GoogleFonts.roboto(color: appColors.textColor,fontSize: 14),
                              
                                onChanged: (value) {
                                
                                },
                                
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search, color: appColors.textColor.withOpacity(0.7),),
                                  
                                  filled: true,
                                  fillColor: appColors.textColor.withOpacity(0.05),
                                  hintText: "Search Contacts...",
                                  
                                  hintStyle: GoogleFonts.roboto(color: appColors.textColor),
                                  alignLabelWithHint: false,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 0, color: Colors.transparent)
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(width: 0, color: Colors.transparent)
                                  ),
                                ),
                              ) ,
                              ),

                           SizedBox(
                            width: width * 0.9,
                            child:  Material(
                              color: Colors.transparent,
                              child:ListTile(
                                splashColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                tileColor: appColors.secondaryColor,
                                onTap: () {
                                    log("Click");
                                },
                                leading: Icon(Icons.qr_code, color: appColors.textColor,),
                                title: Text("Share your contact", style: GoogleFonts.roboto(color: appColors.textColor),),
                              )
                               ,
                             ) ,
                           ) 
                           ,

                          SingleChildScrollView(
                              child:  SizedBox(
                            width: width * 0.9,
                            height: height * 0.72,
                            child: ListView.builder(
                                itemCount: contacts.length,
                                itemBuilder: (ctx , index) {
                                  final contact = contacts[index];
                                  return Padding(padding: const EdgeInsets.only(top: 5, bottom: 5), 
                                  child: Material(
                                    color: Colors.transparent,
                                    child:ListTile(  
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      tileColor: appColors.secondaryColor,
                                      splashColor: Colors.transparent,
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(contact.imageUrl, width: 40, height: 40,fit: BoxFit.cover,),
                                    ), 
                                    
                                    title: Text(contact.name, style: GoogleFonts.roboto(color: appColors.textColor),),
                                    trailing: PopupMenuButton(
                                      color: appColors.secondaryColor,
                                      icon: Icon(Icons.more_vert, color: appColors.textColor,),
                                    itemBuilder: (ctx) {
                                      return [
                                        PopupMenuItem(
                                          child: Row(
                                            spacing: 8,
                                            children: [
                                              Icon(Icons.phone, color: appColors.textColor,),
                                               Text(
                                            "Call",
                                            style: GoogleFonts.roboto(color: appColors.textColor),
                                          ),

                                            ],
                                          ),
                                          onTap: () {
                                            log("Call ${contact.name}");
                                          },
                                        ),
                                        PopupMenuItem(
                                          child: Row(
                                            spacing: 8,
                                            children: [
                                              Icon(Icons.message , color: appColors.textColor,),
                                              Text(
                                            "Message",
                                            style: GoogleFonts.roboto(color: appColors.textColor),
                                          ),

                                            ],
                                          ) ,
                                          onTap: () {
                                            log("Message ${contact.name}");
                                          },
                                        ),    PopupMenuItem(
                                          
                                          child:Container(
                                            
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                                                          color: appColors.redColor.withOpacity(0.1),
                                                                                          borderRadius: BorderRadius.circular(10)

                                            ),
                                            child: Row(
                                            spacing: 8,
                                            children: [
                                              Icon(LucideIcons.trash , color: appColors.redColor,),
                                              Text(
                                            "Delete",
                                            style: GoogleFonts.roboto(color: appColors.redColor),
                                          ),

                                            ],
                                          ),
                                          )  ,
                                          onTap: () {
                                            log("Delete ${contact.name}");
                                          },
                                        ),
                                      ];
                                    }),
                                    onTap: () {
                                      log("Element taped $index");
                                    },
                                  ),
                                  ) ,) ;
                                
                              }) ,
                            ) ,
                           ),

                          
                              
                            ],
                          ),
                );
              });
        },
        style:
            ElevatedButton.styleFrom(backgroundColor: appColors.secondaryColor),
        icon: Icon(
          LucideIcons.messageSquare,
          color: appColors.textColor,
        ),
        label: Text(
          "Chat with friends",
          style: GoogleFonts.roboto(color: appColors.textColor),
        ),
      ),
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
