import 'package:smart_bag/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_bag/constants/styles.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: backgroundDecoration,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight(context) * 0.04,
                    left: screenWidth(context) * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('FAQs',
                          style: headingTextStyle(context)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("What are the rules?",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Padding(
                        padding: expantionTilePaddingFaq(context),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                title: Text(
                                    "To keep this hack fun and fair for everyone, we urge our participants to incorporate only freely available or non-copyright resources (code, graphics, sound, etc.) in their projects.\nBe sure to go through the MLH Code of Conduct.",
                                    style: faqTileSubheadingTextStyle(
                                        context))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("What are the perks of participating in Equinox?",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "A plethora of knowledge, keen problems solving skills and a rich technical skillset are in the cards! Additionally, Equinox will also serve as a platform to mingle with others in the tech community. Cash prizes, schawgs and other perks are in store for the winners!",
                                  style: faqTileSubheadingTextStyle(
                                      context))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("Can I start working on the hack before the event?",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "You can research thoroughly on your ideas before the start of the event, but we insist you start working on the projects only after the hack begins to be fair to each participant and to build on your time management too!",
                                  style: faqTileSubheadingTextStyle(
                                      context))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("How big can my team be? ",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "You can register solo but as they say “the more the merrier”, so we advise you to show up with 2-4 stars in your cluster. If you do not have a team, you can interact with the other participants over our Discord Server and form your ideal cluster of stars!",
                                  style: faqTileSubheadingTextStyle(
                                      context),),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("Do I have to pay to register?",
                        style: faqTileHeadingTextStyle(context),),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "Not at all! Thanks to the generosity of our sponsors, we are able to conduct events like Equinox for free.",
                                  style: faqTileSubheadingTextStyle(
                                      context),),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("Who all can participate?",
                        style: faqTileHeadingTextStyle(context),),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "Equinox’21 is open to all the students who are currently enrolled in a University, or have graduated within the last 12 months.",
                                  style: faqTileSubheadingTextStyle(
                                      context))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("What if I don’t know how to code? ",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "In this never ending world where technologies and innovation are the future, all you need is the  will to learn, the curiosity to explore and determination to bring your idea to life. Equinox is the right platform to kick start your coding journey.",
                                  style: faqTileSubheadingTextStyle(
                                      context),),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("What if this is my first hack?",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "Whether you’re new to hacks or a seasoned pro, there’s something for everyone! In this case, Equinox will prove to be the Big Bang to your hacking journey. You can hone your skills with creativity and zeal, and take back with you substantial knowledge and experience.",
                                  style: faqTileSubheadingTextStyle(
                                      context),),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: expantionTilePaddingFaq(context),
                child: Card(
                  child: ExpansionTile(
                    title: Text("What can I build in the hack?",
                        style: faqTileHeadingTextStyle(context)),
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: Text(
                                  "If you can think it, you can build it! Be it websites, android apps, hardware or electronics, these are just the tip of the iceberg. Express your creativity, ingenuity and determination to explore anything you want. ",
                                  style: faqTileSubheadingTextStyle(
                                      context),),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),),
    );
  }
}
