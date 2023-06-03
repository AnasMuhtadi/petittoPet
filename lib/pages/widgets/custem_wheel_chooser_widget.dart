import 'package:flutter/material.dart';
import 'package:petitto_pet/pages/widgets/wheel_widgets/gradient_circle_line.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class CustomWheelChooserWidget extends StatelessWidget {
  const CustomWheelChooserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const GradientCircleLine(),
          SizedBox(
            height: 80,
            child: WheelChooser.integer(
              onValueChanged: (s) {
                
              },
              maxValue: 99,
              minValue: 1,
              initValue: 2,
              horizontal: true,
              itemSize: 70,
              selectTextStyle: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              unSelectTextStyle: const TextStyle(
                  color: Color(0xff32323299),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text("years",style: TextStyle(fontSize: 15)),
          const GradientCircleLine(),
          SizedBox(
            height: 80,
            child: WheelChooser.integer(
              onValueChanged: (s) {},
              maxValue: 12,
              minValue: 1,
              initValue: 8,
              horizontal: true,
              itemSize: 70,
              selectTextStyle: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
              unSelectTextStyle: const TextStyle(
                  color: Color(0xff32323299),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text("months",style: TextStyle(fontSize: 15),),
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 1,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Colors.white,
                      Color(0xffC4C4C4),
                      Colors.white
                    ])),
          ),
        ],
      ),
    );
  }
}
