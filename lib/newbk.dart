import 'package:flutter/material.dart';

// ignore: camel_case_types
class bkash extends StatelessWidget {
  const bkash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          elevation: 2,
          leading: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.blue),
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color:Colors.blue, size:20),
                ],
              ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color:Colors.blue, size:20),
                ],
              ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color:Colors.blue, size:20),
                  Icon(Icons.star, color:Colors.blue, size:20),
                  Icon(Icons.star, color:Colors.blue, size:20),
                  Icon(Icons.star, color:Colors.blue, size:20),
                  Icon(Icons.star, color:Colors.blue, size:20),
                ],
              ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color:Colors.blue, size:20),
                ],
              ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color:Colors.blue, size:20),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
