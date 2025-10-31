import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 247, 112, 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/Group.png', width: 30),
              Text(
                'Photos',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.end,
              ),
              Image.asset('assets/images/Rectangle.png', width: 30),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.all(
            5
          ),
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Text('ADD PHOTOS')
            ],
          ),
        ),
      ),
    );
  }
}
