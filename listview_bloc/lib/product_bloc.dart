import 'package:bloc/bloc.dart';
import 'package:listview_bloc/product.dart';

class ProductBloc extends Bloc<int, List<Product>> {
  ProductBloc() : super([]);

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> productList = [];
    for (int i = 0; i < event; i++) {
      productList.add(
          Product(
              "https://miro.medium.com/max/250/1*rd_veZDE2LL02Ov9uxfsRg.png",
              "Flutter",
              (i + 1) * 5000
          )
      );
    }
    yield productList;
  }
}
