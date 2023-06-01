
import 'package:flutter/material.dart';
import 'package:petitto_pet/provider/pit_species_provider.dart';
import 'package:provider/provider.dart';

import '../../resources/colorsManager.dart';

class LinearCountWidget extends StatelessWidget {
  const LinearCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: 6,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xFF3232321A),
              borderRadius: BorderRadius.circular(50)),
        ),
        AnimatedContainer(
          height: 6,
          width:
          MediaQuery.of(context).size.width * Provider.of<PitSpeciesProvider>(context).linearCount,
          decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.circular(50)),
          duration: const Duration(milliseconds: 500),
        )
      ],
    );
  }
}
