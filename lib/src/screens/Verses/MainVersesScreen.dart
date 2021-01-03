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
  int _currentIndex = 0;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      VersesScreen(widget.chapters),
      Container()
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar:TabBar(
            onTap: onTabTapped,
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
