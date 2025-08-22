import 'package:cruze_control/pop_up_screen/bike_add_controller.dart';
import 'package:cruze_control/utills/app_styles/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBikePopUp extends StatefulWidget {
  const AddBikePopUp({super.key});

  @override
  State<AddBikePopUp> createState() => _AddBikePopUp();
}

class _AddBikePopUp extends State<AddBikePopUp> {

  final BikeAddController controller = Get.put(BikeAddController());


  final List<String> vechileList = [
    'Tvs',
    'Royal Enfield',
    'Honda',
    'Hero',
    'Bajaj',
    'Yamaha',
    'Kawasaki',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.lightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Your Bike',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.nicknameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.motorcycle, color: Colors.grey),
                  hintText: 'Bike Nick Name',
                  hintStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField2<String>(
                items: vechileList
                    .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(color: Colors.white70),
                        )))
                    .toList(),
                hint: const Text(
                  'Select Bike Company',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'please select your vechile';
                  }
                  return null;
                },
                onChanged: (value) {
                  controller.selectedCompany.value = value;
                  if (value != null) controller.bikeSelect(value);
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainGrey),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
          Obx(() => DropdownButtonFormField2<String>(
            items: controller.bikeModels
                .map((model) => DropdownMenuItem<String>(
              value: model,
              child: Text(model, style: const TextStyle(color: Colors.white70)),
            ))
                .toList(),
            hint: const Text(
              'Select Bike Model',
              style: TextStyle(color: Colors.white),
            ),
              onChanged: (value) => controller.selectedModel.value = value,

            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[900],
              ),
            ),
          )),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.mileageController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.speed, color: Colors.grey),
                  hintText: 'Bike Milege',
                  hintStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.mainGrey,
                      side: BorderSide(color: AppColors.mainYellow)),
                  onPressed: () async {
                    await controller.saveBike();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add Bike',
                    style: TextStyle(color: AppColors.mainYellow),
                  ))
            ],
          ),
        ));
  }
}

void showAnimatedDialogBikeSelect(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Ride Safe Dialog",
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const Center(
        child: AddBikePopUp(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        ),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}
