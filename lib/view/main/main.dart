import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/languages/languages.dart';
import 'package:save_money/logger/log.dart';
import 'package:save_money/resources/colors.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/color.dart';
import 'package:save_money/utils/constant.dart';
import 'package:save_money/widgets/bottom.dart';
import 'package:save_money/widgets/divider.dart';
import 'package:save_money/widgets/transaction_widget.dart';

class MainDashboardView extends StatefulWidget {
  const MainDashboardView({super.key});

  @override
  State<MainDashboardView> createState() => _MainDashboardViewState();
}

class _MainDashboardViewState extends State<MainDashboardView> {
  AppColors appColors = AppColors();
  final ColorsManager manager = ColorsManager();

  List<Transaction> transactions = [
    Transaction(
        amount: 125,
        title: "Market money",
        description: "Money spent on the evening market.",
        icon: Icons.shopping_bag,
        date: 153535535357828,
        color: Colors.greenAccent),
    Transaction(
        amount: 75,
        title: "Groceries",
        description: "Money spent on the groceries.",
        icon: Icons.local_grocery_store,
        date: 153535535357828,
        color: Colors.pinkAccent),
    Transaction(
        amount: 150,
        title: "Eating out",
        description: "Money spent on the dinner.",
        icon: Icons.restaurant,
        date: 153535535357828),
    Transaction(
        amount: 100,
        title: "Transportation",
        description: "Money spent on the car rental.",
        icon: Icons.directions_car,
        date: 153535535357828,
        color: Colors.lightBlueAccent),
    Transaction(
        amount: 200,
        title: "Healthcare",
        description: "Money spent on the doctor's visit.",
        icon: Icons.local_hospital,
        date: 153535535357828),
    Transaction(
        amount: 175,
        title: "Entertainment",
        description: "Money spent on the movie theater.",
        icon: Icons.movie_filter,
        date: 153535535357828,
        color: Colors.amberAccent),
  ];

  Future<void> getColors() async {
    try {
      final savedColors = await manager.getColorsFromTheme();
      setState(() {
        appColors = savedColors;
      });
    } catch (e) {
      logError(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getColors();
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: appColors.grayColor,
        backgroundColor: appColors.primaryColor,
        title: Text(
          AppLocale.budgetText.getString(context),
          style: GoogleFonts.roboto(
              color: appColors.textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                LucideIcons.circlePlus,
                color: appColors.textColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                LucideIcons.activity,
                color: appColors.textColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: width * 0.9,
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 7,
                          children: [
                            Text(
                              AppLocale.availableText.getString(context),
                              style: GoogleFonts.roboto(
                                color: appColors.textColor.withOpacity(0.8),
                                fontSize: 17,
                              ),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "1250",
                                style: GoogleFonts.robotoMono(
                                    color: appColors.textColor,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              ),
                              WidgetSpan(
                                  child: SizedBox(
                                width: 10,
                              )),
                              TextSpan(
                                text: "USD",
                                style: GoogleFonts.robotoMono(
                                    color: appColors.textColor.withOpacity(0.6),
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              )
                            ])),
                            Row(
                              spacing: 10,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: appColors.secondaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {},
                                      child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            spacing: 10,
                                            children: [
                                              Icon(
                                                LucideIcons.botMessageSquare,
                                                size: 12,
                                                color: appColors.textColor,
                                              ),
                                              Text(
                                                "AI advice ",
                                                style: GoogleFonts.roboto(
                                                    color: appColors.textColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                  child: Text(
                                    AppLocale.aiAdviceExample
                                        .getString(context),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                        color: appColors.textColor
                                            .withOpacity(0.9),
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        TextButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appColors.secondaryColor),
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: appColors.textColor,
                          ),
                          label: Text(
                            AppLocale.addBalanceText.getString(context),
                            style:
                                GoogleFonts.roboto(color: appColors.textColor),
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                width: width * 0.9,
                padding: const EdgeInsets.all(15),
                height: 320,
                decoration: BoxDecoration(
                  color: appColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    AppLocale.financialHealthText
                                        .getString(context),
                                    style: GoogleFonts.roboto(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Icon(
                                    LucideIcons.heartPulse,
                                    color: Colors.lightBlueAccent,
                                    size: 20,
                                  )
                                ],
                              ),
                              Text(
                                AppLocale.monthlySavingText.getString(context),
                                style: GoogleFonts.roboto(
                                    color: appColors.textColor.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Text(
                                    "\$ 20",
                                    style: GoogleFonts.roboto(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomVerticalDivider(
                                      height: 15, color: Colors.grey, width: 1),
                                  Text(
                                    "+ 3.5 %",
                                    style: GoogleFonts.roboto(
                                        color: appColors.greenColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  VerticalDivider(
                                    color: appColors.textColor,
                                  ),
                                ],
                              ),
                              Text(
                                AppLocale.monthlyExpense.getString(context),
                                style: GoogleFonts.roboto(
                                    color: appColors.textColor.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 8,
                                children: [
                                  Text(
                                    "\$ 10",
                                    style: GoogleFonts.roboto(
                                        color: appColors.textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CustomVerticalDivider(
                                      height: 15, color: Colors.grey, width: 1),
                                  Text(
                                    "- 2.5 %",
                                    style: GoogleFonts.roboto(
                                        color: appColors.redColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  VerticalDivider(
                                    color: appColors.textColor,
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 177,
                        width: width * 0.8,
                        child: LineChart(
                          mainData(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: width * 0.9,
                height: 320,
                decoration: BoxDecoration(),
                child: Column(
                  spacing: 10,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocale.transactionsText.getString(context),
                        style: GoogleFonts.roboto(
                          color: appColors.textColor.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: transactions.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final transaction = transactions[index];
                              return TransactionWidget(
                                amount: transaction.amount,
                                title: transaction.title,
                                date: transaction.date,
                                description: transaction.description,
                                icon: transaction.icon,
                                textColor: appColors.textColor,
                                primaryColor: appColors.primaryColor,
                                color: transaction.color,
                              );
                            }))
                  ],
                ),
              ),

              /*SizedBox(
                  width: width * 0.9,
                  child: Divider(
                    color: textColor.withOpacity(0.1),
                  ),
                ) */
            ],
          ),
        ),
      ),
      floatingActionButton: TextButton.icon(
        style:
            ElevatedButton.styleFrom(backgroundColor: appColors.secondaryColor),
        onPressed: () {},
        icon: Icon(
          LucideIcons.plus,
          color: appColors.textColor,
        ),
        label: Text(
          AppLocale.addWalletText.getString(context),
          style: GoogleFonts.roboto(color: appColors.textColor),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        appColors: appColors,
        currentIndex: 2,
        onTap: (index) {
          final String route = bottomOptions[index]["route"] ?? "/";
          Navigator.pushNamed(context, route);
        },
      ),
      backgroundColor: appColors.primaryColor,
    );
  }
}
