import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';
import 'package:get/get.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: LandinaAppbar(
            title: 'آمار و ارقام',
            rightIcon: Ionicons.reorder_two,
            rightIconOnPressed: () {},
            leftIcon: IconlyLight.arrow_left,
            leftIconOnPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
            parent: ClampingScrollPhysics(),
          ),
          children: [
            Container(
              height: 200,
              child: LineChart(
                mainData(),
                swapAnimationCurve: Curves.linear,
                swapAnimationDuration: const Duration(milliseconds: 1000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

LineChartData mainData() {
  return LineChartData(
    borderData: FlBorderData(
      show: false,
    ),
    gridData: FlGridData(
      show: true,
      horizontalInterval: 1.6,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          dashArray: const [3, 3],
          // color: const Color(0xff37434d).withOpacity(0.2),
          strokeWidth: 2,
        );
      },
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 3),
          FlSpot(2.4, 2),
          FlSpot(4.4, 3),
          FlSpot(6.4, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 4),
          FlSpot(11, 5),
        ],

        isCurved: true,
        // colors: gradientColors,
        barWidth: 2,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ],
  );
}
