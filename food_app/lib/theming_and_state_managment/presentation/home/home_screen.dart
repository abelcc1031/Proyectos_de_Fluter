import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/presentation/home/cart/cart_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/home/products/products_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/home/profile/profile_screen.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(height: 60,),
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                ProductScreen(),
                Text('currentIndex2: $currentIndex'),
                CartScreen(
                  onShopping: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                Text('currentIndex4: $currentIndex'),
                ProfileScreen(),
              ],
            ) 
          ),
          _DeliveryNavigator(
            index: currentIndex,
            onIndexSelected: (index ) {
                setState(() {
                  currentIndex = index;
                });
              }
          ),

        ],
      ),
    );
  }
}



class _DeliveryNavigator extends StatelessWidget {

  final int index;
  final ValueChanged<int> onIndexSelected;

  const _DeliveryNavigator({Key? key, required this.index, required this.onIndexSelected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(0), 
                  icon: Icon(
                    Icons.home,
                    color: index == 0 ? DeliveryColors.green : DeliveryColors.lightGrey,
                  ),
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(1), 
                  icon: Icon(
                    Icons.store,
                    color: index == 1 ? DeliveryColors.green : DeliveryColors.lightGrey,
                  ),
                ),
              ),
              Material(
                child: CircleAvatar(
                  backgroundColor: DeliveryColors.purple,
                  radius: 23,
                  child: IconButton(
                    onPressed: () => onIndexSelected(2), 
                    icon: Icon(
                      Icons.shopping_basket,
                      color: index == 2 ? DeliveryColors.green : DeliveryColors.white,
                    ),
                  ),
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(3), 
                  icon: Icon(
                    Icons.favorite_border,
                    color: index == 3? DeliveryColors.green : DeliveryColors.lightGrey,
                  ),
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/delivery/logo_delivery.png'),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}