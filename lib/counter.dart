class Counter {
  int _counter = 0;

  int get counter => _counter;
  increment() {
    _counter++;
  }

  decrement() {
    // if (_counter > 0) {
    _counter--;
    // }
  }

  reset() {
    // if (_counter > 0) {
    _counter = 0;
    // }
  }
}
