import 'package:dio/dio.dart';
import 'models/prodResp/prodResp.dart';
import 'models/product/product.dart';

void main(List<String> arguments) async {
  Dio client = Dio();
  String url = 'http://dummyjson.com/products';

  Response<dynamic> response = await client.get(url);
  ProdResp data = ProdResp.fromJson(response.data);
 
  List<Product> productsMassive = data.products;
  List<Product> resultMassive = [];
  String textResult = '';
  for (Product element in productsMassive) {
    if (element.brand == "Apple"){
      resultMassive.add(element);
    }
  }
  resultMassive = productMassive.where((el)=> el.brand == "Apple").toList();

  // int count = 0;
  // for (var element in data.products) {
  //   if (element.brand == "Apple") {
  //     count++;
  //   }
  // }
  
  //print(count);

}

bool filterCondition(Product product) {
  return product.brand == "Apple";
}
