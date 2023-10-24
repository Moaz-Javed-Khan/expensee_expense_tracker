import 'dart:convert';

import 'package:expensee/widgets/CutomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' hide Card;
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class TransferView extends StatefulWidget {
  const TransferView({super.key});

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
  TextEditingController descriptionController = TextEditingController();

  bool isRepeat = false;

  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text("Transfer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: (height * 0.38)),
                  const Text(
                    "How much?",
                    style: TextStyle(
                      color: Color.fromARGB(204, 255, 255, 255),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "\$0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  right: 12.0,
                  bottom: 400.0,
                  left: 12.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null) {
                          return "Enter Description";
                        }
                        if (value.isEmpty
                            // ||
                            // !RegExp(
                            //   r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                            // ).hasMatch(value)
                            ) {
                          return "Enter Description correctly";
                        } else {
                          return null;
                        }
                      },
                      controller: descriptionController,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple[50]!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple[50]!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple[50]!),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.deepPurple[50]!,
                            width: 1,
                          )),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attachment,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Add attachment",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Repeat",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Repeat Transaction",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          value: isRepeat,
                          onChanged: (value) {
                            setState(() {
                              isRepeat = !isRepeat;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      title: const Text(
                        "Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onClick: () async {
                        await makePayment();
                      },
                      color: Colors.deepPurpleAccent,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent("20", "USD");
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['client_secret'],
        // applePay: true,
        // googlePay: true,
        customFlow: true,
        style: ThemeMode.dark,
        merchantDisplayName: 'Moaz',
      ));

      displayPaymentSheet();
    } catch (e) {
      print("Error: $e");
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        print('payment intent${paymentIntentData!['id']}');
        print('payment intent${paymentIntentData!['client_secret']}');
        print('payment intent${paymentIntentData!['amount']}');
        print('payment intent$paymentIntentData');
        //orderPlaceApi(paymentIntentData!['id'].toString());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Paid successfully"),
          ),
        );

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print("Error: $e");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer '
                'sk_test_51O4h5dI6fkbmsqpruQwnKB7SVZlz11AwGb2DZceYMtIuw3SapqdhqzANeAWWeOonMl6Qsipnh6yyhbdZKSmue0ZM00d5twENuD',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body.toString());
    } catch (e) {
      print("Error: $e");
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }
}
