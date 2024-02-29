import 'package:cripto/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
        icone: 'images/bitcoin.png',
        nome: 'Bitcoin',
        sigla: 'BTC',
        preco: 164603.00),
    Moeda(
        icone: 'images/cardano.png',
        nome: 'Cardano',
        sigla: 'ADA',
        preco: 0.5840),
    Moeda(
        icone: 'images/ethereum.png',
        nome: 'Ethereum',
        sigla: 'ETH',
        preco: 2942.29),
    Moeda(
        icone: 'images/litecoin.png',
        nome: 'Litecoin',
        sigla: 'LTC',
        preco: 68.193),
    Moeda(
        icone: 'images/usdcoin.png',
        nome: 'USDC',
        sigla: 'USDC',
        preco: 1.0002),

    Moeda(
      icone: 'images/xrp.png', 
      nome: 'XRP', 
      sigla: 'XRP', 
      preco: 0.53628),
  ];
}
