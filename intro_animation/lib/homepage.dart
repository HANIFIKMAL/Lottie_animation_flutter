import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState(){
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this
      );
    _controller.repeat();
  }

  @override
  void dispose(){
    super.dispose();

    _controller.dispose();
  }
  
  bool wallet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [ 
          Center(
           child: Lottie.asset("images/error404.json"),
          ),
          Center(
            child: GestureDetector(
              onTap: (){
                if (wallet == false){
                  wallet = true;
                  _controller.forward();
                }
                else{
                  wallet = false;
                  _controller.reverse();
                }
              },
              child: Lottie.asset(
                "images/wallet.json",
                repeat: true,
                controller: _controller,
                onLoaded: (composition){
                  _controller.duration = composition.duration;
                }
                )
            ),
          )
        ]
        ),
      );
  }
}