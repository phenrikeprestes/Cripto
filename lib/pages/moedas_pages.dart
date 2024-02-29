import 'package:flutter/material.dart';
import 'package:cripto/models/moeda.dart';
import 'package:cripto/pages/moedas_detalhes_page.dart';
import 'package:cripto/repositories/moeda.repository.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

final tabela = MoedaRepository.tabela;

NumberFormat euro = NumberFormat.currency(locale: 'fr_FR', name: '€');
List<Moeda> selecionadas = [];

/*appBarDynamic() {


  if (selecionadas.isEmpty) {
    return AppBar(
      centerTitle: true,
      title: Text('Cripto Coins'),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
    );
  } else {
    return AppBar(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      leading: ElevatedButton(
        onPressed: () {
          
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}*/

class _MoedasPageState extends State<MoedasPage> {


  showDetails(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text('Cripto Coins'),
            Text(
              '${selecionadas.length} selected',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                leading: SizedBox(
                  width: 40,
                  child: Image.asset(
                    tabela[moeda].icone,
                  ),
                ),
                title: Text(
                  tabela[moeda].nome,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(euro.format(tabela[moeda].preco)),
                selected: selecionadas.contains(tabela[moeda]),
                selectedTileColor: Colors.indigo[100],
                onLongPress: () {
                  setState(() {
                    (selecionadas.contains(tabela[moeda]))
                        ? selecionadas.remove(tabela[moeda])
                        : selecionadas.add(tabela[moeda]);
                  });
                },
                onTap: () {
                  showDetails(tabela[moeda]);
                });
          },
          padding: EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: tabela.length),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.star),
              label: const Text(
                'Favorite',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ))
          : null,
    );
  }
}
