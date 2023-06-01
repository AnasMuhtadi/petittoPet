import 'package:flutter/cupertino.dart';
import 'package:petitto_pet/models/pit_species_model.dart';

class PitSpeciesProvider extends ChangeNotifier {
  bool genderMile = true;
  int currantNum = 0;
  double linearCount =0.13;


  void setCurrantNum(int index) {
    currantNum = index;
    notifyListeners();
  }

  void setLinearCount({bool isPop = false , bool isPush = false }) {
    if(linearCount > 0.13 && isPop) {
        linearCount -= 0.13;
      } else if(linearCount < 0.65 && isPush) {
        linearCount += 0.13;

    }
    notifyListeners();
  }

  void isCheck(int index) {
    for (int i = 0; i < petSpecies.length; i++) {
      petSpecies[i].isSelect = false;
    }
    petSpecies[index].isSelect = true;
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

  List<Color> colorGender = [Color(0xFFC3E4F2),Color(0xFFDFD4FB)];
  List<String> text = ["What’s the name of your pet?","What’s your pet’s species?","What about your pet’s breed?","What’s your pet’sgender?","Is your pet neuter?"];


  void isMile(int index){
    if(index != 0){
      genderMile = false;
    }else{
      genderMile= true;
    }
    notifyListeners();

  }
}
