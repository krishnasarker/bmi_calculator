import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int totalAge = 0;
  double bmiNumber = 0;
  dynamic statusBMI = "";
  TextEditingController age = TextEditingController();
  TextEditingController heightInfeet = TextEditingController();
  TextEditingController heightInInch = TextEditingController();
  TextEditingController weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 102, 190, 0),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Age",
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 190, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: age,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 102, 190, 0),
                        child: Icon(
                          Icons.man,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Height",
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 190, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 18)),
                    )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: heightInfeet,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: heightInInch,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromARGB(255, 102, 190, 0),
                          child: Text(
                            "FT+IN",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Weight",
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 190, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: weight,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 102, 190, 0),
                        child: Text("KG",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                          backgroundColor: const Color.fromARGB(255, 102, 190, 0)),
                      onPressed: () {
                        setState(() {
                          double calculateBMI(
                              double weight, double heightFeet, double heightInches) {
                            double heightInMeter = (heightFeet * 0.3048) + (heightInches * 0.0254);
                            double bmi = (weight / (heightInMeter * heightInMeter));
                            return bmi;
                          }

                          // double calculateBMI(double weight, double height) {
                          //   return weight / (height * height);
                          // }

                          var ageValue = int.parse(age.text);
                          var heightFeetValue = double.parse(heightInfeet.text);
                          var heightInchValue = double.parse(heightInInch.text);
                          var weightValue = double.parse(weight.text);

                          var bmiCalculate =
                              calculateBMI(weightValue, heightFeetValue, heightInchValue);
                          bmiNumber = double.parse(bmiCalculate.toStringAsFixed(2));

                          totalAge = ageValue;

                          if (bmiNumber >= 17.0 && bmiNumber <= 18.4) {
                            statusBMI = "Under Weight";
                          } else if (bmiNumber >= 18.5 && bmiNumber <= 24.9) {
                            statusBMI = "Normal";
                          } else if (bmiNumber >= 25.0 && bmiNumber <= 29.9) {
                            statusBMI = "Over Weight";
                          }
                        });
                      },
                      child: const Text("Calculate"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Age:$totalAge",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 102, 190, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "BMI:$bmiNumber",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 102, 190, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("IDEAL WEIGHT: $statusBMI",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 102, 190, 0),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
