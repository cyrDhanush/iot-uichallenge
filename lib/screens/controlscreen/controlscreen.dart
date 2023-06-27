import 'package:flutter/material.dart';
import 'package:iot_uichallenge/global.dart';
import 'package:iot_uichallenge/helpers/utils.dart';
import 'package:iot_uichallenge/screens/controlscreen/temparc.dart';
import 'package:iot_uichallenge/screens/controlscreen/tempdot.dart';
import 'package:iot_uichallenge/trialpage.dart';
import 'package:iot_uichallenge/widgets/customswitch.dart';
import 'package:rainbow_color/rainbow_color.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  // temperature from 16 to 30
  Rainbow themebg = Rainbow(
    spectrum: spectrum,
    rangeStart: 0,
    rangeEnd: 1,
  );
  int slidertoTemp() {
    return (((30 - 16) * slidervalue) + 16).toInt();
  }

  double slidervalue = 0.3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Smart AC'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themebg[slidervalue].withAlpha(10),
              themebg[slidervalue].withAlpha(100),
              themebg[slidervalue].withAlpha(180),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(),
              Spacer(),
              // temperator bar
              Container(
                height: MediaQuery.of(context).size.width - 50,
                width: MediaQuery.of(context).size.width - 50,
                padding: EdgeInsets.all(30),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    // outer progress(arc)
                    Container(
                      child: CustomPaint(
                        painter: DrawArc(
                          color: Colors.white.withAlpha(20),
                        ),
                        foregroundPainter: DrawArc(
                          color: themebg[slidervalue],
                          value: (slidervalue / 2) * 100,
                        ),
                      ),
                    ),

                    // inner progress
                    Container(
                      // inner circle
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(500),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(100),
                            blurRadius: 100,
                            spreadRadius: -10,
                            offset: Offset(7, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            slidertoTemp().toString(),
                            style: TextStyle(
                              fontSize: 75,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'o',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'C',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // temperature dot
                    Container(
                      padding: EdgeInsets.all(50),
                      child: TempDot(
                        value: (slidervalue / 2) * 100,
                        dotColor: themebg[slidervalue],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Power',
                            style: smallhead,
                          ),
                          Row(
                            children: [
                              CustomSwitch(
                                inactivebg: Colors.black.withAlpha(100),
                                activebg: Colors.white.withAlpha(100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temp',
                      style: smallhead,
                    ),
                    Row(
                      children: [
                        Text(
                          '16 °C',
                          style: smallbody,
                        ),
                        Expanded(
                          child: Slider(
                            value: slidervalue,
                            inactiveColor: Colors.white.withAlpha(100),
                            activeColor: Colors.white,
                            onChanged: (value) {
                              slidervalue = value;
                              setState(() {});
                            },
                          ),
                        ),
                        Text(
                          '30 °C',
                          style: smallbody,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
