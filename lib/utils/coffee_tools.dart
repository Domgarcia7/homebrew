class CoffeeTools {
  double gramsOfWater = 0;
  String coffeeType;
  double coffeeAmount;

//Determines the type of cofee based on the input string coffee 
//and sets the coffeetype variable 
  void setCoffeetype(String coffee) {
    if (coffee == "French Press") {
      coffeeType = "Course ground coffee";
    } else {
      coffeeType = "Medium ground coffee";
    }
  }

//calculates the amount of water in grams based on the user input 
//and then calculates the amount of coffee that should be used depending 
//on the coffee type
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
