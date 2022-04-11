import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:pays_online/data/tarjetas.dart';
import 'package:pays_online/helpers/helpers.dart';
import 'package:pays_online/pages/tarjeta_page.dart';
import 'package:pays_online/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
        actions: [IconButton(onPressed: () async {

          mostarAlerta(context, 'Hola', 'Mundo');

          /* mostrarLoading(context);
          await Future.delayed(const Duration(seconds: 1));
          Navigator.pop(context); */

        }, icon: const Icon(Icons.add))],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: size.height * 0.25,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                physics: const BouncingScrollPhysics(),
                itemCount: tarjetas.length,
                itemBuilder: (_, i) {

                  final tarjeta = tarjetas[i];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, navegarFadeIn(context, const TarjetaPage()));
                    },
                    child: Hero(
                      tag: tarjeta.cardNumber,
                      child: CreditCardWidget(
                        cardNumber: tarjeta.cardNumberHidden,
                        expiryDate: tarjeta.expiracyDate,
                        cardHolderName: tarjeta.cardHolderName,
                        cvvCode: tarjeta.cvv,
                        showBackView: false,
                        onCreditCardWidgetChange: (CreditCardBrand) {
                          print('change');
                        },
                      ),
                    ),
                  );
                }),
          ),
          const Positioned(bottom: 0, child: TotalPayButton())
        ],
      ),
    );
  }
}
