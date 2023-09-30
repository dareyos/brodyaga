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
  String textResult = 'Техника $brand:';
  List<String> brandList = ['OPPO'];

  for (var name in brandList) {
    textResult += '$name:';
  }
  // for (Product element in productsMassive) {
  //   if (element.brand == "Apple"){
  //     resultMassive.add(element);
  //   }
  // }
  resultMassive = productMassive.where((el)=> el.brand == "Apple").toList();
  for (var element in resultMassive) {
    textResult += '\n${element.title} за \$${element.price}';
  }
  
  print(textResult);
}

bool filterCondition(Product product) {
  return product.brand == "Apple";
}
