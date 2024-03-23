import 'package:flutter/material.dart';
import 'package:profitei_flutter/core/constant/images.dart';

class RaffleDetailsView extends StatelessWidget {
  const RaffleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageWidget(), // Extracted as a separate widget for the image.
            PriceInfoWidget(), // Extracted as a separate widget for price information.
            SelectNamesSection(), // Extracted as a separate widget for name selection.
            StatsInfo(), // Extracted as a separate widget for statistics information.
            ReviewOrderButton(), // Extracted as a separate widget for the review order button.
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace 'assets/images/Butterfly1.png' with your actual image asset.
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Image.asset(kButterfly, fit: BoxFit.fitWidth),
    );
  }
}

class PriceInfoWidget extends StatelessWidget {
  const PriceInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ColorIndicator(color: Colors.blue),
          ColorIndicator(color: Colors.green),
          ColorIndicator(color: Colors.yellow),
          ColorIndicator(color: Colors.orange),
          ColorIndicator(color: Colors.red),
          const PriceTag(),
        ],
      ),
    );
  }
}

class ColorIndicator extends StatelessWidget {
  final Color color;

  ColorIndicator({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      color: color,
    );
  }
}

class PriceTag extends StatelessWidget {
  const PriceTag({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text('R\$100,00', style: TextStyle(fontSize: 20, color: Colors.black)),
        Text('por nome', style: TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}

class SelectNamesSection extends StatelessWidget {
  const SelectNamesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child:
          Text('Selecione seus nomes:', style: TextStyle(color: Colors.black)),
    );
  }
}

class StatsInfo extends StatelessWidget {
  const StatsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // This should ideally be a ListView.builder or similar.
    return Column(
      children: <Widget>[
        StatRow(label: 'Float', value: '0.0798944533'),
        StatRow(label: 'Raridade', value: 'Covert'),
        StatRow(label: 'Padrão', value: '921'),
        StatRow(label: 'Nível Desgaste', value: 'Minimal Wear'),
        StatRow(label: 'Tipo', value: 'StatTrack'),
        StatRow(label: 'Preço Steam', value: 'R\$64.893,32'),
      ],
    );
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final String value;

  StatRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label,
              style: const TextStyle(fontSize: 16, color: Colors.deepPurple)),
          Text(value, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

class ReviewOrderButton extends StatelessWidget {
  const ReviewOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple, // foreground
      ),
      onPressed: () {
        // Action to review order
      },
      child: const Text('Revisar Pedido (2xR\$100,00)'),
    );
  }
}
