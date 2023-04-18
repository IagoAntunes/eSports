import 'package:flutter/material.dart';

import '../widgets/card_info_widget.dart';
import '../widgets/list_games_ad_widget.dart';
import '../widgets/title_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DropdownMenuItem<String>> listItems = [
    const DropdownMenuItem(
      value: '1',
      child: Text("Ola"),
    ),
    const DropdownMenuItem(
      value: '2',
      child: Text("Ola"),
    ),
    const DropdownMenuItem(
      value: '3',
      child: Text("Ola"),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo.png'),
                const SizedBox(height: 50),
                const TitleHomeWidget(),
                const SizedBox(height: 30),
                ListGamesAdWidget(size: size),
                SizedBox(height: size.height * 0.05),
                CardInfoWidget(size: size, listItems: listItems)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
