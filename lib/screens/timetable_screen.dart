import 'package:flutter/material.dart';
import 'package:smart_bag/constants/constants.dart';
import 'package:smart_bag/constants/styles.dart';
import 'package:smart_bag/models/streams.dart';

class TimetableScreen extends StatelessWidget {
  TimetableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          StreamBuilder(
            stream: timetableStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                  ),
                );
              }
              int day = DateTime.now().weekday;
              print(day);
              print(':::::::::::::::::::::::');
              var n = snapshot.requireData.docs[0].data().length;
              var s = snapshot.requireData.docs[0].data();
              for (int i = 1; i <= n; i++) {
                print(s['item_$i']);
              }
              print(n);

              return Container(
                padding: EdgeInsets.all(screenWidth(context) * 0.05),
                decoration: backgroundDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(screenWidth(context) * 0.04),
                            decoration: textContainerDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder(future: getDayData(),builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                  return Text(
                                  snapshot.data ?? 'Loading',
                                  style: itemHeadingTextStyle(context),
                                  );
                                },),

                                SizedBox(
                                  height: screenWidth(context) * 0.02,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: s.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: textContainerDecoration,
                                        padding: EdgeInsets.all(
                                            screenWidth(context) * 0.01),
                                        child: Text(s['class_${index + 1}']),
                                      );
                                    }),
                              ],
                            ),
                          );
                        }),
                    SizedBox(
                      height: screenWidth(context) * 0.05,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
