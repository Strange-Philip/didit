import 'package:didit/componets/textStyles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final void Function() ontap;
  const PrimaryButton({super.key, required this.title, required this.ontap});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.18),
      child: GestureDetector(
        onTap: widget.ontap,
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: Center(
            child: Text(
              widget.title,
              style: DiditTextStyles.bodyStyle
                  .copyWith(color: Colors.black, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
