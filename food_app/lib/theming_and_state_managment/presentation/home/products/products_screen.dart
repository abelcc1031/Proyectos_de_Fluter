import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/data/in_memory_products.dart';
import 'package:food_app/theming_and_state_managment/domain/model/product.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';
import 'package:food_app/theming_and_state_managment/presentation/widgets/delivery_button.dart';


class ProductScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _ItemProduct(
            product: product,
          );
        }
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct({Key? key, required this.product}) : super(key: key);
  final Product product;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
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
            Expanded(
              child: Column(
                children: [
                  Text(product.name),
                  const SizedBox(height: 6,),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.overline!.copyWith(
                      color: DeliveryColors.lightGrey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6,),
                  Text('\$${product.price} USD', 
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            DeliveryButton(
              padding: EdgeInsets.symmetric(vertical: 4),
              text: 'Add',
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}