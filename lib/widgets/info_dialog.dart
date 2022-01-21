import 'package:flutter/material.dart';

import '../constants.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('How to use Todoey', textAlign: TextAlign.center, style: kPacificoHeader),
              Text('- Slide left to delete', style: kInfoText),
              Text('- Tap on task to edit', style: kInfoText),
              IconButton(
                iconSize: 35,
                color: kAccent,
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.check),
              )
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10.0),
  //     child: IconButton(
  //       color: Colors.white,
  //       iconSize: 25,
  //       padding: const EdgeInsets.only(left: 50),
  //       onPressed: () => showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return Dialog(
  //               child: Container(
  //                 width: double.infinity,
  //                 height: 200,
  //                 padding: EdgeInsets.all(20),
  //                 child: Column(
  //                   children: [
  //                     Text('How to use Todoey', textAlign: TextAlign.center, style: kPacificoHeader),
  //                     Text('- Slide left to delete', style: kInfoText),
  //                     Text('- Tap on task to edit', style: kInfoText),
  //                     IconButton(
  //                       iconSize: 35,
  //                       color: kAccent,
  //                       onPressed: () => Navigator.of(context).pop(),
  //                       icon: Icon(Icons.check),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             );
  //           }),
  //       icon: Icon(Icons.info_outline_rounded),
  //     ),
  //   );
  // }
}
