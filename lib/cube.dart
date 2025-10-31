import 'package:flutter/material.dart';

class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/images/Group.png', width: 30),
              Text(
                'Add Imulette',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Image.asset('assets/images/Rectangle.png', width: 30),
            ],
          ),
        ),
        body: Container(
          child: Center(
            child: Container(
              color: Colors.white10 ,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Image.asset('assets/images/Phone3.png', width: 100),
                  SizedBox(height: 40),
                  Text(
                    'ADD AMULETTE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Text(
                      'Add an Amultette Device now to Display images onto the Amulette',
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '. Turn your Phone  on a device of chargings',
                    style: TextStyle(),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 5),
                  Text('. Place your Amulette  on a charging device'),
                  SizedBox(height: 5),
                  Text('. Place your Phone  very close the Amulette'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.black)
                        )
                      ),
                        onPressed: () {  
                          print('Btton Clicked');               
                        },
                        child: Text(
                          'Not Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ) ,
                        ) ,
                        onPressed: (){
                          print('Continue Button Preessed');
                        }, child: Text('Continue',style: TextStyle(fontSize: 14, color: Colors.white),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
