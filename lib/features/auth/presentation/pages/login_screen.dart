import 'package:flutter/material.dart';
import 'package:noviindus_task2/common/widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/login_screen_provider.dart';
import '../widgets/mobile_number_textfield.dart';
import '../widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginScreenProvider>(
      builder: (BuildContext context, LoginScreenProvider value, Widget? child) { 
        return LoadingWidget(
          isLoading: value.isLoading,
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: SubmitButton(onPressed: () {
              final phone = controller.text.trim();
              if (phone.isNotEmpty) {
                value.fetchProducts(context: context, phone: phone);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a valid phone number')),
                );
              }
            },),
            body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Enter Your \nMobile Number',
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Porta at id hac vitae. Et tortor at vehicula euismod mi viverra.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    MobileNumberTextField(
                      controller: controller,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
