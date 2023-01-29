import 'dart:math';

import 'package:flutter/material.dart';

class PeiChart extends CustomPainter {
  final List<Category> categories;
  final double width;

  PeiChart({required this.categories, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 2;

    double total = 0;
    categories.forEach((expense) => total += expense.amount);

    double starRadian = -pi / 2;

    for (var index = 0; index < categories.length; index++) {
      final currentCategory = categories.elementAt(index);
      final sweepRadian = currentCategory.amount / total * 2 * pi;
      paint.color = kNeumorphicColors.elementAt(index % categories.length);
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          starRadian, sweepRadian, false, paint);
      starRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null!;
  }
}

class Category {
  final String name;
  final double amount;

  Category({required this.name, required this.amount});
}

final kCategory = [
  Category(name: "Income", amount: 1989),
  Category(name: "Expense", amount: 2500)
];

final kNeumorphicColors = [
  Color.fromARGB(255, 255, 0, 0),
  Color.fromARGB(255, 35, 45, 255)
];
