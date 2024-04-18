import 'package:flutter/material.dart';
import 'package:leave_tracker/ui/theme/theme_const.dart';

import '../../../../../utility/form_validators.dart';
import '../../../../common/ui/widgets/app_textview.dart';

class DateSelector extends StatefulWidget {
  final String Datefeildname;
  final String validatortext;


  DateSelector({
    Key? key,
    required this.Datefeildname,
    required this.validatortext,
  }) : super(key: key);

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? selectedDate;
  Future<void> _selectDate() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate =
    now.subtract(const Duration(days: 59)); // 60 days before today
    final DateTime lastDate = now; // Today

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Adjust the color as needed
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).colorScheme.primaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          child: TextFormField(
              controller: _dateController,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                label: AppTextView(
                  minFontSize: 15,
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primaryTextColor),
                  text: widget.Datefeildname,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primaryTextColor,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.grey,
                    width: 1.0,
                  ),
                ),
                errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.red,
                  fontSize: 10,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.red,
                    width: 1,
                  ),
                ),
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(Icons.date_range_outlined),
                  color: Theme.of(context).colorScheme.primaryTextColor,
                  onPressed: () {
                    _selectDate();
                  },
                ),
              ),
              readOnly: true,
              onTap: () {
                _selectDate();
              },
              validator: (value) =>
                  AppFormFieldValidator.validateDDdate(value, context)),
        ),
      ),
    );
  }
}
