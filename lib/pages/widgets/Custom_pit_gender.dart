import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petitto_pet/provider/pit_species_provider.dart';
import 'package:provider/provider.dart';

import '../../resources/assetsManager.dart';
import '../../resources/colorsManager.dart';
import '../../resources/variable_manager.dart';
import 'custom_pit_type.dart';

class CustomPitGender extends StatelessWidget {
  const CustomPitGender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PitSpeciesProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPitTypeWidget(
            onTap: () {
              value.isCheck(0, "gender");
            },
            decoration: value.petSpecies[0].isMile == true
                ? BoxDecoration(
                    border: Border.all(color: ColorManager.secondaryColor),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                  )
                : BoxDecoration(
                    border: Border.all(color: const Color(0xFF3232324D)),
                    borderRadius: BorderRadius.circular(50),
                  ),
            cycleColor: value.petSpecies[0].isMile == true
                ? VariableAddPet.colorGender[0]
                : Colors.transparent,
            typeName: "",
            child: SvgPicture.asset(SvgAssets.gender[0]),
          ),
          CustomPitTypeWidget(
            onTap: () {
              value.isCheck(1, "gender");
            },
            decoration: value.petSpecies[1].isMile == true
                ? BoxDecoration(
                    border: Border.all(color: ColorManager.secondaryColor),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                  )
                : BoxDecoration(
                    border: Border.all(color: const Color(0xFF3232324D)),
                    borderRadius: BorderRadius.circular(50),
                  ),
            cycleColor: value.petSpecies[1].isMile == true
                ? VariableAddPet.colorGender[1]
                : Colors.transparent,
            typeName: "",
            child: SvgPicture.asset(SvgAssets.gender[1]),
          )
        ],
      ),
    );
  }
}
