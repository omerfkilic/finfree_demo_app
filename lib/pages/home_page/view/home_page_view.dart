import 'package:finfree_demo_app/core/models/sales_data_model.dart';
import 'package:finfree_demo_app/pages/home_page/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
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
        child: const Icon(Icons.refresh),
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
                          name: 'Akbank',
                          dataSource: viewModel.getSalesData(),
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //Burada 6 adet Elevated button oluşturuluyor
                    //hangisine basılırsa grafiği o aralığa göre ayarlıyor
                    children: ['1G', '1H', '1A', '3A', '1Y', '5Y']
                        .map((e) => SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      viewModel.priceEntryRange = e;
                                      viewModel.getSalesData();
                                    });
                                  },
                                  child: Text(e)),
                            ))
                        .toList(),
                  )
                ],
              ),
      ),
    );
  }
}
