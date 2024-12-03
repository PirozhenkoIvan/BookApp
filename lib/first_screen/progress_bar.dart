import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;

  const ProgressBar(
      {required this.value, required this.minValue, required this.maxValue});

  @override
  Widget build(BuildContext context) {
    double progress = (value - minValue) / (maxValue - minValue);

    return Container(
        alignment: Alignment.bottomCenter,
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${value.toInt()}',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black45),
                ),
                Text(
                  '${maxValue.toInt()}',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black45),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress.clamp(0, 1),
                minHeight: 3,
                backgroundColor: Colors.white24,
                color: Colors.black54,
              ),
            )
          ],
        ));
  }
}
