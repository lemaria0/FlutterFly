import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class RankingScreenEmpty extends StatefulWidget {
  const RankingScreenEmpty({super.key});

  @override
  State<RankingScreenEmpty> createState() => _RankingScreenEmptyState();
}

class _RankingScreenEmptyState extends State<RankingScreenEmpty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3BBEEE),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BBEEE),
        toolbarHeight: 280,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Sua posição atual:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 110,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Responda para descobrir!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsetsGeometry.only(right: 25),
              child: IconButton(
                onPressed: () {
                  print("atualizando...");
                },
                icon: SvgPicture.asset(
                  "assets/logo/refresh.svg",
                  width: 28,
                  height: 28,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 100),
                  SvgPicture.asset(
                    "assets/logo/time.svg",
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Parece que ninguém respondeu ao quiz ainda...\n Seja o primeiro a entrar no nosso ranking!",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 75),
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
                      icon: SvgPicture.asset("assets/logo/homeGrey.svg"),
                    ),
                    IconButton(
                      onPressed: () {
                        print("Está ok");
                      },
                      icon: SvgPicture.asset("assets/logo/trophyBlue.svg"),
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
