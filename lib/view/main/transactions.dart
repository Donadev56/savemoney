// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/logger/log.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/constant.dart';
import 'package:save_money/utils/day_manager.dart';
import 'package:save_money/widgets/bottom.dart';
import 'package:save_money/widgets/transaction_widget.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  AppColors appColors = AppColors();
  final dayManager = DayManager();

 

  String dateName (String date) {
    final dateNowString = dayManager.getCurrentYMD();
    log("date now string $dateNowString");
    final day = int.parse(dateNowString.split("-")[2]);
    final providedDay =int.parse( date.split("-")[2]);
    if (day == providedDay) { 
      return "Today";
    } else if (day - providedDay == 1) {
      return "Yesterday";
     } else {
      return date ;
     }
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appColors.primaryColor,
      
      appBar: AppBar(
        surfaceTintColor: appColors.secondaryColor,
        leading: Icon(Icons.arrow_back,color: appColors.textColor,),
        title: Text("Transactions", style: GoogleFonts.roboto(
          color: appColors.textColor,
        ),),
        backgroundColor: appColors.primaryColor,
      ),
     body: SingleChildScrollView(
      child: Column(
        spacing: 15,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
          width: width * 0.9 ,

          child: 
        TextField(
          style: GoogleFonts.roboto(color: appColors.textColor),
          cursorColor: appColors.themeColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: appColors.textColor.withOpacity(0.025),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 0, color: Colors.transparent)

                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 0, color: Colors.transparent)
                ),
                hintText: 'Search transactions',
                prefixIcon: Icon(Icons.search, color: appColors.textColor.withOpacity(0.5),),
                suffixIcon: PopupMenuButton(
                  color: appColors.secondaryColor,
                  icon: Icon(LucideIcons.slidersHorizontal, color: appColors.textColor.withOpacity(0.6),),
                  itemBuilder: (ctx) {
                  return [
                    PopupMenuItem(
                      value: "Today",
                      child: Text(
                        "Today",
                        style: GoogleFonts.roboto(color: appColors.textColor.withOpacity(0.6)),
                      ),
                    ),
                    PopupMenuItem(
                      value: "This week",
                      child: Text(
                        "This week",
                        style: GoogleFonts.roboto(color: appColors.textColor.withOpacity(0.6)),
                      ),
                    ),
                    PopupMenuItem(
                      value: "This month",
                      child: Text(
                        "This month",
                        style: GoogleFonts.roboto(color: appColors.textColor.withOpacity(0.6)),
                      ),
                    ),
                  ];
                }),
                hintStyle: GoogleFonts.roboto(color: appColors.textColor.withOpacity(0.4))
              ),
              onChanged: (value) {
               
              },
            ),

            

          )),

       
        
      
         SizedBox(
          height: height * 0.735,
          width: width * 0.9,
          child: ListView.builder(
            
                itemCount: detailedTransactions.length,
                itemBuilder: (context, index) {
                  final transactionDate = detailedTransactions.keys.toList()[index];
                  final transactionValues = detailedTransactions.values.toList()[index];
                  return Column(
                    children: [
                    Padding(padding: const EdgeInsets.all(10), 
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(dateName(transactionDate), style: GoogleFonts.robotoMono(color: appColors.textColor, fontSize: 20,fontWeight: FontWeight.bold ),),
                     ) ,) ,
                   
                     Column(
                        children: List.generate(transactionValues.length, (index) { 

                          final currentTransaction = transactionValues[index];
                          return TransactionWidget(icon: currentTransaction.icon, title: currentTransaction.title, description: currentTransaction.description, amount: currentTransaction.amount, date: currentTransaction.date, textColor: currentTransaction.color ?? appColors.textColor, primaryColor: currentTransaction.color ?? appColors.textColor);
                        },),
                      )  , 
                    
                    ],
                  
                  ) ;
                },
              ),
         )  
           
            
            

        ],
      ),
     ) ,
        floatingActionButton: FloatingActionButton.extended
            (
              extendedPadding: const EdgeInsets.symmetric( horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              backgroundColor: appColors.themeColor,
              onPressed: () {},
            icon: Icon(Icons.add, color: appColors.primaryColor,),
        label:  Text('Add transaction'),
            ),
       bottomNavigationBar: CustomBottomNav(
        appColors: appColors,
        currentIndex: 1,
        onTap: (index) {
          final String route = bottomOptions[index]["route"] ?? "/";
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}


