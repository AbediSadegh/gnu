import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          children: <Widget>[
            Text("سلام icare هستم"),
            Text("یک دستیار شخصی"),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 120,
              height: 35,

            ),
            RaisedButton(
              color: Colors.white,
              elevation: 3,
              padding: EdgeInsets.all(2),
              onPressed: (){},shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text("ادامه"),
            )
          ],
        ),
      ),
    );
  }
}
