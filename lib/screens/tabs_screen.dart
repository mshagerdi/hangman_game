import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  static const routeName = '/tabs_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('H A N G 𓍯 M A N'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // LoginCard(),
              // SignupCard(),
            ],
          ),
        ),
      ),
    );
  }
}
