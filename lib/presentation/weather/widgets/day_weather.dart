import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';
import 'package:fl_chart/fl_chart.dart';

class DayWeather extends StatelessWidget {
  const DayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 223,
      decoration: BoxDecoration(
        color: AppColor.containerBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  width: 28,
                  height: 28,
                  child: const Icon(
                    Icons.cloudy_snowing,
                    size: 16,
                  ),
                ),
              ),
              const Text(
                'Hourly forecast',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: -40,
                  maxY: 40,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval:
                            1, // Устанавливаем интервал для отображения только нужных меток
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Mon');
                            case 1:
                              return Text('Tue');
                            case 2:
                              return Text('Wen');
                            case 3:
                              return Text('Thu');
                            case 4:
                              return Text('Fri');
                            case 5:
                              return Text('Sat');
                            case 6:
                              return Text('Sun');
                          }
                          return Text('');
                        },
                      ),
                    ),
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, -5),
                        FlSpot(1, 0),
                        FlSpot(2, -1),
                        FlSpot(3, 3),
                        FlSpot(4, 1),
                        FlSpot(5, -2),
                        FlSpot(6, 1),
                      ],
                      isCurved: true,
                      color: Colors.black,
                      barWidth: 2,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.purple.withOpacity(0.2),
                      ),
                    ),
                  ],
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: 3,
                        color: Colors.purple,
                        strokeWidth: 2,
                        dashArray: [8, 4],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
