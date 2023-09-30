import 'package:dio/dio.dart';
import 'models/prodResp/prodResp.dart';

void main(List<String> arguments) async {
  Dio client = Dio();
  String url = 'http://dummyjson.com/products';

  Response<dynamic> response = await client.get(url);
  
  ProdResp data = ProdResp.fromJson(response.data);

  print(data.total);
}