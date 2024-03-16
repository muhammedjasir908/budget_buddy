import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColor = [
    Colors.cyan,
    Colors.blue
  ];
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
            aspectRatio: 1.70,
          child: Padding(
              padding: EdgeInsets.only(right: 18,left: 12,top: 24,bottom: 12),
            child: LineChart(showAvg ? avgData() : mainData())
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(onPressed: () {
            setState(() {
              showAvg = !showAvg;
            });
          }, child: Text('avg', style: GoogleFonts.poppins(
            fontSize: 12,
            color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white
          ),)),
        )
      ],
    );
  }

  Widget bottomTitleWidget(double value,TitleMeta meta){
     final style = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 16
    );

    Widget text;
    switch(value.toInt()){
      case 2:
        text =  Text('MAR',style: style,);
        break;
      case 5:
        text =  Text('JUN',style: style,);
        break;
      case 8:
        text =  Text('SEP',style: style,);
        break;
      default:
        text =  Text('',style: style,);
        break;
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget leftTitleWidget(double value,TitleMeta meta){
    final style = GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 16
    );
    String text;
    switch(value.toInt()){
      case 1:
        text =  '10K';
        break;
      case 3:
        text =  '30K';
        break;
      case 5:
        text =  '50K';
        break;
      default:
        return Container();
    }
    return Text(text, style: style,textAlign: TextAlign.left,);
  }

  LineChartData mainData(){
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value){
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        }
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidget,
          )
        )
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.green),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColor),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(colors: gradientColor.map((e) => e.withOpacity(0.3)).toList())
          )
        )
      ]
    );
  }

  LineChartData avgData(){
    return LineChartData(
      lineTouchData: LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value){
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value){
          return const FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
    }
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidget,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidget,
            reservedSize: 42,
            interval: 1
          )
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.green)
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44)
          ],
          isCurved: true,
          gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColor[0],end: gradientColor[1]).lerp(0.2)!,
                ColorTween(begin: gradientColor[0], end: gradientColor[1]).lerp(0.2)!
              ]
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false
          ),
          belowBarData: BarAreaData(
            show:  true,
            gradient: LinearGradient(
                colors: [
                  ColorTween(begin: gradientColor[0],end: gradientColor[1]).lerp(0.2)!.withOpacity(0.1),
                  ColorTween(begin: gradientColor[0],end: gradientColor[1]).lerp(0.2)!.withOpacity(0.1)
                ]
            )
          )
        )
      ]
    );
  }
}
