import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/styles.dart';
import '../models/streams.dart';

class AddItemToListScreen extends StatelessWidget {
  final int lengthOfPrevList;
  final CollectionReference<Map<String, dynamic>> stream;
  const AddItemToListScreen({Key? key, required this.lengthOfPrevList, required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(),),
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
              var s = snapshot.requireData.docs[0].data();
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
                          return InkWell(
                            onTap: () async {
                              await stream.doc('item_list').update({
                                s.keys.elementAt(index) : null
                              },);
                              Navigator.pop(context);
                            },
                            child: Container(
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
