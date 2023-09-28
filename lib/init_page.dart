import 'package:animated_menu/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:animated_menu/page.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationMoveFirstComponent;
  late Animation animationRotateFirstComponent;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 340));
    animationMoveFirstComponent =
        Tween<double>(begin: 0, end: 600).animate(animationController);
    animationRotateFirstComponent =
        Tween<double>(begin: 0, end: 40).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff222427),
            width: screenWidth(context),
            height: screenHeigth(context),
            padding: const EdgeInsets.all(40),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xffF5F5F8),
                          radius: 35,
                          child: FlutterLogo(
                            size: 55,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              animationController.reverse();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    item(icon: Icons.home, text: "Home"),
                    item(icon: Icons.notifications, text: "Notification"),
                    item(icon: Icons.person, text: "Profile"),
                    item(icon: Icons.messenger_sharp, text: "Messange"),
                    item(icon: Icons.help, text: "Ajuda"),
                    item(icon: Icons.info, text: "Quem somos?"),
                    item(icon: Icons.logout, text: "Log out"),
                  ]),
            ),
          ),
          AnimatedBuilder(
            animation: animationRotateFirstComponent,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: screenWidth(context),
                height: screenHeigth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color:  const Color(0xff515152),
                ),
              ),
            ),
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2,
                      0.001) // Ajuste de perspectiva para manter o componente visível
                  ..rotateX(
                      (animationRotateFirstComponent.value * .3).clamp(0, 90) *
                          math.pi /
                          80)
                  ..translate(0.0, animationMoveFirstComponent.value - 30),
                alignment: Alignment.center,
                child: child,
              );
            },
          ),
          AnimatedBuilder(
            animation: animationRotateFirstComponent,
            child:  MyPage(function: (){
              setState(() {
                animationController.forward();
              });
            }),
            
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2,
                      0.001) // Ajuste de perspectiva para manter o componente visível
                  ..rotateX(
                      (animationRotateFirstComponent.value * .3).clamp(0, 90) *
                          math.pi /
                          80)
                  ..translate(0.0, animationMoveFirstComponent.value),
                alignment: Alignment.center,
                child: child,
              );
            },
          )
        ],
      ),
    );
  }


  item({required IconData icon, required String text}) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              animationController.reverse();
            },
            icon: Icon(
              icon,
              color: Colors.white,
              size: 20,
            )),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }
}
