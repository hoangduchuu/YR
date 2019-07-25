import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../restaurant_item.dart';

class ListShimmerHori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          child: RestaurantItem(
            onClick: () {},
            height: 150,
            width: 250,
            storeName: "",
            storeImage: "",
          ),
        ));
  }
}
