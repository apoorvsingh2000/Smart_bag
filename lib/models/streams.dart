import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Stream<QuerySnapshot<Map<String, dynamic>>> itemStream = firestore
    .collection('school')
    .doc('school_1')
    .collection('grade')
    .doc('grade_1')
    .collection('sec')
    .doc('sec_a')
    .collection('timetable')
    .doc('timetable_master')
    .collection('items')
    .snapshots();

Future<String> getDayData() async {
  QuerySnapshot result = await firestore
      .collection('school')
      .doc('school_1')
      .collection('grade')
      .doc('grade_1')
      .collection('sec')
      .doc('sec_a')
      .collection('timetable')
      .doc('timetable_master')
      .collection('classes')
      .get();
  final List<DocumentSnapshot> documents = result.docs;
  for (var doc in documents) {
    return doc.id.toString();
  }
  return 'Loading';
}
//DateFormat('EEE').format(DateTime.now()).toLowerCase()

CollectionReference<Map<String, dynamic>> addlItemStream = firestore
    .collection('school')
    .doc('school_1')
    .collection('grade')
    .doc('grade_1')
    .collection('sec')
    .doc('sec_a')
    .collection('stud')
    .doc('stud_1')
    .collection('day')
    .doc('mon')
    .collection('addl_items');

CollectionReference<Map<String, dynamic>> skipItemStream = firestore
    .collection('school')
    .doc('school_1')
    .collection('grade')
    .doc('grade_1')
    .collection('sec')
    .doc('sec_a')
    .collection('stud')
    .doc('stud_1')
    .collection('day')
    .doc('mon')
    .collection('skip_items');

Stream<DocumentSnapshot<Map<String, dynamic>>> studProfileStream(
        String school, grade, sec, studID) =>
    firestore
        .collection('school')
        .doc('school_1')
        .collection('grade')
        .doc('grade_1')
        .collection('sec')
        .doc('sec_a')
        .collection('stud')
        .doc(studID)
        .collection('stud_details')
        .doc('details')
        .snapshots();

//DateFormat('EEE').format(DateTime.now()).toLowerCase()

Stream<QuerySnapshot<Map<String, dynamic>>> timetableStream = firestore
    .collection('school')
    .doc('school_1')
    .collection('grade')
    .doc('grade_1')
    .collection('sec')
    .doc('sec_a')
    .collection('timetable')
    .doc('timetable_master')
    .collection('classes')
    .snapshots();

Stream<QuerySnapshot<Map<String, dynamic>>> scannedItemsStream = firestore
    .collection('school')
    .doc('school_1')
    .collection('grade')
    .doc('grade_1')
    .collection('sec')
    .doc('sec_a')
    .collection('stud')
    .doc('stud_1')
    .collection('scanned_items')
    .snapshots();
