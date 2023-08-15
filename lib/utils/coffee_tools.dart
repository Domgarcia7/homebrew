class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double ozToGrams(double oz) {
    if (oz <= 0) {
      throw ArgumentError();
    }
    return oz * 28.3495231;
  }

  static double ratioCoffeeFP(double ozOfWater) {
    if (ozOfWater <= 0) {
      throw ArgumentError();
    } else {
      return ozOfWater / 14.0;
    }
  }

  static double ratioCoffeeDM(double ozOfWater) {
    if (ozOfWater <= 0) {
      throw ArgumentError();
    } else {
      return ozOfWater / 17.0;
    }
  }
}