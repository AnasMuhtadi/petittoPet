import 'package:flutter/material.dart';

class PitSpeciesModel {
  String name;
  String iconPath;
  Color backgroundColor;
  bool isSelect;
  bool? isMile;
  bool? isNeuter;

  PitSpeciesModel(
      {required this.name,
       required this.iconPath,
       required this.backgroundColor,
       required this.isSelect,
       });
  
}

