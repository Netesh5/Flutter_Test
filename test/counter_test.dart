import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/counter.dart';

void main() {
  late Counter counter;

  //PreTest
  setUp(() {
    counter = Counter();
  });
  setUpAll(() => null);

  //Setup is called before every test

  //setup all is called before every test

//Testing
  // given when then
  group("Counter class - ", () {
    test('when class is instantiated, count value must be zero', () {
      //Arrange

      //Act
      final value = counter.counter;

      //Assert
      expect(value, 0);
    });

    test(
        "When counter button is pressed, counter value should be incremented to 1",
        () {
      counter.increment();

      expect(counter.counter, 1);
    });

    test(
        "When counter button is pressed, counter value should be decremented to -1",
        () {
      counter.decrement();

      expect(counter.counter, -1);
    });

    test(
        "given when counter reset button is pressed, counter value should be reset to 0",
        () {
      counter.reset();

      expect(counter.counter, 0);
    });
  });

  //Post Test

// teardown is called after the test
  tearDown(() => null);

  //teardown all is called after all the test
  tearDownAll(() => null);
}
