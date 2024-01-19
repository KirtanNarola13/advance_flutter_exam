import 'dart:convert';
import 'dart:developer';

import 'package:advance_flutter_exam/Moduls/Model/ApiModel/api_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();

  //Fetch Data
  Future<List<ApiModel>?> FetchData() async {
    String apiEndPoint =
        "https://restcountries.com/v3.1/all?_gl=1*1iaqknf*_ga*MTAzNzQ0MDk5LjE3MDU2NDYwMTQ.*_ga_ZCYG64C7PL*MTcwNTY0NjAxNC4xLjEuMTcwNTY0NjEwNy4wLjAuMA";
    http.Response response = await http.get(Uri.parse(apiEndPoint));
    //
    log("${response.statusCode}");
    //
    if (response.statusCode == 200) {
      List decodedData = jsonDecode(response.body);
      List<ApiModel> apiModel = decodedData.map((e) {
        log("Data male che");
        return ApiModel.fromApi(data: e);
      }).toList();
      return apiModel;
    } else {
      return null;
    }
  }
}
