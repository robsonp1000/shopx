import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ShopX/common/product_card.dart';
import 'package:ShopX/data_models/product.dart';

class HotProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of(context);
    return ProductCard(
      width: 255,
      height: 175,
      color: Color(product.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(width: 80, child: HotProductInfo()),
          Container(
            width: 160,
            height: 140,
            alignment: Alignment.centerLeft,
            child: Hero(
              tag: product.uid,
              child: Image.network(
                product.defaultPhoto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotProductInfo extends StatelessWidget {
  Color textColor(Product product) {
    switch (product.backgroundColor) {
      case 0xFF4769F4:
      case 0xFFA26FFF:
        return Colors.white;
        break;
      case 0xFFFFFFFF:
        return Color(0xFFA26FFF);
        break;
      default:
        return Colors.white;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: 100,
          padding: const EdgeInsets.only(top: 8, left: 12),
          child: Text(
            product.name,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textColor(product),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 12),
          height: 30,
          child: Text(
            "\$" + product.price.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: textColor(product).withAlpha(200),
            ),
          ),
        )
      ],
    );
  }
}
