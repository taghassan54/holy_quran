import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/src/Blocs/VersesBloc/verses_bloc.dart';
import 'package:holy_quran/src/Models/ChaptersModel.dart';

import 'package:holy_quran/src/assets/Sizing.dart';
import 'package:holy_quran/src/config/DependenciesProvider.dart';


class VersesScreen extends StatefulWidget {
  final Chapters chapters;

  VersesScreen(this.chapters);

  @override
  _VersesScreenState createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  VersesBloc _versesBloc;

  AudioPlayer audioPlayer;
  int audioPlayerStatus;
  int page;
  bool playComplet;
  String url;
  List reciters = [
    {
      "name": 'سعد الغامدي - حفص عن عاصم',
      'url': 'http://server7.mp3quran.net/s_gmd'
    },
    {
      "name": 'ماهر المعيقلي - حفص عن عاصم',
      'url': 'http://server12.mp3quran.net/maher'
    },
    {
      "name": 'فارس عباد - حفص عن عاصم',
      'url': 'http://server8.mp3quran.net/frs_a'
    },
    {
      "name": 'مشاري العفاسي - حفص عن عاصم',
      'url': 'http://server8.mp3quran.net/afs'
    },
    {
      "name": 'عبدالباسط عبدالصمد - المصحف المجود',
      'url': 'http://server13.mp3quran.net/basit_mjwd'
    },
    {
      "name": 'عبدالباسط عبدالصمد - ورش عن نافع',
      'url': 'http://server10.mp3quran.net/basit_warsh'
    },
    {
      "name": 'عبدالباسط عبدالصمد - حفص عن عاصم',
      'url': 'http://server7.mp3quran.net/basit'
    },
    {
      "name": 'العيون الكوشي - ورش عن نافع',
      'url': 'http://server11.mp3quran.net/koshi'
    },
    {
      "name": 'عمر القزابري - ورش عن نافع',
      'url': 'http://server9.mp3quran.net/omar_warsh'
    },
    {
      "name": 'ياسر الدوسري - حفص عن عاصم',
      'url': 'http://server11.mp3quran.net/yasser'
    },{
      "name": 'عبدالله بصفر - حفص عن عاصم',
      'url': 'http://server6.mp3quran.net/bsfr'
    },
    {
      "name": 'أبو بكر الشاطري - حفص عن عاصم',
      'url': 'http://server11.mp3quran.net/shatri'
    },
    {
      "name": 'أحمد الحذيفي - حفص عن عاصم',
      'url': 'http://server8.mp3quran.net/ahmad_huth'
    },
    {
      "name": 'أحمد الحواشي - حفص عن عاصم',
      'url': 'http://server11.mp3quran.net/hawashi'
    },
    {
      "name": 'أحمد الطرابلسي - حفص عن عاصم',
      'url': 'http://server10.mp3quran.net/trabulsi'
    },
    {
      "name": 'أحمد بن علي العجمي - حفص عن عاصم',
      'url': 'http://server10.mp3quran.net/ajm/128'
    },
    {
      "name": 'أحمد خضر الطرابلسي - قالون عن نافع',
      'url': 'http://server10.mp3quran.net/trablsi'
    },
    {
      "name": 'أحمد صابر - حفص عن عاصم',
      'url': 'http://server8.mp3quran.net/saber'
    }
  ];

  @override
  void initState() {
    _versesBloc = new VersesBloc(DependenciesProvider.provide());
    page = 1;
    _versesBloc
        .add(LoadVerses(page: page, chapters: widget.chapters, recitation: 4));
    _versesBloc.forEach((state) {
      if (state is VersesLoadedSuccessfully) {
        play();
      }
    });
    setUrl(recitation: 'http://server7.mp3quran.net/s_gmd');

    audioPlayer = AudioPlayer();
    audioPlayerStatus = 0;
    playComplet = false;

    super.initState();
  }

