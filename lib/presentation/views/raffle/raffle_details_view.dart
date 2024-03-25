import 'package:flutter/material.dart';
import 'package:profitei_flutter/core/constant/images.dart';

class RaffleDetailsView extends StatelessWidget {
  const RaffleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ST | Butterfly Knife | MW')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
                  Image.asset(kButterfly), // Substitua com a URL da sua imagem
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text('R\$100,00',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Text('por rifa',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  CustomIndicatorWithArrow(
                      arrowPositionPercentage:
                          2), // Widget para o indicador com seta// Widget para a barra de indicadores de cores
                  SizedBox(height: 24),
                  StatsList(), // Widget para a lista de estatísticas
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Selecione suas rifas:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
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
        Text(label,
            style:
                TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
        const Spacer(),
        Text(value,
            style: TextStyle(fontSize: 16, color: Theme.of(context).hintColor)),
      ],
    );
  }
}

class NamesList extends StatelessWidget {
  const NamesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap:
          true, // Continua a permitir que o ListView seja ajustado ao tamanho dos seus filhos.
      physics:
          const NeverScrollableScrollPhysics(), // Desativa a rolagem dentro deste ListView específico.
      children: const [
        NameItem(name: 'Fallen'),
        NameItem(name: 'Yurih'),
        NameItem(name: 'Donk'),
        // Adicione mais NameItem conforme necessário
      ],
    );
  }
}

class NameItem extends StatefulWidget {
  final String name;

  const NameItem({super.key, required this.name});

  @override
  State<StatefulWidget> createState() => _NameItemState();
}

class _NameItemState extends State<NameItem> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(widget.name, style: const TextStyle(fontSize: 18)),
          trailing: Icon(
            _isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: Colors.purple,
          ),
          onTap: _toggleSelection,
        ),
        const Divider(),
      ],
    );
  }
}

class CustomIndicatorWithArrow extends StatelessWidget {
  // Valor que representa a posição da seta, de 0 (início) a 100 (fim)
  final double arrowPositionPercentage;

  const CustomIndicatorWithArrow(
      {super.key, required this.arrowPositionPercentage});

  @override
  Widget build(BuildContext context) {
    // Garante que o valor de porcentagem esteja entre 0 e 100
    final clampedPercentage = arrowPositionPercentage.clamp(0, 100) / 100;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          // Container para o indicador de cores
          margin: const EdgeInsets.only(
              top: 15), // Espaço para a seta apontar para o indicador
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 10, // Altura fixa do indicador
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                            ),
                            color: Colors.green[800],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(color: Colors.green[300]),
                      ),
                      Expanded(
                        flex: 23,
                        child: Container(color: Colors.yellow[700]),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(color: Colors.orange[700]),
                      ),
                      Expanded(
                        flex: 55,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10),
                            ),
                            color: Colors.red[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * clampedPercentage -
              10, // Ajusta a posição baseada na porcentagem
          child: const Icon(Icons.arrow_drop_down_sharp,
              size: 20, color: Colors.black), // A seta
        ),
      ],
    );
  }
}
