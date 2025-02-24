import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double amount;
  final int date;
  final Color textColor;
  final Color primaryColor;
  final Color? color;

  const TransactionWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.amount,
      required this.date,
      required this.textColor,
      required this.primaryColor,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      leading: Icon(
        icon,
        color: color ?? textColor,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(color: color ?? textColor),
      ),
      subtitle: Text(
        description,
        style: GoogleFonts.roboto(
            color: color != null
                ? color!.withOpacity(0.5)
                : textColor.withOpacity(0.5),
            fontSize: 12),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        amount.toString(),
        style: GoogleFonts.robotoMono(color: color ?? textColor, fontSize: 14),
      ),
      onTap: () {},
    );
  }
}
