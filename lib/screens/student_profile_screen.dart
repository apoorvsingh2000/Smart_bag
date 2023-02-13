import 'package:flutter/material.dart';
import 'package:smart_bag/constants/constants.dart';
import 'package:smart_bag/constants/strings.dart';
import 'package:smart_bag/constants/styles.dart';

import '../models/streams.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);
  final schoolID = 'schoolID';
  final gradeID = 'grade_1';
  final secID = 'sec_a';
  final studID = 'stud_1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: studProfileStream(schoolID, gradeID, secID, studID),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orangeAccent,
                ),
              );
            }
            print('*********************');
            var  studData= snapshot.requireData.data();
            print( studData);
            return Container(
              decoration: backgroundDecoration,
              child: Padding(
                padding: kScreenpadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        height: screenHeight(context) * 0.4,
                        child: Image.asset(kProfileBigImagePath)),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white),
                      child: Padding(
                        padding: expantionTilePaddingFaq(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: tileHeadingTextStyle(context),
                            ),
                            Text(
                              studData!['name'],
                              style: tileHeadingTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white),
                      child: Padding(
                        padding: expantionTilePaddingFaq(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Class',
                              style: tileHeadingTextStyle(context),
                            ),
                            Text(
                              studData['class']+' '+studData['sec'],
                              style: tileHeadingTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white),
                      child: Padding(
                        padding: expantionTilePaddingFaq(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Student ID',
                              style: tileHeadingTextStyle(context),
                            ),
                            Text(
                              studData!['stud_id'],
                              style: tileHeadingTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white),
                      child: Padding(
                        padding: expantionTilePaddingFaq(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Class Teacher',
                              style: tileHeadingTextStyle(context),
                            ),
                            Text(
                                studData['class_teacher'],
                              style: tileHeadingTextStyle(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
