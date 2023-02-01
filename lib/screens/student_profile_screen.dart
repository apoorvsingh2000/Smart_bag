import 'package:flutter/material.dart';
import 'package:smart_bag/constants/constants.dart';
import 'package:smart_bag/constants/strings.dart';
import 'package:smart_bag/constants/styles.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundDecoration,
        child: Padding(
          padding: kScreenpadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: screenHeight(context)*0.4,child: Image.asset(kProfileBigImagePath)),
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
                        'ABC XYZ',
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
                        '123 ABC',
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
                        'EFGH123',
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
                        'XYZ ABC',
                        style: tileHeadingTextStyle(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
