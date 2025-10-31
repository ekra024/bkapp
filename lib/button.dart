import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pairing'),
          leading: Icon(Icons.arrow_forward_outlined),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'SELECT DEVICE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Select the device that you want to pair')],
            ),
            Container(
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('assets/images/Phone.jpg', width: 40),
                  ),
                  Text('Amulette Uid1234'),
                  SizedBox(width: 100),
                  Icon(Icons.arrow_forward_ios, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
