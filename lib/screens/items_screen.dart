import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/styles.dart';
import '../models/streams.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          StreamBuilder(
            stream: scannedItemsStream,
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
                    // child: Text(
                    //   '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('MMM').format(DateTime.now())} ${DateTime.now().day}',
                    //   style: TextStyle(fontSize: screenWidth(context) * 0.04),
                    // ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: s.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            padding:
                                EdgeInsets.all(screenWidth(context) * 0.04),
                            decoration: textContainerDecoration,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    s.keys.elementAt(index),
                                    style: itemHeadingTextStyle(context),
                                  ),
                                  SizedBox(
                                    height: screenWidth(context) * 0.02,
                                  ),
                                  Container(
                                    decoration: textContainerDecoration,
                                    padding: EdgeInsets.all(
                                        screenWidth(context) * 0.01),
                                    child: Text(s.values.elementAt(index)),
                                  ),
                                ]),
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
