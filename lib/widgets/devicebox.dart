import 'package:flutter/material.dart';
import 'package:iot_uichallenge/global.dart';
import 'package:iot_uichallenge/widgets/customswitch.dart';

class DeviceBox extends StatefulWidget {
  final Color bgcolor;
  const DeviceBox({super.key, this.bgcolor = Colors.blue});

  @override
  State<DeviceBox> createState() => _DeviceBoxState();
}

class _DeviceBoxState extends State<DeviceBox> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: switchduration,
      curve: switchcurve,
      height: 200,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: (status == false) ? (Colors.white) : (widget.bgcolor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.indeterminate_check_box,
            color: (status == false) ? (Colors.black) : (Colors.white),
            size: 50,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Smart Ac',
            style: TextStyle(
              fontSize: 15,
              color: (status == false) ? (Colors.black) : (Colors.white),
            ),
          ),
          Spacer(),
          CustomSwitch(
            onChanged: (bool switchstatus) {
              status = switchstatus;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
