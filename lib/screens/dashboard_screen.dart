import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: firestore
            .collection('school')
            .doc('school_1')
            .collection('grade')
            .doc('grade_1')
            .collection('sec')
            .doc('sec_a')
            .collection('timetable')
            .doc('timetable_master')
            .collection('items')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orangeAccent,
              ),
            );
          }
          int day = DateTime.now().weekday;
          print('*********************');
          var n = snapshot.requireData.docs[day-3].data().length;
          var s = snapshot.requireData.docs[day-3].data();
          for(int i=1; i<=n;i++){
            print(s['item_$i']);
          }
          print(n);
          print(snapshot.requireData.docs[day-3].data());
          return Container();
        },
      ),
    );
  }
}
