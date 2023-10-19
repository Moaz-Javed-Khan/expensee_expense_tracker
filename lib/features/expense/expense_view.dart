import 'package:expensee/widgets/CutomButton.dart';
import 'package:expensee/widgets/categories_dropdown_widget.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  TextEditingController descriptionController = TextEditingController();

  bool isRepeat = false;

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text("Expense"),
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
                  SizedBox(height: (height * 0.20)),
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
                    const CategoriesDropDownWidget(),
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
                    const CategoriesDropDownWidget(),
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
                      onClick: () {},
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
}
