import 'package:animated_menu/utils.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key, required this.function});

  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
       width: screenWidth(context),
              height: screenHeigth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xffF5F5F8),
              ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 5),
            child: Row(
              children: [
                const Text(
                  "Seu conteudo aqui",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                     function();
                    },
                    icon: const Icon(Icons.menu))
              ],
            ),
          ),
        ],
      ),
    );
  
  }
}