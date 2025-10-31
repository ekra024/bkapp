import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  Future<void> saveData(Map<String, String> data) async {
    final prefs = await SharedPreferences.getInstance();
    data.forEach((key, value) {
      prefs.setString(key, value);
    });
  }

  Future<Map<String, String>> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "fullName": prefs.getString("fullName") ?? "",
      "classRoll": prefs.getString("classRoll") ?? "",
     
      "dept": prefs.getString("dept") ?? "",
      "batch": prefs.getString("batch") ?? "",
      "dob": prefs.getString("dob") ?? "",
    
      "phone": prefs.getString("phone") ?? "",
      "email": prefs.getString("email") ?? "",
      "gender": prefs.getString("gender") ?? "",
    };
  }
}
