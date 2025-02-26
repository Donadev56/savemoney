import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletWidget extends StatelessWidget {
  final String walletName;
  final String balance;
  final IconData? icon;
  final Color color;
  final VoidCallback onTap;
  final Color backgroundColor;

  const WalletWidget({
    super.key,
    required this.walletName,
    required this.balance,
    this.icon = Icons.wallet,
    required this.onTap,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.transparent,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Row(
                spacing: 15,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        icon ?? Icons.wallet,
                        color: color,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        walletName,
                        style: GoogleFonts.roboto(color: color, fontSize: 20),
                      ),
                      Text(
                        "\$$balance spent",
                        style:
                            GoogleFonts.roboto(color: color.withOpacity(0.5)),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

/* 

return ListTile(
      leading: Icon(icon , color: color,),
         
      
      title: Text(walletName ,style: GoogleFonts.roboto(color: color, fontSize: 20)),
      subtitle: Text(balance, style: GoogleFonts.roboto(color: color),),
      onTap: onTap ,

    ); */
