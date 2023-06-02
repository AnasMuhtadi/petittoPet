import 'package:flutter/material.dart';
import 'package:petitto_pet/resources/valuesManager.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
              height: AppSize.s70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: Colors.red,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.02),
                      blurRadius: 15,

                    )
                  ])),
          Column(
            children: [
              addVerticalSpace(5),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                  hintText: hint,
                  hintStyle: const TextStyle(
                      color: Color.fromRGBO(142, 142, 142, 1), fontSize: 15),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p24, vertical: AppSize.s20),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
