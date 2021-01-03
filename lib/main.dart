import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holy_quran/src/assets/NavigateAssets.dart';
import 'package:holy_quran/src/config/DependenciesProvider.dart';
import 'package:holy_quran/src/config/GlobalAppBlocDelegate.dart';
import 'package:holy_quran/src/screens/Chapters/ChaptersScreen.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';


void main() {
  DependenciesProvider.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer;
  String localFilePath;
  String kUrl1 ="https://verses.quran.com/AbdulBaset/Mujawwad/mp3/001001.mp3";
  @override
  void initState() {
    _loadFile();
    audioPlayer= AudioPlayer();
    // TODO: implement initState
    super.initState();
  }



  Future _loadFile() async {
    final bytes = await readBytes(kUrl1);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);

    if (await file.exists()) {
      await audioPlayer.play(file.path,isLocal: true);
      audioPlayer.onPlayerCompletion.listen((event) {
        push_remove(context, ChaptersScreen());
      });
    }
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Bloc.observer=SimpleBlocObserver();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logos/mushaflogo.png"),
        ),
      ),
    );
  }


}
