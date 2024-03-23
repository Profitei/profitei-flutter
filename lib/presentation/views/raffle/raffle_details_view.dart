import 'package:flutter/material.dart';
import 'package:profitei_flutter/core/constant/colors.dart';
import 'package:profitei_flutter/core/constant/images.dart';

class RaffleDetailsView extends StatelessWidget {
  const RaffleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ST | Butterfly Knife | MW'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                  kButterfly), // Substitua com a URL da sua imagem
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ColorIndicatorBar(), // Widget para a barra de indicadores de cores
                      Spacer(),
                      Text('R\$100,00',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text('por nome',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 24),
                  StatsList(), // Widget para a lista de estatísticas
                  SizedBox(height: 24),
                  Text('Selecione seus nomes:',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  NamesList(), // Widget para a lista de nomes
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 80,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Cor de fundo do botão
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(18.0), // Bordas arredondadas
                ),
              ),
              onPressed: () {},
              child: const Text('Revisar Pedido (2xR\$100,00)',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorIndicatorBar extends StatelessWidget {
  const ColorIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(color: Colors.blue, width: 20, height: 20),
      Container(color: Colors.red, width: 20, height: 20),
      Container(color: Colors.green, width: 20, height: 20),
      Container(color: Colors.yellow, width: 20, height: 20),
      Container(color: Colors.orange, width: 20, height: 20),
    ]);
  }
}

class StatsList extends StatelessWidget {
  const StatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StatItem(label: 'Float', value: '0.0798944533'),
        StatItem(label: 'Raridade', value: 'Covert'),
        StatItem(label: 'Padrão', value: '921'),
        // Adicione mais StatItem conforme necessário
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;

  const StatItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.purple)),
        const Spacer(),
        Text(value, style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}

class NamesList extends StatelessWidget {
  const NamesList({super.key});

  @override
  Widget build(BuildContext context) {
    // Aqui você pode substituir por um ListView.builder para dados dinâmicos
    return const Column(
      children: [
        NameItem(name: 'Fallen'),
        NameItem(name: 'Yurih'),
        NameItem(name: 'Donk'),
        // Adicione mais NameItem conforme necessário
      ],
    );
  }
}

class NameItem extends StatelessWidget {
  final String name;

  const NameItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.check_circle, color: Colors.purple),
      onTap: () {
        // Adicione a ação de seleção aqui
      },
    );
  }
}
