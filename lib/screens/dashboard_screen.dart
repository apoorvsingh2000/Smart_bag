import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:smart_bag/constants/constants.dart';
import 'package:smart_bag/constants/strings.dart';
import 'package:smart_bag/models/streams.dart';
import 'package:smart_bag/constants/styles.dart';

import 'add_item_to_list_screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    String addlElement;
    String skippedElement;
    var list = <String, dynamic>{};
    var list2 = <String, dynamic>{};
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          StreamBuilder(
            stream: itemStream,
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
              var s = snapshot.requireData.docs[0].data(); //day-1
              return Container(
                padding: EdgeInsets.all(screenWidth(context) * 0.05),
                decoration: backgroundDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth(context) * 0.02),
                      decoration: textContainerDecoration,
                      child: Text(
                        '${DateFormat('EEEE').format(DateTime.now())}, ${DateFormat('MMM').format(DateTime.now())} ${DateTime.now().day}',
                        style: TextStyle(fontSize: screenWidth(context) * 0.04),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth(context) * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(screenWidth(context) * 0.04),
                      decoration: textContainerDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kItemsForToday,
                            style: itemHeadingTextStyle(context),
                          ),
                          SizedBox(
                            height: screenWidth(context) * 0.02,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: s.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(
                                      screenWidth(context) * 0.01),
                                  child: Text(s.keys.elementAt(index)),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth(context) * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(screenWidth(context) * 0.04),
                      decoration: textContainerDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                kAdditionalItems,
                                style: itemHeadingTextStyle(context),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddItemToListScreen(
                                          lengthOfPrevList: list.length,
                                          stream: addlItemStream),
                                    )),
                                child: Image.asset(kAddImagePath),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth(context) * 0.02,
                          ),
                          StreamBuilder(
                            stream: addlItemStream.snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.orangeAccent,
                                  ),
                                );
                              }
                              list = snapshot.requireData.docs[0].data();
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    addlElement = list.keys.elementAt(index);
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(
                                              screenWidth(context) * 0.01),
                                          child:
                                              Text(addlElement),
                                        ),
                                        TextButton(
                                          onPressed: () => confirmDeleteDialog(
                                              context, addlItemStream, addlElement),
                                          child: Image.asset(
                                            kDeleteImagePath,
                                            height: screenWidth(context) * 0.04,
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth(context) * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.all(screenWidth(context) * 0.04),
                      decoration: textContainerDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                kSkipItems,
                                style: itemHeadingTextStyle(context),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddItemToListScreen(
                                          lengthOfPrevList: list2.length,
                                          stream: skipItemStream),
                                    )),
                                child: Image.asset(kSkipImagePath),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth(context) * 0.02,
                          ),
                          StreamBuilder(
                            stream: skipItemStream.snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.orangeAccent,
                                  ),
                                );
                              }
                              list2 = snapshot.requireData.docs[0].data();
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: list2.length,
                                itemBuilder: (context, index) {
                                  skippedElement = list2.keys.elementAt(index);
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(
                                            screenWidth(context) * 0.01),
                                        child: Text(skippedElement),
                                      ),
                                      TextButton(
                                        onPressed: () => confirmDeleteDialog(
                                            context, skipItemStream, skippedElement),
                                        child: Image.asset(
                                          kDeleteImagePath,
                                          height: screenWidth(context) * 0.04,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
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

  confirmDeleteDialog(BuildContext context,
      CollectionReference<Map<String, dynamic>> stream, String elementToDelete) {
    Widget cancelButton = TextButton(
      child: Text(kYesDelete),
      onPressed: () async {
        await stream.doc('item_list').update({elementToDelete : FieldValue.delete()});
        print('@#%^&*()');
        // print(docRef.);
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child: Text(kCancel),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(kConfirmDelete),
      content: Text(kConfirmDeleteText),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
