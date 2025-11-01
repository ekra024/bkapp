import 'package:bkapp/screens/category_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Image.asset('assets/images/Exam1.png')),
                Text('Quizzical', style: TextStyle(fontSize: 40, fontWeight:FontWeight.w500)),
                Text('Asmahul Husna', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                SizedBox(height: 50,),
               
                InkWell(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen()))
                  },
                  child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Color.fromRGBO(2, 112, 107, 1)
                    ),
                    child: Center(child: Text('GET STARTED ', style: TextStyle( fontWeight: FontWeight.w500, color: Colors.white), )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
