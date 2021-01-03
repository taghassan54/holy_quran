

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran/src/Blocs/ChaptersBloc/chapters_bloc.dart';

import 'package:holy_quran/src/assets/NavigateAssets.dart';
import 'package:holy_quran/src/config/DependenciesProvider.dart';

import 'package:holy_quran/src/screens/Verses/MainVersesScreen.dart';


class ChaptersScreen extends StatefulWidget {
  @override
  _ChaptersScreenState createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {

ChaptersBloc _chaptersBloc;
  @override
  void initState() {
    _chaptersBloc=new ChaptersBloc(DependenciesProvider.provide());
    _chaptersBloc.add(LoadChapters());

    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(child: Text("القرآن الكريم",style: TextStyle(fontSize: 24,color: Colors.green),),),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/header.png"),
                        fit: BoxFit.fitWidth
                    )
                ),
              ),
            ),
            Expanded(
              flex: 13,
              child: BlocBuilder(
                cubit: _chaptersBloc,
                builder: (context, state) {
                  if(state is ChaptersLoadedSuccessfully)
                  return Container(
                    margin: EdgeInsets.only(top: 0),
                    child: ListView.builder(
                      itemCount: state.chaptersModel.chapters.length,
                      itemBuilder: (context,index){
                        return  GestureDetector(
                          onTap: () {
                            push(context, MainVersesScreen(state.chaptersModel.chapters[index]));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/frame.png"),
                                    fit: BoxFit.fitWidth
                                )
                            ),
                            child: Center(
                              child: RichText(
                                text:TextSpan(
                                  text: "${state.chaptersModel.chapters[index].nameArabic} ",
                                  children: [
                                    TextSpan(
                                      text: " (\ ${state.chaptersModel.chapters[index].versesCount}  ${state.chaptersModel.chapters[index].versesCount<10?'آيات':'آية'} )\ ${state.chaptersModel.chapters[index].revelationPlace=="makkah"?"مكية":"مدنية"} ",
                                        style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w400)
                                    )
                                  ]
                                    ,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold,)
                                )
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                  if(state is LoadError){
                    return Center(child: Text("LoadError"),);
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