  play() async {
 await audioPlayer.play(url);

    setState(() {
      audioPlayerStatus = 1;
      playComplet = false;
    });

    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        audioPlayerStatus = 0;
        playComplet = true;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
            cubit: _versesBloc,
            builder: (context, state) {
              if (state is VersesLoadedSuccessfully) {
                return Container(
                  height: height(context, 1),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Background.png'),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Center(
                            child: Text(
                              "${widget.chapters.nameArabic}",
                              style:
                                  TextStyle(fontSize: 26, color: Colors.green),
                            ),
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/header.png"),
                                  fit: BoxFit.fitWidth)),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ListView.builder(
                              itemCount: state.versesModel.verses.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    child: Center(
                                      child: RichText(
                                          text: TextSpan(
                                            children: [
                                              if (state.versesModel
                                                      .verses[index].sajdah !=
                                                  '')
                                                WidgetSpan(
                                                    child: Image.asset(
                                                  'assets/images/logos/mushaflogo.png',
                                                  width: 10,
                                                )),
                                              WidgetSpan(
                                                  child: Container(
                                                width: 20,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/aya.png"),
                                                        fit: BoxFit.fitWidth)),
                                                child: Center(
                                                    child: Text(
                                                        " ${state.versesModel.verses[index].verseNumber} ")),
                                              )),
                                              WidgetSpan(
                                                  child: SizedBox(
                                                width: 5,
                                              )),
                                              TextSpan(
                                                text:
                                                    "${state.versesModel.verses[index].textMadani} ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width(context, 0.5),
                              child: DropdownButton(
                                items: reciters
                                    .map((reciter) => DropdownMenuItem(
                                          value: "${reciter['url']}",
                                          child: Text(
                                            "${reciter['name']}",
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) async {
                                  setUrl(recitation: value);
                                  await audioPlayer.play(url);
                                },
                                isExpanded: true,
                                hint: Text(
                                  " القراء ",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                disabledHint:
                                    Text("You can't select anything."),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.skip_previous_outlined,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: state.versesModel.meta.prevPage !=
                                          0
                                      ? () {
                                          setState(() {
                                            page =
                                                state.versesModel.meta.prevPage;
                                          });
                                          _versesBloc.add(LoadVerses(
                                              page: page,
                                              chapters: widget.chapters,
                                              recitation: 4));
                                        }
                                      : null,
                                ),
                                Text(
                                  "${state.versesModel.meta.currentPage}/${state.versesModel.meta.totalPages}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            audioPlayerStatus == 1
                                ? IconButton(
                                    icon: Icon(
                                      Icons.play_arrow_outlined,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                   await audioPlayer.pause();

                                      setState(() {
                                        audioPlayerStatus = 0;
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.pause,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      if (playComplet) {
                                        await audioPlayer
                                            .seek(Duration(seconds: 0));
                                        await audioPlayer.resume();
                                      } else {

                                         await audioPlayer.resume();
                                      }
                                      setState(() {
                                        audioPlayerStatus = 1;
                                      });
                                    },
                                  ),
                            IconButton(
                              icon: Icon(
                                Icons.skip_next_outlined,
                                color: Colors.white,
                                size: 24.0,
                              ),
                              onPressed: state.versesModel.meta.nextPage != 0
                                  ? () {
                                      setState(() {
                                        page = state.versesModel.meta.nextPage;
                                      });
                                      _versesBloc.add(LoadVerses(
                                          page: page,
                                          chapters: widget.chapters,
                                          recitation: 4));
                                    }
                                  : null,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }

  void setUrl({
    String recitation = 'http://server7.mp3quran.net/s_gmd',
  }) {
    if (widget.chapters.id.toString().length == 1)
      url = "$recitation/00${widget.chapters.id}.mp3";
    else if (widget.chapters.id.toString().length == 2)
      url = "$recitation/0${widget.chapters.id}.mp3";
    else if (widget.chapters.id.toString().length == 3)
      url = "$recitation/${widget.chapters.id}.mp3";
  }
}
