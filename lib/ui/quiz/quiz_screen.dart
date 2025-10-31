import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? opcaoSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3BBEEE),

      appBar: AppBar(
        backgroundColor: Color(0xFF3BBEEE),
        toolbarHeight: 100,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/logo/arrowBack.svg"),
          onPressed: () {
            print("está ok");
          },
        ),
        title: Text(
          'Quiz',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: 38,
              height: 38,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pergunta 1 de 10',
                style: TextStyle(
                  color: Color(0xFF3BBEEE),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi orci nunc, sagittis in magna eu, maximus sagittis turpis.',
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
              SizedBox(height: 24),
              ...['Item A', 'Item B', 'Item C', 'Item D'].map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() => opcaoSelecionada = item);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: opcaoSelecionada == item
                              ? Color(0xFF3BBEEE)
                              : Color(0xFFE0E0E0),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: opcaoSelecionada == item
                                    ? Color(0xFF3BBEEE)
                                    : Color(0xFFE0E0E0),
                                width: 2,
                              ),
                            ),
                            width: 22,
                            height: 22,
                            child: opcaoSelecionada == item
                                ? SvgPicture.asset('assets/logo/check.svg')
                                : null,
                          ),

                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Spacer(),

              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: opcaoSelecionada != null
                          ? Color(0xFF02539A)
                          : Color(0xFFA9A9A9),
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    print('Enviar confirmacao');
                  },
                  label: Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: opcaoSelecionada != null
                          ? Colors.white
                          : Color(0xFFA9A9A9),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: opcaoSelecionada != null
                        ? Color(0xFF3BBEEE)
                        : Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    shadowColor: opcaoSelecionada != null
                        ? Color(0xFF02539A)
                        : Color(0xFFA9A9A9),
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
