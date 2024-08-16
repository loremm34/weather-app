import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/configs/app_color.dart';

class DayWeather extends StatelessWidget {
  DayWeather({super.key});

  List<Color> gradientColors = [
    const Color(0xFF8E44AD),
    const Color.fromARGB(255, 212, 104, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.containerBackgroundColor,
          borderRadius: BorderRadius.circular(12)),
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
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                // top: 8,
                bottom: 18,
              ),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Mon', style: style);
        break;
      case 1:
        text = const Text('Tue', style: style);
        break;
      case 2:
        text = const Text('Wed', style: style);
        break;
      case 3:
        text = const Text('Thu', style: style);
        break;
      case 4:
        text = const Text('Fri', style: style);
        break;
      case 5:
        text = const Text('Sat', style: style);
        break;
      case 6:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case -10:
        text = '-10°';
        break;
      case 0:
        text = '0°';
        break;
      case 10:
        text = '10°';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 5,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.grey,
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.transparent),
      ),
      minX: 0,
      maxX: 6,
      minY: -10,
      maxY: 15,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, -5),
            FlSpot(1, -3),
            FlSpot(2, 0),
            FlSpot(3, 4),
            FlSpot(4, 2),
            FlSpot(5, 0),
            FlSpot(6, 2),
          ],
          isCurved: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
