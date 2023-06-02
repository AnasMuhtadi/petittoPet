import 'package:flutter/cupertino.dart';
import 'package:petitto_pet/models/pit_species_model.dart';

import '../resources/variable_manager.dart';

class PitSpeciesProvider extends ChangeNotifier {

   int currantNum = 0;
   double linearCount =0.13;
  //********اعادة تعين قيمة CurrantNum ********
  void setCurrantNum(int index,) {
    if (index > currantNum) {
      linearCount += 0.13;
    } else if (linearCount < currantNum) {
      linearCount -= 0.13;
    }
    currantNum = index;

    notifyListeners();
  }

  //********فحص القيمة المحددة ********

  void isCheck(int index,String type) {
    if(type == "petType"){
    for (int i = 0; i < petSpecies.length; i++) {
      petSpecies[i].isSelect = false;
    }
    petSpecies[index].isSelect = true;
  }else if(type == "gender"){
      for (int i = 0; i < petSpecies.length; i++) {
        petSpecies[i].isMile = false;
      }
      petSpecies[index].isMile = true;
    }else if(type == "neuter"){
      for (int i = 0; i < petSpecies.length; i++) {
        petSpecies[i].isNeuter = false;
      }
      petSpecies[index].isNeuter = true;
    }
    notifyListeners();

  }

  //******** فحص الجنس ********

  void isMile(int index) {
    if (index != 0) {
      petSpecies[index].isMile = false;
    } else {
      petSpecies[index].isMile = true;
    }
    notifyListeners();
  }

  final List<PitSpeciesModel> petSpecies = [
    PitSpeciesModel(
        name: "Dog",
        iconPath: "assets/icons/dog.svg",
        backgroundColor: const Color(0xFFC3E4F2),
        isSelect: false),
    PitSpeciesModel(
        name: "Cat",
        iconPath: "assets/icons/cat.svg",
        backgroundColor: const Color(0xFFDFD4FB),
        isSelect: false),
    PitSpeciesModel(
        name: "Bird",
        iconPath: "assets/icons/bird.svg",
        backgroundColor: const Color(0xFFD3EFC3),
        isSelect: false),
    PitSpeciesModel(
        name: "Other",
        iconPath: "assets/icons/other.png",
        backgroundColor: const Color(0xFFF5E5C0),
        isSelect: false),
  ];
}
