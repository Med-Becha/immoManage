import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Incomechart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.3,
        child: LineChart(
          LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(1, 1000),
                    FlSpot(2, 3000),
                    FlSpot(3, 8000),
                    FlSpot(4, 2000),
                    FlSpot(5, 4400),
                    FlSpot(6, 3000),
                    FlSpot(7, 3000),
                    FlSpot(8, 3000),
                    FlSpot(9, 3000),
                    FlSpot(10, 3000),
                    FlSpot(11, 3000),
                    FlSpot(12, 3000),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Color.fromARGB(109, 33, 149, 243),
                  ),
                )
              ],
              titlesData: const FlTitlesData(
                rightTitles: AxisTitles(
                  axisNameWidget: Text("revenue en mille dinars"),
                  sideTitles: SideTitles(showTitles: false, interval: 2),
                ),
                topTitles: AxisTitles(
                    axisNameWidget: const Text("revenus par mois"),
                    sideTitles: SideTitles(
                        showTitles: false, reservedSize: 20, interval: 3)),
                show: true,
              ),
              gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true)),
        ),
      ),
    );
  }
}
