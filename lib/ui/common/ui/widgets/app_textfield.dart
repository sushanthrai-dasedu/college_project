
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';


class TextEntryField extends StatefulWidget {
  final String title;
  final FormFieldValidator<String>? validator;
  final String hint;
  final String? value;
  final ValueChanged<String>? onValueChange;
  final bool multiline;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final TextEditingController? controller;

  const TextEntryField({super.key,
    required this.title,
    this.validator,
    required this.hint,
    this.value,
    required this.onValueChange,
    this.multiline  = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onTap,
    this.controller,
  });

  @override
  State<TextEntryField> createState() => _TextEntryFieldState();
}

class _TextEntryFieldState extends State<TextEntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(height: 10.h,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:Theme.of(context).colorScheme.primaryTextColor,
                  )
              ),
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.labelMedium,
            ),
            style: Theme.of(context).textTheme.labelMedium,
            controller: widget.controller,
            onTap: widget.onTap,
            onChanged: widget.onValueChange,
            validator: widget.validator,
            maxLines: (widget.multiline) ? 5 : 1,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
          ),
        ],
      ),
    );
  }
}
