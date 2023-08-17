// Imports the Flutter Driver API.
import 'dart:math';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      // your code here
      final textEntry = find.byValueKey('textEntry');
      final frenchPressBtn = find.byValueKey('fp-btn');
      final frenchPressBtnText = find.byValueKey('fp-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(frenchPressBtnText), "French Press");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(frenchPressBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final inputText = find.byValueKey('input-cup-field');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      expect(await driver.getText(continueBtnText2), 'Continue');
      await driver.tap(inputText);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueBtn2);

      final textCoffeeGram = find.byValueKey('coffeeGramstext');
      final textWaterGrams = find.byValueKey('waterGramstext');
      final doneBtn = find.byValueKey('done-btn');

      expect(
          await driver.getText(textCoffeeGram), '60g - Course Ground Coffee');
      expect(await driver.getText(textWaterGrams), '850g - Water');
      await driver.tap(doneBtn);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      final textEntry = find.byValueKey('textEntry');
      final dripMachineBtn = find.byValueKey('dm-btn');
      final dripMachineBtnText = find.byValueKey('dm-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(dripMachineBtnText), "Drip Machine");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(dripMachineBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final inputText = find.byValueKey('input-cup-field');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      expect(await driver.getText(continueBtnText2), 'Continue');
      await driver.tap(inputText);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueBtn2);

      final textCoffeeGram = find.byValueKey('coffeeGramstext');
      final textWaterGrams = find.byValueKey('waterGramstext');
      final doneBtn = find.byValueKey('done-btn');

      expect(
          await driver.getText(textCoffeeGram), '50g - Medium Ground Coffee');
      expect(await driver.getText(textWaterGrams), '850g - Water');
      await driver.tap(doneBtn);
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      //your code here
      final textEntry = find.byValueKey('textEntry');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');
      await driver.tap(continueBtn);
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final textEntry = find.byValueKey('textEntry');
      final frenchPressBtn = find.byValueKey('fp-btn');
      final frenchPressBtnText = find.byValueKey('fp-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(frenchPressBtnText), "French Press");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(frenchPressBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');

      final backBtn = find.byValueKey('back-btn-2');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(continueBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here
      final textEntry = find.byValueKey('textEntry');
      final frenchPressBtn = find.byValueKey('fp-btn');
      final frenchPressBtnText = find.byValueKey('fp-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(frenchPressBtnText), "French Press");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(frenchPressBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');
      final inputText = find.byValueKey('input-cup-field');

      final backBtn = find.byValueKey('back-btn-2');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(inputText);
      await driver.enterText('-1');
      await driver.waitFor(find.text('-1'));
      await driver.tap(continueBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen with letter for cup amount",
        () async {
      //your code here
      //if you can restrict the keyboard to numbers only you can delete this test
      final textEntry = find.byValueKey('textEntry');
      final frenchPressBtn = find.byValueKey('fp-btn');
      final frenchPressBtnText = find.byValueKey('fp-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(frenchPressBtnText), "French Press");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(frenchPressBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');
      final inputText = find.byValueKey('input-cup-field');

      final backBtn = find.byValueKey('back-btn-2');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(inputText);
      await driver.enterText('a');
      await driver.waitFor(find.text('a'));
      await driver.tap(continueBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final textEntry = find.byValueKey('textEntry');
      final dripMachineBtn = find.byValueKey('dm-btn');
      final dripMachineBtnText = find.byValueKey('dm-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(dripMachineBtnText), "Drip Machine");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(dripMachineBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');

      final backBtn = find.byValueKey('back-btn-2');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(continueBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here
      final textEntry = find.byValueKey('textEntry');
      final dripMachineBtn = find.byValueKey('dm-btn');
      final dripMachineBtnText = find.byValueKey('dm-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(dripMachineBtnText), "Drip Machine");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(dripMachineBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');
      final inputText = find.byValueKey('input-cup-field');

      final backBtn = find.byValueKey('back-btn-2');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(inputText);
      await driver.enterText('-1');
      await driver.waitFor(find.text('-1'));
      await driver.tap(continueBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
    });
    
    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen with letter for cup amount",
        () async {
      //your code here
      final textEntry = find.byValueKey('textEntry');
      final dripMachineBtn = find.byValueKey('dm-btn');
      final dripMachineBtnText = find.byValueKey('dm-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(dripMachineBtnText), "Drip Machine");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(dripMachineBtn);
      await driver.tap(continueBtn);

      final textEntry2 = find.byValueKey('textEntry2');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');
      final inputText = find.byValueKey('input-cup-field');

      final backBtn = find.byValueKey('back-btn-2');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(inputText);
      await driver.enterText('a');
      await driver.waitFor(find.text('a'));
      await driver.tap(continueBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
    });
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test('Back button takes you back a page when pressing', () async {
      final textEntry = find.byValueKey('textEntry');
      final frenchPressBtn = find.byValueKey('fp-btn');
      final frenchPressBtnText = find.byValueKey('fp-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(frenchPressBtnText), "French Press");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(frenchPressBtn);
      await driver.tap(continueBtn);

      final backBtn = find.byValueKey('back-btn-2');

      final textEntry2 = find.byValueKey('textEntry2');
      final inputText = find.byValueKey('input-cup-field');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      expect(await driver.getText(continueBtnText2), 'Continue');
      await driver.tap(inputText);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueBtn2);

      final backBtn2 = find.byValueKey('back-btn');
      final textCoffeeGram = find.byValueKey('coffeeGramstext');
      final textWaterGrams = find.byValueKey('waterGramstext');
      final doneBtn = find.byValueKey('done-btn');

      expect(
          await driver.getText(textCoffeeGram), '60g - Course Ground Coffee');
      expect(await driver.getText(textWaterGrams), '850g - Water');
      await driver.tap(backBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');
    });
    test('Back button takes you back a page when pressing', () async {
      final textEntry = find.byValueKey('textEntry');
      final dripMachineBtn = find.byValueKey('dm-btn');
      final dripMachineBtnText = find.byValueKey('dm-btn-text');
      final continueBtn = find.byValueKey('chooseDevCont-btn');
      final continueBtnText = find.byValueKey('chooseDevCont-btn-text');

      expect(await driver.getText(dripMachineBtnText), "Drip Machine");
      expect(await driver.getText(continueBtnText), 'Continue');
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');

      await driver.tap(dripMachineBtn);
      await driver.tap(continueBtn);

      final backBtn = find.byValueKey('back-btn-2');

      final textEntry2 = find.byValueKey('textEntry2');
      final inputText = find.byValueKey('input-cup-field');
      final continueBtn2 = find.byValueKey('contInput-btn');
      final continueBtnText2 = find.byValueKey('contInput-text');

      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      expect(await driver.getText(continueBtnText2), 'Continue');
      await driver.tap(inputText);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(continueBtn2);

      final backBtn2 = find.byValueKey('back-btn');
      final textCoffeeGram = find.byValueKey('coffeeGramstext');
      final textWaterGrams = find.byValueKey('waterGramstext');
      final doneBtn = find.byValueKey('done-btn');

      expect(
          await driver.getText(textCoffeeGram), '50g - Medium Ground Coffee');
      expect(await driver.getText(textWaterGrams), '850g - Water');
      await driver.tap(backBtn2);
      expect(await driver.getText(textEntry2), 'How many cups would you like?');
      await driver.tap(backBtn);
      expect(
          await driver.getText(textEntry), 'What coffee maker are you using?');
    });
  });
}
