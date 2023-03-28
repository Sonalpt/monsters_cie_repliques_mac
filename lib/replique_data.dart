import 'package:flutter/material.dart';

class Replique {
  final int backgroundColor;
  final int shadowColor;
  String imageAssetPath;
  String nomPersonnage;
  String texteReplique;
  String audio;

  Replique(
      {required this.backgroundColor,
      required this.shadowColor,
      required this.imageAssetPath,
      required this.nomPersonnage,
      required this.texteReplique,
      required this.audio});
}

List<Replique> repliques = [
  Replique(
      backgroundColor: 0xFF50CEFF,
      shadowColor: 0xFF508FFF,
      imageAssetPath: "assets/images/Sully.jpg",
      nomPersonnage: "Sullivan",
      texteReplique: "reluque dans mon que sa",
      audio: "audio/reluque-dans-mon-quesa.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "ou je pique une crise",
      audio: "audio/ou-je-pique-une-crise.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "ne pete pas un boulon",
      audio: "audio/ne-pete-pas-un-boulon.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "calefouette balayette",
      audio: "audio/calefouette-balayette.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "un qi de bulot",
      audio: "audio/un-qi-de-bulot.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "la cata de chez cata",
      audio: "audio/la-cata.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "envolee",
      audio: "audio/envolee.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "soit au moins poli",
      audio: "audio/soit-au-moins-poli.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "je suis dans le potage",
      audio: "audio/dans-le-potage.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "le plan potage",
      audio: "audio/le-plan-potage.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "le massacre",
      audio: "audio/le-massacre.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "la croisiere de l amour",
      audio: "audio/la-croisiere-de-amour.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "marcher",
      audio: "audio/marcher.mp3"),
  Replique(
      backgroundColor: 0xFF9CFF6A,
      shadowColor: 0xFF5AFF4A,
      imageAssetPath: "assets/images/Bob.jpg",
      nomPersonnage: "Bob Razowski",
      texteReplique: "plat du jour",
      audio: "audio/plats-du-jour.mp3"),
  // ajoutez autant d'objets que nécessaire
];
