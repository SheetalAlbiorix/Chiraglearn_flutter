import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';

enum CarType {
  sedan,
  suv,
  truck,
  hatchback,
}

class CarModule extends StatefulWidget {
  const CarModule({super.key});

  @override
  State<CarModule> createState() => _CarModuleState();
}

class _CarModuleState extends State<CarModule> {
  bool isVisible = false;
  static Map<CarType, Set<String>> carModels = {
    CarType.sedan: {"Maruti Wagonr", "Tata tiago", "Skoda cruizer"},
    CarType.suv: {"Vitara brezza", "Toyota fortuner", "Mahindra Xuv"},
    CarType.truck: {"Tata 700", "Eicher", "Ashok Leland"},
    CarType.hatchback: {"Maruti swift", "Honda city", "Toyota carera"}
  };

  CarType? selectedCarType;

  List<String> availableCarModels = [];
  List<String> orderedListCarModels = [];

  Set<String> selectedUniqueCarModels = {};

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.appbar("Car Module", true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Text(
                "1.Select a Car Type from an enum of CarType with the following options: sedan, suv, truck, hatchback.",
                style: CustomTextStyles.normalTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                isExpanded: true,
                value: selectedCarType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isDense: true,
                hint: Text("Select a Car Type"),
                onChanged: (value) {
                  setState(() {
                    selectedCarType = value!;
                    print("selectedCarType : $selectedCarType");

                    availableCarModels =
                        carModels[selectedCarType]?.toList() ?? [];
                  });
                },
                validator: (CarType? value) {
                  if (value == null) {
                    return 'Please select any value';
                  }

                  return null;
                },
                items: CarType.values
                    .map<DropdownMenuItem<CarType>>((CarType value) {
                  return DropdownMenuItem<CarType>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            isVisible = true;
                          });
                          print("availableCarModels : $availableCarModels");
                        }
                      });
                    },
                    child: Text("Submit")),
              ),
              SizedBox(height: 30),
              Text(
                "2.Display Available Car Models as a set of unique strings (no duplicates) for the selected car type.",
                style: CustomTextStyles.normalTextStyle,
              ),
              SizedBox(height: 30),
              Visibility(
                visible: isVisible ? true : false,
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: availableCarModels.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      shadowColor: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(availableCarModels[index],
                                  style: CustomTextStyles.normalTextStyle),
                            )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.black)),
                                onPressed: () {
                                  setState(() {
                                    String item = availableCarModels[index];

                                    if (!selectedUniqueCarModels
                                        .contains(item)) {
                                      selectedUniqueCarModels.add(item);

                                      orderedListCarModels.add(item);
                                    }

                                    print(
                                        "selectedUniqueCarModels : $selectedUniqueCarModels");
                                    print(
                                        "orderedListCarModels : $orderedListCarModels");
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "3.Queue the car models as they are selected, showing the order of selection.",
                style: CustomTextStyles.normalTextStyle,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade50,
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    physics: ScrollPhysics(),
                    itemCount: orderedListCarModels.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 1,
                        shadowColor: Colors.blue,
                        child: ListTile(
                          leading: Text("${index + 1}"),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  String item = orderedListCarModels[index];
                                  orderedListCarModels.remove(item);
                                  selectedUniqueCarModels.remove(item);
                                  // orderedListCarModels.removeAt(index);
                                  print(
                                      "orderedListCarModels: $orderedListCarModels");
                                });
                              },
                              icon: Icon(Icons.clear)),
                          title: Text(
                            orderedListCarModels[index],
                            style: TextStyle(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
