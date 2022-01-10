import 'package:flutter/material.dart';

import '../constants.dart';

class FormWidget extends StatelessWidget {
  final String hintText;
  final Function changedValue;

  const FormWidget({Key key, this.hintText, this.changedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kAccent),
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextFormField(
        //autofocus: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Cinzel',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hintText,
        ),
        validator: (title) {
          if (title.isEmpty) {
            return 'The field is empty';
          }
          return null;
        },
        onChanged: changedValue,
      ),
    );
  }
}
