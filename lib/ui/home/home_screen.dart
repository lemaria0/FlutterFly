import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                "assets/logo/avatar_placeholder_img.png",
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Letícia Maria Eufrásio Reis",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              print("Funcionando");
            },
            icon: SvgPicture.asset("assets/logo/logout.svg"),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 25.0, vertical: 25),
          child: Column(
            children: [
              SizedBox(height: 115),

              Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Pronto pra voar com Flutterfly?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Teste seus conhecimentos e descubra até\n onde você vai chegar!",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 65),
                    ],
                  ),

                  SvgPicture.asset(
                    "assets/images/undraw_questions.svg",
                    width: 285,
                    height: 200,
                  ),
                  SizedBox(height: 65),

                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF02539A),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF02539A),
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print('Está funcionando');
                      },
                      label: Text(
                        'Iniciar Quiz',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3BBEEE),
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        shadowColor: Color(0xFF02539A),
                      ),
                    ),
                  ),
                ],
              ),

              Spacer(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        print("Está ok");
                      },
                      icon: SvgPicture.asset("assets/logo/home.svg"),
                    ),
                    IconButton(
                      onPressed: () {
                        print("Está ok");
                      },
                      icon: SvgPicture.asset("assets/logo/trophy.svg"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
