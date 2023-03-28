import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../widgets/replique_widget.dart';
import "../replique_data.dart";
import '../widgets/app_bar.dart';
import '../helpers/database_helper.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> _favoris = [];

  @override
  void initState() {
    super.initState();
    _loadFavoris();
  }

  Future<void> _loadFavoris() async {
    final dbHelper = DatabaseHelper.instance;
    final rows = await dbHelper.queryAllRows();
    setState(() {
      _favoris = List<Map<String, dynamic>>.from(rows);
    });
  }

  @override
  Widget build(BuildContext context) {
    //media queries

    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    final safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    final safeWidth = (screenWidth - safeAreaHorizontal) / 100;
    final safeHeight = (screenHeight - safeAreaVertical) / 10;
    final appBarHeight = AppBar().preferredSize.height;

    final double myFontSize = safeWidth * 5;
    final double myPadding = safeHeight * 2;
    final double myIconSize = safeHeight * 4;
    final double myMargin = safeWidth * 2;

    //end of media queries
    return Scaffold(
      backgroundColor: Color(0xFF1B032C),
      appBar: myAppBar(context, onTapAction: (destinationPage) {}),
      body: ListView.builder(
        itemCount: _favoris.length,
        itemBuilder: (context, index) {
          final favori = _favoris[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5),
            child: RepliqueWidget(
              backgroundColor: favori['backgroundColor'],
              shadowColor: favori['shadowColor'],
              imageAssetPath: favori['imageAssetPath'],
              nomPersonnage: favori['nomPersonnage'],
              texteReplique: favori['texteReplique'],
              audio: favori['audio'],
            ),
          );
        },
      ),
    );
  }
}
