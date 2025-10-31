import 'package:flutter/material.dart';

class Bkash2 extends StatelessWidget {
  const Bkash2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 130,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.cyan,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.green,
                        height: 50,
                        child: Text('green Color'),
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 50,
                        child: Text('yellow Color'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.brown,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.red,
                        height: 50,
                        child: Text('green Color'),
                      ),
                      Container(
                        color: Colors.pink,
                        height: 50,
                        child: Text('yellow Color'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
