import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_profile/provider/studentProvider.dart';
import 'package:student_profile/screens/home/widgets/add_student.dart';
import 'package:student_profile/screens/home/widgets/search_screen.dart';
import 'package:student_profile/screens/home/widgets/students_list.dart';

import '../../db/functions/db_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<studentProvider>(context).getallstudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
              tooltip: 'Search',
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchWidget(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListStudents(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddStudentClass();
              },
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add students',
      ),
    );
  }
}
