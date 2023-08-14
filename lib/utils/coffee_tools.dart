class CoffeeTools {
  double gramsOfWater = 0;
  String coffeeType;
  double coffeeAmount;

  void setCoffeetype(String coffee) {
    if (coffee == "French Press") {
      coffeeType = "Course ground coffee";
    } else {
      coffeeType = "Medium ground coffee";
    }
  }

  void convertWater(String number) {
    double convert = double.parse(number);
    gramsOfWater = 177.42 * convert;

    if (coffeeType == "Course ground coffee") {
      coffeeAmount = gramsOfWater / 14;
    } else {
      coffeeAmount = gramsOfWater / 17;
    }
  }

  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError('Number of cups must be positive');
    }
    return cups * 6;
  }
}
