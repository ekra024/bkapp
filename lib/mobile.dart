import 'package:flutter/material.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Center(child: Text("Pairing")),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              SizedBox(height: 30),
              Center(
                child: Text("Select Device", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 10),
              Center(child: Text("Select the device you want to pair")),
              SizedBox(height: 30),
               amulatteDevice('emuDevice1234','assets/images/Phone2.jpg'),
               amulatteDevice('emuDevice12347890','assets/images/Phone2.jpg'),
               amulatteDevice('emuDevice1234788','assets/images/Phone2.jpg'),
               amulatteDevice('new','assets/images/Phone2.jpg'),
               amulatteDevice('new','assets/images/Phone2.jpg'),
               
               
            ],
          ),
        ),
       
      ),
    );
  }

  Widget amulatteDevice(String deviceName, String iconImagePath) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          //Icon(Icons.bluetooth_audio, size: 40),
          Image.asset(iconImagePath, width: 30),
          SizedBox(width: 15),
          Expanded(child: Text(deviceName)),
          Icon(Icons.arrow_forward_ios, size: 20, color: Colors.red,),
        ],
      ),
    );
  }
}
