import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(-1), throwsArgumentError);
    });
  });

  group("ozToGrams", () {
    test('calculates grams from ounces', () {
      var grams = CoffeeTools.ozToGrams(1);
      expect(grams, closeTo(28.3495231, 0.0001));
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.ozToGrams(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.ozToGrams(-2), throwsArgumentError);
    });
  });

  group("ratioCoffeeFP", () {
    test('calculates coffee-to-water ratio for FP', () {
      var ratio = CoffeeTools.ratioCoffeeFP(14.0);
      expect(ratio, closeTo(1.0, 0.0001));
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.ratioCoffeeFP(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.ratioCoffeeFP(-2), throwsArgumentError);
    });
  });

  group("ratioCoffeeDM", () {
    test('calculates coffee-to-water ratio for DM', () {
      var ratio = CoffeeTools.ratioCoffeeDM(17.0);
      expect(ratio, closeTo(1.0, 0.0001));
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.ratioCoffeeDM(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.ratioCoffeeDM(-2), throwsArgumentError);
    });
  });
}

