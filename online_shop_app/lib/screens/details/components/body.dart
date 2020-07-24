import 'package:flutter/material.dart';
import 'package:online_shop_app/constants.dart';
import 'package:online_shop_app/models/Product.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({
    Key key, this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft : Radius.circular(24),
                      topRight: Radius.circular(24)
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Aristocratic Hand Bag',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        product.title,
                        style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold
                              ),
                      ),
                      Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: 'Price\n'),
                                TextSpan(
                                  text: '\$${product.price}',
                                  style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                        )
                                )
                              ]
                            )
                          ),
                          SizedBox(width: kDefaultPaddin,),
                          Expanded(
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}