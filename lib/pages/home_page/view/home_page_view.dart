import 'package:finfree_demo_app/core/models/price_model.dart';
import 'package:finfree_demo_app/core/models/sales_data_model.dart';
import 'package:finfree_demo_app/core/services/finfree_api/finfree_api.dart';
import 'package:finfree_demo_app/pages/home_page/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageViewModel viewModel;
  @override
  void initState() {
    // TODO: implement initState
    viewModel = HomePageViewModel.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akbank'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.get_app_sharp),
        onPressed: () async {
          await viewModel.getData();
          setState(() {});
        },
      ),
      body: Center(
        child: viewModel.priceModel == null
            ? const Text('Lütfen Refreshe Basınız!')
            : Column(
                children: [
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Akbank'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          dataSource: viewModel.getSalesData(),
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          // Enable data label
                          dataLabelSettings:
                              DataLabelSettings(isVisible: true)),
                    ],
                  ),
                  Row()
                ],
              ),
      ),
    );
  }
}
