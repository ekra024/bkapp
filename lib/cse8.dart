import 'package:flutter/material.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<Map<String, dynamic>> students = [
    {"name": "Rahim", "roll": "101", "cgpa": "3.50"},
    {"name": "Karim", "roll": "102", "cgpa": "3.70"},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController cgpaController = TextEditingController();

  void addStudent() {
    nameController.clear();
    rollController.clear();
    cgpaController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Student", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: rollController, decoration: InputDecoration(labelText: "Roll")),
            TextField(controller: cgpaController, decoration: InputDecoration(labelText: "CGPA")),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  students.add({
                    "name": nameController.text,
                    "roll": rollController.text,
                    "cgpa": cgpaController.text,
                  });
                });
                Navigator.pop(context);
              },
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }

  void editStudent(int index) {
    nameController.text = students[index]["name"];
    rollController.text = students[index]["roll"];
    cgpaController.text = students[index]["cgpa"];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Edit Student", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: rollController, decoration: InputDecoration(labelText: "Roll")),
            TextField(controller: cgpaController, decoration: InputDecoration(labelText: "CGPA")),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  students[index] = {
                    "name": nameController.text,
                    "roll": rollController.text,
                    "cgpa": cgpaController.text,
                  };
                });
                Navigator.pop(context);
              },
              child: Text("Save Changes"),
            )
          ],
        ),
      ),
    );
  }

  void deleteStudent(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Delete Student"),
        content: Text("Are you sure you want to delete ${students[index]["name"]}?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
            onPressed: () {
              setState(() {
                students.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students List")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (_, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(students[index]["name"][0])),
            title: Text(students[index]["name"]),
            subtitle: Text("Roll: ${students[index]["roll"]} | CGPA: ${students[index]["cgpa"]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () => editStudent(index)),
                IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => deleteStudent(index)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addStudent,
        child: Icon(Icons.add),
      ),
    );
  }
}
