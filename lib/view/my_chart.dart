import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/modell/fivedays.dart';

import '../controll/homecontroller.dart';


class MyChart extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<FiveDays, String>>[
            SplineSeries<FiveDays, String>(
              dataSource: controller.fiveday,
              xValueMapper: (FiveDays f, _) =>
              f.dateTime,
              yValueMapper: (FiveDays f, _) =>
              f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
