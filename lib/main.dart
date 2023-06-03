import 'package:flutter/material.dart';
import 'package:petitto_pet/pages/screens/add_pet_name.dart';
import 'package:petitto_pet/pages/widgets/custem_wheel_chooser_widget.dart';
import 'package:petitto_pet/provider/pit_species_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const PetitoPet());
}

class PetitoPet extends StatelessWidget {
  const PetitoPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return PitSpeciesProvider();
      },
      child: MaterialApp(
        home: AddPetNameScreen(),
      ),
    );
  }
}
