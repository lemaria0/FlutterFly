import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class RankingScreenResult extends StatefulWidget {
  const RankingScreenResult({super.key});

  @override
  State<RankingScreenResult> createState() => _RankingScreenResultState();
}

class _RankingScreenResultState extends State<RankingScreenResult> {
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
            SvgPicture.asset(
              "assets/logo/flutter-fly-white-logo.svg",
              width: 100,
              height: 100,
            ),
            Text(
              "Parabéns! Você\nconcluiu o quiz!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                letterSpacing: -0.5,
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
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
                  SizedBox(height: 80),
                  Text(
                    "Posição atual:",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  SizedBox(height: 12),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xFF3BBEEE),
                    child: Center(
                      child: Text(
                        "6",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 95,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/logo/fita.svg",
                    width: 100,
                    height: 75,
                  ),
                  SizedBox(height: 18),
                  Text(
                    "XXX pontos",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF02539A),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Color(0xFF02539A), offset: Offset(0, 4)),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('Está funcionando');
                  },
                  label: Text(
                    'Ver Ranking',
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
