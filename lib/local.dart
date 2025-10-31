import 'package:flutter/material.dart';

class Local extends StatelessWidget {
  const Local({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: (){
            print('pressed Button');
          },
          child: Container(
            width: 200,
            height: 200,
            color:Colors.blue,
            child: Center(
              child: InkWell(
                onTap: (){
                  print('Middle Pressed');
                },
                child: Container(
                  margin: EdgeInsets.all(50),
                  width: 80,
                  height: 30,
                  color:Colors.white,
                  child: Text('Middle'),
                ),
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
