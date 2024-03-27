import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profitei_flutter/domain/entities/raffle/property.dart';
import 'package:profitei_flutter/domain/entities/raffle/ticket.dart';
import 'package:profitei_flutter/presentation/blocs/raffle/raffle_cubit.dart';

class RaffleDetailsView extends StatelessWidget {
  const RaffleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RaffleCubit>().getRaffle(1);
    return Scaffold(
      appBar: AppBar(title: const Text('ST | Butterfly Knife | MW')),
      body: BlocBuilder<RaffleCubit, RaffleState>(
        builder: (context, state) {
          if (state is RaffleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RaffleSuccess) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(state
                        .raffle!.image), // Substitua com a URL da sua imagem
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              // Aqui vamos formatar o preço corretamente
                              'R\$${state.raffle!.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            const Text('por rifa',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                        const CustomIndicatorWithArrow(
                            arrowPositionPercentage:
                                2), // Widget para o indicador com seta// Widget para a barra de indicadores de cores
                        const SizedBox(height: 24),
                        StatsList(
                            properties: state.raffle!
                                .properties), // Passa as propriedades da rifa
                        const SizedBox(height: 24),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Selecione suas rifas:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 16),
                        NamesList(
                            tickets: state.raffle!
                                .tickets), // Widget para a lista de nomes
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Erro ao carregar o sorteio'));
          }
        },
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
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: const Center());
                  },
                );
              },
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
  final List<Property> properties;

  // O construtor agora exige uma lista de Property.
  const StatsList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: properties
          .map((property) =>
              StatItem(label: property.name, value: property.value.toString()))
          .toList(),
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
  final List<Ticket> tickets;
  const NamesList({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap:
          true, // Continua a permitir que o ListView seja ajustado ao tamanho dos seus filhos.
      physics:
          const NeverScrollableScrollPhysics(), // Desativa a rolagem dentro deste ListView específico.
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        return NameItem(name: tickets[index].name);
      },
      separatorBuilder: (context, index) => const Divider(),
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
