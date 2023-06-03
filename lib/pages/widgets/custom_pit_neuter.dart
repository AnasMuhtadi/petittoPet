import 'package:flutter/material.dart';
import 'package:petitto_pet/provider/pit_species_provider.dart';
import 'package:provider/provider.dart';

import '../../resources/colorsManager.dart';
import 'custom_pit_type.dart';

class CustomPitNeuter extends StatelessWidget {
  const CustomPitNeuter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PitSpeciesProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPitTypeWidget(
            onTap: () {
              value.isCheck(0, "neuter");
            },
            decoration: value.petSpecies[0].isNeuter == true
                ? BoxDecoration(
                    border: Border.all(color: ColorManager.secondaryColor),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                  )
                : BoxDecoration(
                    border: Border.all(color: const Color(0xFF3232324D)),
                    borderRadius: BorderRadius.circular(50),
                  ),
            cycleColor: value.petSpecies[0].isNeuter == true
                ? ColorManager.whiteBlue
                : Colors.transparent,
            typeName: "",
            child: const Center(
                child: Text(
              "Yes",
              style: TextStyle(fontSize: 15, color: ColorManager.mainColor),
            )),
          ),
          CustomPitTypeWidget(
            onTap: () {
              value.isCheck(1, "neuter");
            },
            decoration: value.petSpecies[1].isNeuter == true
                ? BoxDecoration(
                    border: Border.all(color: ColorManager.secondaryColor),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                  )
                : BoxDecoration(
                    border: Border.all(color: const Color(0xFF3232324D)),
                    borderRadius: BorderRadius.circular(50),
                  ),
            cycleColor: value.petSpecies[1].isNeuter == true
                ? ColorManager.whiteBlue
                : Colors.transparent,
            typeName: "",
            child: const Center(
                child: Text(
              "No",
              style: TextStyle(fontSize: 15, color: ColorManager.mainColor),
            )),
          )
        ],
      ),
    );
  }
}
