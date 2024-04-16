import 'package:cash_counter/core/const/responsive_size_consts.dart';
import 'package:cash_counter/ui/theme/theme_const.dart';
import 'package:flutter/material.dart';

class AppTextView extends StatefulWidget {
  const AppTextView({
    super.key,
    required this.minFontSize,
    required this.textStyle,
    required this.text,
    this.textAlign = TextAlign.start
  });

  final double minFontSize;
  final TextStyle textStyle;
  final String? text;
  final TextAlign textAlign;

  @override
  State<AppTextView> createState() => _AppTextViewState();
}

class _AppTextViewState extends State<AppTextView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        var fontSize = widget.minFontSize;

        if (width <= ResponsiveSizes.mobile) {
          fontSize = widget.minFontSize;
        } else if (width <= ResponsiveSizes.tablet) {
          fontSize = widget.minFontSize + 12;
        }

        return Text(
          widget.text ?? "",
          textAlign: widget.textAlign,
          style: widget.textStyle.copyWith(
            fontSize: fontSize,
          ),
        );
      },
    );
  }
}
