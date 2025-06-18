import 'package:flutter_viz/adminDashboard/model/dashBoard_model.dart';
import 'package:flutter/material.dart';

import 'bar_chart_graph.dart';

// ignore: must_be_immutable
class ChartComponent extends StatefulWidget {
  List<UserWeekReport>? userWeekReport = [];

  ChartComponent({this.userWeekReport});

  @override
  _ChartComponentState createState() => _ChartComponentState();
}

class _ChartComponentState extends State<ChartComponent> {
  final List<UserWeekReport> data = [
    UserWeekReport(date: "Sun"),
    UserWeekReport(date: "Mon"),
    UserWeekReport(date: "Tue"),
    UserWeekReport(date: "Wed"),
    UserWeekReport(date: "Thu"),
    UserWeekReport(date: "Fri"),
    UserWeekReport(date: "Sat"),
  ];

  @override
  Widget build(BuildContext context) {
    return BarChartGraph(data: data);
  }
}
