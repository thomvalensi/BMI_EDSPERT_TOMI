import '../constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter = height! / 100;

    bmi = weight! / (heightInMeter * heightInMeter);

    return bmi!;
  }

  determineBmiCategory() {
    String category = '';
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else {
      category = obeseIII;
    }

    bmiCategory = category;
    return bmiCategory;
  }

  String getHealthRiskDescription() {
    String description = '';
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        // description = 'Possible nutritional deficiency and osteoporosis';
        description = 'Kemungkinan kekurangan nutrisi dan rentan osteoporosis';
        break;
      case normal:
        // description = 'Low risk (healthy range)';
        description = 'Resiko rendah (Kisaran sehat)';
        break;
      case overweight:
        description =
            // 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus';
            'Berisiko terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes melitus';
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        description =
            // 'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus. Metabollic syndrome';
            'Berisiko terkena penyakit jantung, tekanan darah tinggi, stroke, diabetes melitus. Sindrom metabolik';
        break;
      default:
        description = 'Description not found';
        break;
    }

    bmiDescription = description;
    return bmiDescription!;
  }
}
