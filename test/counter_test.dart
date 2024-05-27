import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/counter.dart';

void main() {
  // given when then
  test('when class is instantiated, count value must be zero', () {
    //Arrange
    final Counter counter = Counter();

    //Act
    final value = counter.counter;

    //Assert
    expect(value, 0);
  });
}
