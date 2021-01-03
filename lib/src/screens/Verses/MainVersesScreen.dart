import 'package:flutter/material.dart';
import 'package:holy_quran/src/Models/ChaptersModel.dart';
import 'package:holy_quran/src/screens/Verses/VersesScreen.dart';

class MainVersesScreen extends StatefulWidget {
  final Chapters chapters;

  MainVersesScreen(this.chapters);

  @override
  _MainVersesScreenState createState() => _MainVersesScreenState();
}

class _MainVersesScreenState extends State<MainVersesScreen> {


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar:TabBar(

         // this will be set when a new tab is tapped
          tabs: [
            Tab(
              icon: new Icon(Icons.play_arrow_outlined),

            ),
            Tab(
              icon: new Icon(Icons.workspaces_outline),

            ),

          ],
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
        body: TabBarView(
          children: [
            new VersesScreen(
              widget.chapters
            ),
            new Container(
              color: Colors.orange,
            ),

          ],
        ),
      ),
    );
  }
}
