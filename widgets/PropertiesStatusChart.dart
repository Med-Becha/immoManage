import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:immo_manager/widgets/Indicator.dart';

class PropertiesStatusChart extends StatelessWidget {
  const PropertiesStatusChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                sectionsSpace: 1,
                centerSpaceRadius: 50,
                startDegreeOffset: 0,
                sections: [
                  PieChartSectionData(
                      value: 20,
                      color: Colors.red,
                      titleStyle: const TextStyle(color: Colors.white)),
                  PieChartSectionData(
                      value: 30,
                      color: Colors.blue,
                      titleStyle: const TextStyle(color: Colors.white)),
                  PieChartSectionData(
                    value: 70,
                    color: Colors.green,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Indicator(
                color: Colors.green,
                text: 'Occupées',
                isSquare: false,
                size: 18,
                textColor: Colors.green,
              ),
              Indicator(
                color: Colors.blue,
                text: 'Disponible',
                isSquare: false,
                size: 18,
                textColor: Colors.blue,
              ),
              Indicator(
                color: Colors.red,
                text: 'Maintenance',
                isSquare: false,
                size: 18,
                textColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
