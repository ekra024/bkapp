import 'package:flutter/material.dart';
import 'profile_controller.dart';
import 'profile_fields.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = ProfileController();

  final fullName = TextEditingController();
  final classRoll = TextEditingController();
  final dept = TextEditingController();
  final batch = TextEditingController();
  final dob = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final gender = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  void loadSavedData() async {
    final data = await controller.loadData();
    fullName.text = data["fullName"]!;
    classRoll.text = data["classRoll"]!;
    dept.text = data["dept"]!;
    batch.text = data["batch"]!;
    dob.text = data["dob"]!;
    phone.text = data["phone"]!;
    email.text = data["email"]!;
    gender.text = data["gender"]!;
    setState(() {});
  }

  void saveProfile() {
    controller.saveData({
      "fullName": fullName.text,
      "classRoll": classRoll.text,
      "dept": dept.text,
      "batch": batch.text,
      "dob": dob.text,

      "phone": phone.text,
      "email": email.text,
      "gender": gender.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("✅ Profile Saved Successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/Keyboard.jpg",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Profile Image
                Positioned(
                  bottom: -20,
                  left: 20,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/images/Rectangle.png"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            inputField("Full Name", fullName),
            inputField("Class Roll", classRoll),
            inputField("Department", dept),
            inputField("Batch", batch),
            inputField("Date of Birth", dob),
            inputField("Phone Number", phone),
            inputField("Email", email),
            inputField("Gender", gender),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveProfile,
              child: const Text("SAVE"),
            )
          ],
        ),
      ),
    );
  }
}
