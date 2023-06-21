import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testwork/cell_model.dart';

final class NetworkService {
  String seed = "10813_0c0a9a2f86eab09196705a274378b64a";
  String apiVersion = "v1";
  String domen = "nastintesthodl";
  int numberOfSalesFunnel = 1843;
  String sortKey = "OFFER_ID";

  Future<List<CellModel>> getHttpWithLimit(int limit) async {
    List<CellModel> cellsModels = [];
    try {
      var response = await http.get(Uri.parse(
        "https://$domen.stocrm.ru/api/external/$apiVersion/offers/get_from_filter?SID=$seed&FILTER[BOARD_ID]=$numberOfSalesFunnel&LIMIT=$limit&SORT[$sortKey]=ASC",
      ));
      var dataArray = jsonDecode(response.body)["RESPONSE"]["DATA"];
      for (int i = 0; i < limit; ++i) {
        cellsModels.add(CellModel.fromJson(dataArray[i]));
      }
      return cellsModels;
    } catch (exception) {
      print("$exception");
    }
    return cellsModels;
  }
}
