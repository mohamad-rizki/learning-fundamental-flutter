import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_bloc/product.dart';
import 'package:listview_bloc/product_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder BLoC"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              var random = Random();
              context.read<ProductBloc>().add(random.nextInt(4) + 2);
            },
            child: Text("Generate"),
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, data) {
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(data[index].imageUrl),
                          ),
                          Text(data[index].price.toString()),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
