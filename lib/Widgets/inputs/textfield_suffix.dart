import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ocabstest/Utils/colors.dart';

class MyTextFieldDatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateFormat dateFormat;
  final FocusNode focusNode;
  final String labelText;
  final Icon prefixIcon;
  final Icon suffixIcon;

  MyTextFieldDatePicker({
    Key key,
    this.dateFormat,
    this.firstDate,
    this.focusNode,
    this.initialDate,
    this.labelText,
    this.lastDate,
    this.onDateChanged,
    this.prefixIcon,
    this.suffixIcon,
  })  : assert(initialDate != null),
        assert(firstDate != null),
        assert(lastDate != null),
        assert(!initialDate.isBefore(firstDate),
            'initialDate must be on or after firstDay'),
        assert(!initialDate.isAfter(lastDate),
            'intialDate must be on or after firstDate'),
        assert(onDateChanged != null, 'onChanged must not be null'),
        super(key: key);

  @override
  _MyTextFieldDatePicker createState() => _MyTextFieldDatePicker();
}

class _MyTextFieldDatePicker extends State<MyTextFieldDatePicker> {
  TextEditingController _controllerDate;
  DateFormat _dateFormat;
  DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    if (widget.dateFormat != null) {
      _dateFormat = widget.dateFormat;
    } else {
      _dateFormat = DateFormat.MMMEd();
    }

    _selectedDate = widget.initialDate;

    _controllerDate = TextEditingController();
    _controllerDate.text = _dateFormat.format(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: _controllerDate,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.all(8.0),
        hintText: widget.labelText,
        errorStyle: TextStyle(fontSize: 0, height: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefix: widget.prefixIcon,
        suffix: widget.suffixIcon,
        labelText: null,
        focusColor: Colors.grey[500],
      ),
      onTap: () => _selectDate(context),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      _controllerDate.text = _dateFormat.format(_selectedDate);
      widget.onDateChanged(_selectedDate);
    }
    if (widget.focusNode != null) {
      widget.focusNode.nextFocus();
    }
  }
}
