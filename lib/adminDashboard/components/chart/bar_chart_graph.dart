import 'package:flutter_viz/adminDashboard/model/dashBoard_model.dart';
import 'package:flutter_viz/utils/AppWidget.dart';
import 'package:flutter_viz/widgetsProperty/comman_property_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BarChartGraph extends StatefulWidget {
  static String tag = '/BarChartGraph';
  final List<UserWeekReport>? data;

  const BarChartGraph({Key? key, this.data}) : super(key: key);

  @override
  BarChartGraphState createState() => BarChartGraphState();
}

class BarChartGraphState extends State<BarChartGraph> {
  List<UserWeekReport>? _barChartList;

  @override
  void initState() {
    super.initState();
    _barChartList = [
      UserWeekReport(title: "Register User Count"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    /// Build FL Chart bar-groups from your data
    final barGroups = <BarChartGroupData>[
      for (int i = 0; i < (widget.data?.length ?? 0); i++)
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: (widget.data![i].total ?? 0).toDouble(),
              width: 20,
              color: const Color(0xFF3a57e8),
              borderRadius: BorderRadius.zero,
            ),
          ],
        ),
    ];

    /// Build FL Chart widget
    final flBarChart = BarChart(
      BarChartData(
        barGroups: barGroups,
        barTouchData: BarTouchData(enabled: false),
        alignment: BarChartAlignment.spaceAround,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(),
          leftTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                if (index < 0 || index >= widget.data!.length) return const SizedBox.shrink();
                final abbr = widget.data![index].day!.trim().split("").map((e) => e[0]).take(3).join();
                return Text(abbr, style: secondaryTextStyle(size: 12));
              },
            ),
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
    );

    return _buildFinancialList(flBarChart);
  }

  /// Keeps the original ListView / card UI untouched
  Widget _buildFinancialList(Widget chart) => _barChartList != null
      ? ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const Divider(color: Colors.white, height: 5),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _barChartList!.length,
          itemBuilder: (_, index) => Container(
            height: context.height() / 2.7,
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: context.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(COMMON_CARD_BORDER_RADIUS),
              boxShadow: [commonCardBoxShadow()],
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(_barChartList![index].title!, style: boldTextStyle(size: 18)),
                chart.expand(),
              ],
            ),
          ),
        )
      : const SizedBox();
}
