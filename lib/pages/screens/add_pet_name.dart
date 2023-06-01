import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petitto_pet/models/pit_species_model.dart';
import 'package:petitto_pet/pages/widgets/custem_textfild.dart';
import 'package:petitto_pet/pages/widgets/custom_pit_type.dart';
import 'package:petitto_pet/provider/pit_species_provider.dart';
import 'package:petitto_pet/resources/assetsManager.dart';
import 'package:petitto_pet/resources/colorsManager.dart';
import 'package:petitto_pet/resources/valuesManager.dart';
import 'package:provider/provider.dart';

import '../widgets/linear_count_widget.dart';

bool isSelect = false;

class AddPetNameScreen extends StatelessWidget {
  const AddPetNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin:
            Provider.of<PitSpeciesProvider>(context).currantNum >
                    1
                ?  const EdgeInsets.only(bottom: AppPadding.p44)
                :  const EdgeInsets.only(bottom:  AppPadding.p24),
        height: 56,
        width: 279,
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton(
            onPressed: () {
              Provider.of<PitSpeciesProvider>(context, listen: false)
                  .setLinearCount(isPush: true);
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            child: const Text("Next")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Consumer<PitSpeciesProvider>(
          builder: (context, value, child) {
            return Column(children: [
               addVerticalSpace(AppSize.s60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Provider.of<PitSpeciesProvider>(context, listen: false)
                            .setLinearCount(isPop: true);
                        controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                   Text("${value.currantNum+1}/7"),
                ],
              ),
              addVerticalSpace(AppSize.s30),
              const LinearCountWidget(),
              addVerticalSpace(AppSize.s32),
              SizedBox(
                height: 64,
                width: 205,
                child: Text(
                  value.text[value.currantNum],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              addVerticalSpace(AppSize.s24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: Column(
                  children: [
                    Expanded(
                      child: OverflowBox(
                        maxWidth: MediaQuery.of(context).size.width,
                        child: PageView(
                          onPageChanged: (int index) {
                            value.setCurrantNum(index);

                          },
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller,
                          children: [
                            const CustomTextFild(
                              hint: "Add name",
                            ),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return CustomPitTypeWidget(
                                    onTap: () {
                                      value.isCheck(index);
                                    },
                                    decoration:
                                        value.petSpecies[index].isSelect == true
                                            ? BoxDecoration(
                                                border: Border.all(
                                                    color: ColorManager
                                                        .secondaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.transparent,
                                              )
                                            : null,
                                    cycleColor:
                                        value.petSpecies[index].backgroundColor,
                                    typeName: value.petSpecies[index].name,
                                    child: SvgPicture.asset(
                                        SvgAssets.animals[index]));
                              },
                            ),
                            const CustomTextFild(
                              hint: "Type pet's breed",
                            ),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return CustomPitTypeWidget(
                                  onTap: () {
                                    value.isCheck(index);
                                  },
                                  decoration:
                                      value.petSpecies[index].isSelect == true
                                          ? BoxDecoration(
                                              border: Border.all(
                                                  color: ColorManager
                                                      .secondaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.transparent,
                                            )
                                          : BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xFF3232324D)),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                  cycleColor:
                                      value.petSpecies[index].isSelect == true
                                          ? value.colorGender[index]
                                          : Colors.transparent,
                                  typeName: "",
                                  child:
                                      SvgPicture.asset(SvgAssets.gender[index]),
                                );
                              },
                            ),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return CustomPitTypeWidget(
                                  onTap: () {
                                    value.isCheck(index);
                                  },
                                  decoration:
                                      value.petSpecies[index].isSelect == true
                                          ? BoxDecoration(
                                              border: Border.all(
                                                  color: ColorManager
                                                      .secondaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.transparent,
                                            )
                                          : BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xFF3232324D)),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                  cycleColor:
                                      value.petSpecies[index].isSelect == true
                                          ? value.colorGender[0]
                                          : Colors.transparent,
                                  typeName: "",
                                  child: Center(
                                      child: Text(
                                    (index == 0) ? "Yes" : "No",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorManager.mainColor),
                                  )),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Visibility(
                visible: value.currantNum > 1,
                child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "I don’t know",
                      style: TextStyle(
                          fontSize: 15,
                          color: ColorManager.secondaryColor,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              const SizedBox(
                height: 20,
              )
            ]);
          },
        ),
      ),
    );
  }
}
