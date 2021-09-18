import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/data/in_memory_products.dart';
import 'package:food_app/theming_and_state_managment/domain/model/product.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';
import 'package:food_app/theming_and_state_managment/presentation/widgets/delivery_button.dart';

class CartScreen extends StatelessWidget {

  final VoidCallback onShopping;

  const CartScreen({Key? key, required this.onShopping}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      // body: _EmptyCart(onShopping: onShopping,),
      body: _FullCart(),
    );
  }
}


class _FullCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 230,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
              return _ShoppingCartProduct(
                product: product,
              );
             },
            ),
          ),  
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Theme.of(context).canvasColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            Text(
                              '0.0 usd',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Text(
                              'Free',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$85.00',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  Spacer(),
                  DeliveryButton(
                    ontap: () {}, 
                    text: 'Checkout',
                  ),
                ],
              ),
            ),
          ),  
        ),
      ],
    );
  }
}


class _ShoppingCartProduct extends StatelessWidget {
  const _ShoppingCartProduct({Key? key, required this.product}) : super(key: key);
  final Product product;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name),
                        const SizedBox(height: 10,),
                        Text(
                          product.description,
                          style: Theme.of(context).textTheme.overline!.copyWith(
                            color: DeliveryColors.lightGrey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DeliveryColors.white,
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: DeliveryColors.purple,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('2'),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: DeliveryColors.purple,
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: DeliveryColors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text('\$${product.price}', 
                                style: TextStyle(
                                  color: DeliveryColors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: DeliveryColors.pink,
                child: Icon(Icons.delete_outline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _EmptyCart extends StatelessWidget {

  final VoidCallback onShopping;

  const _EmptyCart({Key? key, required this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/delivery/sad.png',
          height: 90,
          color: DeliveryColors.green,
        ),
        const SizedBox(height: 20,),
        Text(
          'There are no products',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        const SizedBox(height: 20,),
        Center(
          child: InkWell(
            onTap: onShopping,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: DeliveryColors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Go Shopping',
                  style: TextStyle(color: DeliveryColors.white),
                  
                ),
              ),
              ),
          ),
        ),
        
      ],
    );
  }
}