import 'package:flutter/material.dart';
import 'package:food_app/theming_and_state_managment/presentation/theme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: DeliveryColors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/delivery/logo_delivery.png'),
                    radius: 50,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Card(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text('email@email.com'),
                          Row(
                            children: [
                              Text('Dark Mode'),
                              Spacer(),
                              Switch(
                                value: true,
                                onChanged: (val) {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: DeliveryColors.purple,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 8),
                        child: Text(
                          'Log Out',
                          style: TextStyle(color: DeliveryColors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
