import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../models/moeda.dart';

// ignore: must_be_immutable
class MoedasDetalhesPage extends StatefulWidget {
  Moeda moeda;
  MoedasDetalhesPage({Key? key, required this.moeda}) : super(key: key);

  @override
  State<MoedasDetalhesPage> createState() => _MoedasDetalhesPageState();
}

class _MoedasDetalhesPageState extends State<MoedasDetalhesPage> {
  NumberFormat euro = NumberFormat.currency(locale: 'fr_FR', name: '€');
  //Faz chave aleatória para o _form.
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

  double quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text(widget.moeda.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Image.asset(widget.moeda.icone),
                  ),
                  Container(width: 10),
                  Text(
                    euro.format(widget.moeda.preco),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Text(
                  '$quantity ${widget.moeda.sigla}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 24),
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.teal.withOpacity(0.05)),
              ),
            ),
            Form(
              //Chave aleatória criada.
              key: _form,
              child: TextFormField(
                  controller: _valor,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Buy',
                      suffixText: '€'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the purchase value';
                    } else if (double.parse(value) < 10) {
                      return 'Minimum purchase 10€';
                    }

                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    String? value = _valor.text;

                    // Verificar se o campo não está vazio
                    if (value != null && value.isNotEmpty) {
                      // Converter o valor do campo de texto para um número
                      double inputValue = double.parse(value);

                      // Calcular a quantidade dividindo pelo preço da moeda
                      quantity = inputValue / widget.moeda.preco;
                      // Converter a quantidade para uma string com duas casas decimais
                      String formattedQuantity = quantity.toStringAsFixed(2);
                    } else {
                      quantity = 0.0;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
