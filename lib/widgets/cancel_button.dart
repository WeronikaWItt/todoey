import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: kAccent, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(50)),
      child: Text(
        'Cancel',
        style: TextStyle(
          fontSize: 20,
          wordSpacing: 2.5,
          fontFamily: 'Pacifico',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
