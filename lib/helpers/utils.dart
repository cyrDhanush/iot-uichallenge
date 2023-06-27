import 'dart:math';

degtorad(double degree) {
  return (degree / 180) * pi;
}

percentagetorad(double percent) {
  return degtorad((percent / 100) * (360));
}
