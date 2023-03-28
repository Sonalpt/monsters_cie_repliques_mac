// ignore_for_file: prefer_const_constructors, use_function_type_syntax_for_parameters, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:monstres_et_cie_les_repliques/screens/favorites_screen.dart';
import 'package:monstres_et_cie_les_repliques/screens/search_screen.dart';

AppBar myAppBar(BuildContext context,
    {required Function()? onTapAction(destinationPage)}) {
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
  final safeHeight = (screenHeight - safeAreaVertical) / 30;
  final appBarHeight = AppBar().preferredSize.height;

  final double myFontSize = safeWidth * 5;
  final double myPadding = safeHeight * 2;
  final double myIconSize = safeHeight * 4;
  final double myMargin = safeWidth * 2;

  //end of media queries

  return AppBar(
    backgroundColor: Color(0xFF1B032C),
    toolbarHeight: 65,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(7),
        bottomRight: Radius.circular(7),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          color: Color(0xFFB38DFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(7),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB38DFF),
              offset: Offset(0, 4),
              blurRadius: 15,
              spreadRadius: 3,
            ),
            BoxShadow(
              color: Color(0xFFB38DFF),
              offset: Offset(0, 2),
              blurRadius: 100,
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    ),
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextSpan(
                text: 'M',
                style: TextStyle(
                  color: Color(0xFF508FFF),
                  fontSize: 50,
                  fontFamily: 'MonstersInc-2zO3',
                ),
              ),
              TextSpan(
                text: '.',
                style: TextStyle(
                  color: Color(0xFF5AFF4A),
                  fontSize: 50,
                  fontFamily: 'Roboto',
                ),
              ),
              TextSpan(
                text: 'les repliques',
                style: TextStyle(
                  color: Color(0xFF5AFF4A),
                  fontSize: 50,
                  fontFamily: 'MonstersInc-2zO3',
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            if (onTapAction != null) {
              onTapAction(SearchScreen());
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Image.asset(
              'assets/images/search.png',
              height: safeHeight,
              width: safeHeight,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (onTapAction != null) {
              onTapAction(FavoritesPage());
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              'assets/images/heart_light.png',
              height: safeHeight,
              width: safeHeight,
            ),
          ),
        ),
      ],
    ),
  );
}
