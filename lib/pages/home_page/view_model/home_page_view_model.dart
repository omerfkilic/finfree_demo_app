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
  String priceEntryRange = "1G";

  ///Api'den verileri alır ve doğru gelmiş ise gelen verileri priceModel'a çevirir
  Future getData() async {
    Response response = await getDataFromApi();
    //Buradaki statusCode kontrolünü çok vaktim kalmadığı için böyle yazdım şimdilik
    //Eğer veriler gelmez ise ui'da hiç birşey olmuyor
    if (response.statusCode == 200) {
      priceModel = priceModelFromJson(response.body);
    }
  }

  ///Burası priceEntyRange'e göre grafiği yeniliyor
  List<SalesData> getSalesData() {
    switch (priceEntryRange) {
      case '1G':
        return priceModel!.priceEntryof1G!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();

      case '1H':
        return priceModel!.priceEntryof1H!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();
      case '1A':
        return priceModel!.priceEntryof1A!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();
      case '3A':
        return priceModel!.priceEntryof3A!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();
      case '1Y':
        return priceModel!.priceEntryof1Y!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();
      case '5Y':
        return priceModel!.priceEntryof5Y!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();
      default:
        return priceModel!.priceEntryof1G!
            .map((e) => SalesData(
                DateTime.fromMillisecondsSinceEpoch(e.d).toString(), e.c!))
            .toList();
    }
  }
}
