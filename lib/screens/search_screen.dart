// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/replique_widget.dart';
import '../replique_data.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCharacterName = '';

  void _onCharacterPressed(String characterName) {
    setState(() {
      selectedCharacterName = characterName;
    });
  }

  @override
  Widget build(BuildContext context) {

    // media queries
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    final safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    final safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    final safeWidth = (screenWidth - safeAreaHorizontal) / 100;
    final safeHeight = (screenHeight - safeAreaVertical) / 30;
    final appBarHeight = AppBar().preferredSize.height;

    final double myFontSize = safeWidth * 5;
    final double myPadding = safeHeight * 2;
    final double myIconSize = safeHeight * 4;
    final double myMargin = safeWidth * 2;

    //media queries end

    return Scaffold(
      backgroundColor: Color(0xFF1B032C),
      appBar: myAppBar(context, onTapAction: (destinationPage) {  }),
      body: Center(
        child: selectedCharacterName.isNotEmpty ? ListView.builder(
    itemCount: repliques.where((r) => r.nomPersonnage == selectedCharacterName).length,
    itemBuilder: (BuildContext context, int index) {
      final repliquesFiltrees = repliques.where((r) => r.nomPersonnage == selectedCharacterName).toList();
      return Column(
        children: [
          SizedBox(height: 15),
          RepliqueWidget(
            backgroundColor: repliquesFiltrees[index].backgroundColor,
            shadowColor: repliquesFiltrees[index].shadowColor,
            imageAssetPath: repliquesFiltrees[index].imageAssetPath,
            nomPersonnage: repliquesFiltrees[index].nomPersonnage,
            texteReplique: repliquesFiltrees[index].texteReplique,
            audio: repliquesFiltrees[index].audio,
          ),
          SizedBox(height: 5),
        ],
      );
    },
  )

: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _onCharacterPressed('Sullivan'),
                  child:Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Sully.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
                GestureDetector(
                  onTap: () => _onCharacterPressed('Bob Razowski'),
                  child: Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Bob.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _onCharacterPressed('Bouh'),
                  child: Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Bouh.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
                GestureDetector(
                  onTap: () => _onCharacterPressed('Leon'),
                  child: Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Leon.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _onCharacterPressed('Directeur'),
                  child: Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Directeur.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
                GestureDetector(
                  onTap: () => _onCharacterPressed('Celia'),
                  child: Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Celia.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _onCharacterPressed('Germaine'),
                  child: Container(
                  width: screenHeight / 6,
                  height: screenHeight / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Germaine.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                )
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
