import 'package:flutter/material.dart';
import 'package:save_money/types/types.dart';

typedef OnTapWithIndex = void Function(int index);

class CustomOptionWidget extends StatelessWidget {
  final String spaceName;
  final TextStyle spaceNameStyle;
  final Color backgroundColor ;
  final BoxBorder? containerBorder ;
  final BorderRadiusGeometry? containerRadius ;
  final ShapeBorder ? shapeBorder;
  final List<Option> options;
  final Alignment alignment;
  final Alignment textAlignment;
  final OnTapWithIndex onTap ;
  final Color  splashColor;
  final Color tileColor ;
  final double internalElementSpacing ;
  final MainAxisAlignment mainAxisAlignment ;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomOptionWidget({
    super.key,
    required this.spaceName,
    required this.spaceNameStyle,
    required this.options,
    this.alignment = Alignment.center,
    this.textAlignment = Alignment.topLeft,
    required this.onTap,
    this.splashColor = Colors.transparent,
    this.backgroundColor = const Color(0XFF121212),
    this.containerBorder ,
    this.containerRadius ,
    this.shapeBorder,
    this.tileColor = Colors.transparent,
    this.internalElementSpacing = 0.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child:Column(
        spacing: 15,
        children: [
         Align(
          alignment:textAlignment ,
          child:Text(
            spaceName,
            style: spaceNameStyle,
            overflow: TextOverflow.ellipsis,
          ) ,
         ) ,
          Container(
            padding: const EdgeInsets.all(5),
           
            decoration: BoxDecoration(
 color: backgroundColor,
 borderRadius:containerRadius ,
 border: containerBorder
            ),
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              
              spacing: internalElementSpacing,
                children: List.generate(
              options.length,
              (i) {
                final option = options[i];
                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    tileColor:option.tileColor ?? tileColor,
                  splashColor:splashColor ,
                  shape: shapeBorder,
                  onTap: () {
                    onTap(i);
                  },
                  leading: option.icon,
                  title: Text(
                    option.title,
                    style:option.titleStyle
                        
                  ),
                  trailing: option.trailing,
                ),
                ) ;
              },
            )),
          )
        ],
      ) ,
    
    ));
  }
}
