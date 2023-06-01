
import 'package:flutter/material.dart';
import 'package:petitto_pet/resources/valuesManager.dart';


class CustomPitTypeWidget extends StatelessWidget {
   const CustomPitTypeWidget({super.key, required this.onTap,required this.decoration,required this.cycleColor,required this.typeName,required this.child,}) ;
   final Function() onTap;
   final BoxDecoration? decoration;
   final Color cycleColor;
   final String typeName;
   final Widget child;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: onTap,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          child: Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 13.5),
            padding: const EdgeInsets.all(3),
            decoration: decoration,
            child: Container(
              padding: EdgeInsets.all(AppPadding.p20),
                decoration: BoxDecoration(
                    color: cycleColor,
                  borderRadius: BorderRadius.circular(50)
                ),
              child: child,

            ),

          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(typeName)
      ],
    );
  }
}
