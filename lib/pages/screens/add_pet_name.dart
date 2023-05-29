import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petitto_pet/models/pit_species_model.dart';
import 'package:petitto_pet/provider/pit_species_provider.dart';
import 'package:petitto_pet/resources/colorsManager.dart';
import 'package:provider/provider.dart';

bool isSelect = false;

class AddPetNameScreen extends StatelessWidget {
  AddPetNameScreen({Key? key}) : super(key: key);
  int currantNum = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    List<Widget> mm = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: 6,
                )
              ]),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              filled: true,
              hintText: "Type name",
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(142, 142, 142, 1),
                  fontSize: 15),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 17.5),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Provider.of<PitSpeciesProvider>(context,
                      listen: false)
                      .isCheck(index);
                },
                overlayColor: MaterialStateProperty.all(
                    Colors.transparent),
                child: Container(
                  height: 80,
                  width: 80,
                  margin:
                  EdgeInsets.symmetric(horizontal: 13.5),
                  padding: EdgeInsets.all(3),
                  decoration: Provider.of<PitSpeciesProvider>(
                      context,
                      listen: false)
                      .petSpecies[index]
                      .isSelect ==
                      true
                      ? BoxDecoration(
                    border: Border.all(
                        color:
                        ColorManager.secondaryColor),
                    borderRadius:
                    BorderRadius.circular(50),
                    color: Colors.transparent,
                  )
                      : null,
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                          Provider.of<PitSpeciesProvider>(
                              context)
                              .petSpecies[index]
                              .backgroundColor,
                          borderRadius:
                          BorderRadius.circular(50)),
                      child: SvgPicture.asset(
                        Provider.of<PitSpeciesProvider>(context,
                            listen: false)
                            .petSpecies[index]
                            .iconPath[index],
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(Provider.of<PitSpeciesProvider>(context)
                  .petSpecies[index]
                  .name)
            ],
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: 6,
                )
              ]),
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              filled: true,
              hintText: "Type name",
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(142, 142, 142, 1),
                  fontSize: 15),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24, vertical: 17.5),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Provider.of<PitSpeciesProvider>(context,
                      listen: false)
                      .isCheck(index);

                },
                overlayColor: MaterialStateProperty.all(
                    Colors.transparent),
                child: Container(
                  height: 80,
                  width: 80,
                  margin:
                  EdgeInsets.symmetric(horizontal: 13.5),
                  padding: EdgeInsets.all(3),
                  decoration: Provider.of<PitSpeciesProvider>(
                      context,
                      listen: false)
                      .petSpecies[index]?.isSelect == true
                      ? BoxDecoration(
                    border: Border.all(
                        color:
                        ColorManager.secondaryColor),
                    borderRadius:
                    BorderRadius.circular(50),
                    color: Colors.transparent,
                  )
                      : null,
                  child: Container(
                      decoration: BoxDecoration(
                          color:
                          Provider.of<PitSpeciesProvider>(
                              context,
                              listen: false)
                              .petSpecies[index].isSelect ==
                              true ? Provider.of<PitSpeciesProvider>(context).colorGender[index]:
                          Colors.transparent
                          ,
                          borderRadius:
                          BorderRadius.circular(50)),
                      child: SvgPicture.asset(
                        Provider.of<PitSpeciesProvider>(context,
                            listen: false)
                            .petSpecies[index]
                            .iconPath[index],
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(Provider.of<PitSpeciesProvider>(context)
                  .petSpecies[index]
                  .name)
            ],
          );
        },
      ),

    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: 56,
        width: 279,
        decoration: BoxDecoration(
          color: ColorManager.mainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton(
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut
              );
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            child: const Text("Next")),
      ),
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
                const Text("1/7"),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
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
                  width: MediaQuery.of(context).size.width *
                      (0.13 + 0.13 + 0.13 + 0.13 + 0.13),
                  decoration: BoxDecoration(
                      color: ColorManager.secondaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  duration: const Duration(milliseconds: 500),
                )
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             SizedBox(
              height: 64,
              width: 205,
              child: Text(
                Provider.of<PitSpeciesProvider>(context).text[Provider.of<PitSpeciesProvider>(context).currantPage],
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 110,
              child: Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: PageView(
                    onPageChanged: (int index){
                      Provider.of<PitSpeciesProvider>(context).currantPage = index;

                    },
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                  blurRadius: 6,
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                              filled: true,
                              hintText: "Type name",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(142, 142, 142, 1),
                                  fontSize: 15),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 17.5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<PitSpeciesProvider>(context,
                                      listen: false)
                                      .isCheck(index);
                                },
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 13.5),
                                  padding: EdgeInsets.all(3),
                                  decoration: Provider.of<PitSpeciesProvider>(
                                      context,
                                      listen: false)
                                      .petSpecies[index]
                                      .isSelect ==
                                      true
                                      ? BoxDecoration(
                                    border: Border.all(
                                        color:
                                        ColorManager.secondaryColor),
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    color: Colors.transparent,
                                  )
                                      : null,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                          Provider.of<PitSpeciesProvider>(
                                              context)
                                              .petSpecies[index]
                                              .backgroundColor,
                                          borderRadius:
                                          BorderRadius.circular(50)),
                                      child: SvgPicture.asset(
                                        Provider.of<PitSpeciesProvider>(context,
                                            listen: false)
                                            .petSpecies[index]
                                            .iconPath[index],
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(Provider.of<PitSpeciesProvider>(context)
                                  .petSpecies[index]
                                  .name)
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.05),
                                  blurRadius: 6,
                                )
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                              filled: true,
                              hintText: "Type name",
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(142, 142, 142, 1),
                                  fontSize: 15),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 17.5),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<PitSpeciesProvider>(context,
                                      listen: false)
                                      .isCheck(index);

                                },
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 13.5),
                                  padding: EdgeInsets.all(3),
                                  decoration: Provider.of<PitSpeciesProvider>(
                                      context,
                                      listen: false)
                                      .petSpecies[index]?.isSelect == true
                                      ? BoxDecoration(
                                    border: Border.all(
                                        color:
                                        ColorManager.secondaryColor),
                                    borderRadius:
                                    BorderRadius.circular(50),
                                    color: Colors.transparent,
                                  )
                                      : null,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                          Provider.of<PitSpeciesProvider>(
                                              context,
                                              listen: false)
                                              .petSpecies[index].isSelect ==
                                              true ? Provider.of<PitSpeciesProvider>(context).colorGender[index]:
                                          Colors.transparent
                                          ,
                                          borderRadius:
                                          BorderRadius.circular(50)),
                                      child: SvgPicture.asset(
                                        Provider.of<PitSpeciesProvider>(context,
                                            listen: false)
                                            .petSpecies[index]
                                            .iconPath[index],
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(Provider.of<PitSpeciesProvider>(context)
                                  .petSpecies[index]
                                  .name)
                            ],
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "I don’t know",
                  style: TextStyle(
                      fontSize: 15,
                      color: ColorManager.secondaryColor,
                      fontWeight: FontWeight.w400),
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
