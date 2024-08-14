import 'package:flutter/material.dart';
import 'package:audicar_getx/widget/text_widget.dart';

class CarPart extends StatelessWidget {
  final bool state;
  final String name;
  final VoidCallback onTap;

  const CarPart({
    Key? key,
    required this.state,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7),
      height: 130,
      width: 168, // Adjusted the width here
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: state ? Colors.red : Colors.transparent,
            blurRadius: state ? 40 : 0,
          ),
        ],
        color: state ? Colors.red : Colors.black.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(name, 20, Colors.white, FontWeight.bold),
              const SizedBox(height: 10),
              text(state ? "Opened" : "Closed", 20,
                  Colors.white.withOpacity(.5), FontWeight.bold),
            ],
          ),
          const Spacer(),
          Transform.rotate(
            angle: -1.6,
            child: Transform.scale(
              scaleX: 1.5,
              scaleY: 1.5,
              child: Switch(
                activeColor: Colors.red,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(.1),
                value: state,
                onChanged: (value) => onTap(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
