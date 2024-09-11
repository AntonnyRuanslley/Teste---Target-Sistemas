import "dart:math";

final random = new Random(); //Classe da função random

Map<String, dynamic> getBillingsDate({
  required List<double> billings,
}) {
  final billingsBigger = <double>[];
  final average =
      billings.reduce((billingTotal, billing) => billingTotal + billing) /
          billings.length;
  double biggerBilling = billings.first;
  double lowestBilling = billings.first;

  billings.forEach((billing) {
    if (biggerBilling < billing) {
      biggerBilling = billing;
    }
    if (lowestBilling > billing) {
      lowestBilling = billing;
    }
    if (billing > average) {
      billingsBigger.add(billing);
    }
  });

  return {
    'bigger_billing': biggerBilling,
    'lowest_billing': lowestBilling,
    'average': double.parse(average.toStringAsFixed(2)),
    'billings_bigger': billingsBigger,
  };
}

void main() {
  final generator = (int index) => double.parse((random.nextDouble() * 10000)
      .toStringAsFixed(2)); // Função para gerar valores double aleatórios;
  final yearBillings =
      List.generate(365, generator); //Lista aleatória de valores;

  final billingsDate = getBillingsDate(billings: yearBillings);

  print("Maior faturamento do ano:\nR\$ ${billingsDate['bigger_billing']}");
  print("Menor faturamento do ano:\nR\$ ${billingsDate['lowest_billing']}");
  print("Média:\nR\$ ${billingsDate['average']}");
  print("Faturamentos acima da média do ano:");
  (billingsDate['billings_bigger'] as List)
      .forEach((billing) => print("R\$ $billing"));
}
