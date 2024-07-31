import 'package:flutter/Material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../core/constants.dart';
import '../../../core/themes/colors.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  const CustomRadioButton(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: isTablet ? 2 : 1.5,
      child: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: ColorManager.secondary,
      ),
    );
  }
}
