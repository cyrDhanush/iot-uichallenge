import 'package:flutter/material.dart';
import 'package:iot_uichallenge/global.dart';

class CustomSwitch extends StatefulWidget {
  final Function? onChanged;
  const CustomSwitch({super.key, this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (status == false)
          status = true;
        else
          status = false;
        if (widget.onChanged != null) {
          widget.onChanged!(status);
        }
        setState(() {});
      },
      child: AnimatedContainer(
        duration: switchduration,
        curve: switchcurve,
        height: 25,
        width: 50,
        padding: EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
        decoration: BoxDecoration(
          color:
              (status == false) ? (Colors.black) : (Colors.white.withAlpha(70)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: AnimatedAlign(
          alignment: (status == false)
              ? (Alignment.centerLeft)
              : (Alignment.centerRight),
          duration: switchduration,
          curve: switchcurve,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
