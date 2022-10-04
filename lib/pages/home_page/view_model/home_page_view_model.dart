import 'package:finfree_demo_app/core/models/price_model.dart';
import 'package:finfree_demo_app/core/models/sales_data_model.dart';
import 'package:finfree_demo_app/core/services/finfree_api/finfree_api.dart';
import 'package:http/http.dart';

class HomePageViewModel {
  static HomePageViewModel? _instance = HomePageViewModel._init();
  static HomePageViewModel get instance =>
      _instance ?? HomePageViewModel._init();
  HomePageViewModel._init();

  PriceModel? priceModel;

  Future<int?> getData() async {
    Response response = await getDataFromApi();

    if (response.statusCode == 200) {
      priceModel = priceModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
    return null;
  }

  List<SalesData> getSalesData() {
    return priceModel!.priceEntryof1G!
        .map((e) => SalesData(
            DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
        .toList();
  }
}
