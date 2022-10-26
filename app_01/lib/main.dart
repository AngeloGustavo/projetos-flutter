import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home()
    )      
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int esfihaContador = 0;
  String titulo = "Bucho vazio :(";

  void altereTitulo(int delta){
    setState(() {
      esfihaContador += delta;
      if (esfihaContador >= 5) {
        titulo = "Bucho lotado :))";
        esfihaContador = 5;
      }else{
        if(esfihaContador <= 0) {
          esfihaContador = 0;
          titulo = "Bucho vazio :(";
        }else {
          titulo = "$esfihaContador esfihas";
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador para rodízio de Esfihas'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: <Widget>[
          Image.network(
           "https://www.fonewalls.com/wp-content/uploads/2019/12/Plain-Red-Wallpaper-300x585.png",
           fit: BoxFit.fitWidth,
           height: 1000.0, 
           width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextButton(
                child: Image.network('https://i.pinimg.com/originals/48/0f/73/480f736ffe3ff2e42c3dba1f1f70d8b1.png',
                height: 150,),
                onPressed: () {  
                  altereTitulo(1);
                },
              ),
              TextButton(
                child: const Text(
                  "-1",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white
                  ),
                ),
                onPressed: () {  
                  altereTitulo(-1);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
