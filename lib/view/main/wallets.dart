import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:save_money/logger/log.dart';
import 'package:save_money/types/types.dart';
import 'package:save_money/utils/constant.dart';
import 'package:save_money/widgets/bottom.dart';
import 'package:save_money/widgets/wallet_widget.dart';

class WalletsView extends StatefulWidget {
  const WalletsView({super.key});

  @override
  State<WalletsView> createState() => _WalletsViewState();
}

class _WalletsViewState extends State<WalletsView>
    with TickerProviderStateMixin {
  AppColors appColors = AppColors();

  late TabController _tabController;
  List<Wallet> wallets = [
    Wallet(
        walletName: "Daily Food",
        role: WalletRole.expenses,
        transactions: detailedTransactions,
        creationDate: 1735771354,
        balance: 12000,
        id: "zaogsh-hhzh-gsgsg-bsvsvs",
        color: Colors.greenAccent,
        icon: LucideIcons.airVent),
    Wallet(
        walletName: "Groceries",
        role: WalletRole.savings,
        transactions: detailedTransactions,
        creationDate: 1735771354,
        balance: 20000,
        id: "zaogsh-hhzh-gsgsg-bsvsvs",
        color: Colors.lightBlue),
    Wallet(
        walletName: "Travel",
        role: WalletRole.expenses,
        transactions: detailedTransactions,
        creationDate: 1735771354,
        balance: 30000,
        id: "zaogsh-hhzh-gsgsg-bsvsvs"),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appColors.primaryColor,
      appBar: AppBar(
        surfaceTintColor: appColors.secondaryColor,
        backgroundColor: appColors.primaryColor,
        leading: Icon(
          Icons.arrow_back,
          color: appColors.textColor,
        ),
        title: Text(
          "Wallets",
          style: GoogleFonts.roboto(color: appColors.textColor),
        ),
        bottom: TabBar(
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: appColors.textColor.withOpacity(0.5),
          indicatorColor: appColors.themeColor,
          controller: _tabController,
          tabs: [
            Tab(
                icon: Text(
              "Expenses",
              style: GoogleFonts.roboto(color: appColors.textColor),
            )),
            Tab(
                icon: Text(
              "Savings",
              style: GoogleFonts.roboto(color: appColors.textColor),
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: List.generate(
                  wallets
                      .where((element) => element.role == WalletRole.expenses)
                      .toList()
                      .length, (index) {
                final expensesWallets = wallets
                    .where((element) => element.role == WalletRole.expenses)
                    .toList();
                final currentWallet = expensesWallets[index];
                return Container(
                    padding: const EdgeInsets.only(top: 7),
                    width: width * 0.9,
                    child: WalletWidget(
                      walletName: currentWallet.walletName,
                      balance: currentWallet.balance.toString(),
                      onTap: () {
                        log("Wallet clicked at index : $index");
                      },
                      color: currentWallet.color ?? appColors.textColor,
                      backgroundColor: appColors.secondaryColor,
                      icon: currentWallet.icon,
                    ));
              }),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: List.generate(
                    wallets
                        .where((element) => element.role == WalletRole.savings)
                        .toList()
                        .length, (index) {
                  final expensesWallets = wallets
                      .where((element) => element.role == WalletRole.savings)
                      .toList();
                  final currentWallet = expensesWallets[index];
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: width * 0.9,
                    child: WalletWidget(
                      walletName: currentWallet.walletName,
                      balance: currentWallet.balance.toString(),
                      onTap: () {
                        log("Wallet clicked at index : $index");
                      },
                      color: currentWallet.color ?? appColors.textColor,
                      backgroundColor: appColors.secondaryColor,
                      icon: currentWallet.icon,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: appColors.themeColor,
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: appColors.primaryColor,
        ),
        label: Text('Add Wallet'),
      ),
      bottomNavigationBar: CustomBottomNav(
        appColors: appColors,
        currentIndex: 3,
        onTap: (index) {
          final String route = bottomOptions[index]["route"] ?? "/";
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
