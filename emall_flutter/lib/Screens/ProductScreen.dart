import 'package:emall_proj/Components/Product/ProductPanal.dart';
import 'package:flutter/cupertino.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductPanal(
      productId: "1",
    );
  }
}
