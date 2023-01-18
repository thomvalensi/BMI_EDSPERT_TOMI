import 'package:bmi_edspert_tomimulki/constants/constant.dart';
import 'package:bmi_edspert_tomimulki/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;

  double calculateBmi() {
    double heightInMeter = height / 100;
    // final h = pow(height, 2)
    final h = (heightInMeter * heightInMeter);
    final bmi = weight / h;
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: const [
            Expanded(
                child: BmiCard(
              child: GenderIconText(
                icon: Icons.male,
                title: 'MALE',
              ),
            )),
            Expanded(
              child: BmiCard(
                  child: GenderIconText(
                icon: Icons.female,
                title: 'FEMALE',
              )),
            ),
          ],
        )),
        Expanded(
            child: Container(
          child: BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: labelTextStyle!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$height",
                      style: numberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    )
                  ],
                ),
                Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 200,
                    thumbColor: Colors.red,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    })
              ],
            ),
          ),
        )),
        Expanded(
            child: Container(
          child: Row(
            children: [
              Expanded(
                  child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: labelTextStyle),
                    Text("$weight", style: numberTextStyle),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            weight++;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 56, height: 56),
                        ),
                        SizedBox(width: 10),
                        RawMaterialButton(
                          onPressed: () {
                            weight--;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 56, height: 56),
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: labelTextStyle),
                    Text("$age", style: numberTextStyle),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            age++;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 56, height: 56),
                        ),
                        SizedBox(width: 10),
                        RawMaterialButton(
                          onPressed: () {
                            age--;
                            setState(() {});
                          },
                          elevation: 0,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                          fillColor: Color(0xff212747),
                          constraints:
                              BoxConstraints.tightFor(width: 56, height: 56),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        )),
        GestureDetector(
          onTap: () {
            // print(calculateBmi());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return BmiResultScreen(bmi: calculateBmi());
                }),
              ),
            );
          },
          child: Container(
            height: 80,
            color: Color(0xffec3c66),
            child: Center(
              child: Text("CUSS Hitung BMI !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFF272a4e), borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(title, style: labelTextStyle)
      ],
    );
  }
}
