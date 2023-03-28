// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unnecessary_null_comparison, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import "../helpers/database_helper.dart";
import "../replique_data.dart";


class RepliqueWidget extends StatefulWidget {
  final int backgroundColor;
  // final Color borderColor;
  // final Color textColor;
  final int shadowColor;
  String imageAssetPath;
  String nomPersonnage;
  String texteReplique;
  String audio;

  RepliqueWidget(
      {Key? key,
      required this.backgroundColor,
      // required this.borderColor,
      // required this.textColor,
      required this.shadowColor,
      required this.imageAssetPath,
      required this.nomPersonnage,
      required this.texteReplique,
      required this.audio})
      : super(key: key);

  @override
  _RepliqueWidgetState createState() => _RepliqueWidgetState();
}

class _RepliqueWidgetState extends State<RepliqueWidget> {
  
  static AudioCache player = new AudioCache();
  List<Replique> favoris = [];
  bool alreadyExists = false;

  @override
  void initState() {
    super.initState();
    player.load(widget.audio);
    checkIfAlreadyExists();
  }

  Future<void> checkIfAlreadyExists() async {
  final dbHelper = DatabaseHelper.instance;
  final rows = await dbHelper.queryAllRows();
  bool exists = rows.any((row) => row['texteReplique'] == widget.texteReplique);
  setState(() {
    alreadyExists = exists;
  });
  }

  Future<void> _loadFavoris() async {
  final dbHelper = DatabaseHelper.instance;
  final rows = await dbHelper.queryFavoris();
  setState(() {
    favoris = rows.map((row) => Replique(
      backgroundColor: row['backgroundColor'],
      shadowColor: row['shadowColor'],
      imageAssetPath: row['imageAssetPath'],
      nomPersonnage: row['nomPersonnage'],
      texteReplique: row['texteReplique'],
      audio: row['audio'],
    )).toList();
  });
}


  @override
  Widget build(BuildContext context) {
    final phraseAudioPath = widget.audio;
    return GestureDetector(
      onTap: () => player.play(phraseAudioPath),
      child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 85,
              decoration: BoxDecoration(
                color: Color(widget.backgroundColor),
                border: Border.all(
                  color: Color(0xFFB38DFF),
                  width: 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(widget.shadowColor).withAlpha(255),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 15),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(50), // pour rendre l'image ronde
                    child: Image.asset(
                      widget.imageAssetPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            height: 30,
                            child: Text(
                              widget.nomPersonnage,
                              style: TextStyle(
                                color: Color(0xFF19539B),
                                fontSize: 30,
                                fontFamily: 'MonstersInc-2zO3',
                                // ignore: prefer_const_literals_to_create_immutables
                                shadows: [
                                  Shadow(
                                    color: Colors
                                        .white, // couleur du contour blanc
                                    blurRadius: 1, // flou du contour
                                    offset:
                                        Offset(-1, -1), // décalage du contour
                                  ),
                                  Shadow(
                                    color: Colors
                                        .white, // couleur du contour blanc
                                    blurRadius: 1, // flou du contour
                                    offset:
                                        Offset(1, -1), // décalage du contour
                                  ),
                                  Shadow(
                                    color: Colors
                                        .white, // couleur du contour blanc
                                    blurRadius: 1, // flou du contour
                                    offset:
                                        Offset(-1, 1), // décalage du contour
                                  ),
                                  Shadow(
                                    color: Colors
                                        .white, // couleur du contour blanc
                                    blurRadius: 1, // flou du contour
                                    offset: Offset(1, 1), // décalage du contour
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.texteReplique,
                              style: TextStyle(
                                color: Color(0xFF19539B),
                                fontSize: 30,
                                fontFamily: 'MonstersInc-2zO3',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
      onTap: () async {
    final db = await DatabaseHelper.instance.database;
    final dbHelper = DatabaseHelper.instance;
    final rows = await dbHelper.queryAllRows();
    bool exists = rows.any((row) => row['texteReplique'] == widget.texteReplique);
    if (exists) {
      await db.delete(
        DatabaseHelper.table,
        where: 'texteReplique = ?',
        whereArgs: [widget.texteReplique],
      );
      print('Replique supprimée des favoris');
      // actualiser la liste des favoris après la suppression
      setState(() {
        alreadyExists = false;
        _loadFavoris();
      });
    } else {
      int insertedId = await DatabaseHelper.instance.insert({
        'backgroundColor': widget.backgroundColor,
        'shadowColor': widget.shadowColor,
        'imageAssetPath': widget.imageAssetPath,
        'nomPersonnage': widget.nomPersonnage,
        'texteReplique': widget.texteReplique,
        'audio': widget.audio,
        'favori': 1, // la réplique est un favori
      });
      print('Replique ajoutée aux favoris avec ID: $insertedId');
      setState(() {
      alreadyExists = !alreadyExists;
      _loadFavoris(); // inverser la valeur de alreadyExists après l'ajout ou la suppression
    });
    }
    
  },
      child: Image.asset(
        alreadyExists ? 'assets/images/heart_filled.png' : 'assets/images/heart.png',
        height: 30,
        width: 30,
      ),
    ),
                  SizedBox(width: 15),
                ],
              ),
            ),
    );
  }
}
