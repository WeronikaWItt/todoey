import 'package:flutter/material.dart';

import '../constants.dart';

class FormWidget extends StatelessWidget {
  final String initText;
  final Function changedValue;
  const FormWidget({Key key, this.initText, this.changedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kAccent),
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextFormField(
        autocorrect: true,
        maxLines: 5,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, fontFamily: 'Cinzel'),
        initialValue: initText,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            labelText: 'Description'),
        onChanged: changedValue,
      ),
    );
  }
}
