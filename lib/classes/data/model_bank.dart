import 'package:flutter_riverpod/legacy.dart';

class BoxC {
  final double xSide;
  final double ySide;
  BoxC({required this.xSide, required this.ySide});

  BoxC copyWith({double? xSide, double? ySide}) {
    return BoxC(xSide: xSide ?? this.xSide, ySide: ySide ?? this.ySide);
  }
}

final areaC = StateProvider<BoxC>((ref) {
  return BoxC(xSide: 10, ySide: 5);
});

class BankP {
  final double xSide;
  final double ySide;
  final double radious;
  final double opty;

  BankP({
    required this.xSide,
    required this.ySide,
    this.radious = 20,
    this.opty = 0.5,
  });

  BankP copyWith({
    double? xSide,
    double? ySide,
    double? radious,
    double? opty,
  }) {
    return BankP(
      xSide: xSide ?? this.xSide,
      ySide: ySide ?? this.ySide,
      radious: radious ?? this.radious,
      opty: opty ?? this.opty,
    );
  }
}

final practiceP = StateProvider<BankP>((ref) {
  return BankP(xSide: 5, ySide: 5, radious: 25, opty: 0.5);
});
