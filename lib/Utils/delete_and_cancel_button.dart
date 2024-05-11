import 'package:flutter/material.dart';
import '../Components/custom_button.dart';
import '../Constants/constats.dart';

class DeleteAndCancelButton extends StatefulWidget {
  const DeleteAndCancelButton({super.key});

  @override
  State<DeleteAndCancelButton> createState() => _DeleteAndCancelButtonState();
}

class _DeleteAndCancelButtonState extends State<DeleteAndCancelButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Column(
          children: [
            MyCustomButton(
              onPressed: () {},
              title: "DELETE TODO",
              color: textColor,
              colorText: secondryColor,
              isLoading: isLoading,
              indicatorColor: secondryColor,
            ),
            const SizedBox(
              height: 15,
            ),
            MyCustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              title: "CANCEL",
              color: textColor,
              colorText: const Color(0xff00FF19),
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
