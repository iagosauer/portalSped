// ignore_for_file: no_logic_in_create_state
import 'dart:developer';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDownButtonDialogForm<T> extends StatelessWidget {
  List<T> list;
  String? labelUp;
  IconData? icon;
  bool habilitado;
  ValueNotifier controler;
  CustomDropDownButtonDialogForm(
      {super.key,
      required this.list,
      this.labelUp,
      this.icon,
      this.habilitado = true,
      required this.controler}) {
  }

  @override
  Widget build(BuildContext context) {
    T dropdownValue;
    if (controler.value.compareTo('') == 0) {
    dropdownValue = list.first;
    print(dropdownValue.toString());
    }
    else
    {
      dropdownValue = controler.value;
    }

    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: labelUp ?? '',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        prefixIcon: icon == null ? null : Icon(icon),
        enabled: habilitado,
      ),
      enableFeedback: habilitado,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      isExpanded: true,
      onChanged: habilitado
          ? (T? value) {
              dropdownValue = value!;
              controler.value = dropdownValue;
            }
          : null,
      items: list.map<DropdownMenuItem<T>>((T value) {
        var texto = '';
        if (value is String) {
          texto = value;
        }
        return DropdownMenuItem<T>(
          enabled: habilitado,
          value: value,
          child: SizedBox(
            child: Text(texto, textAlign: TextAlign.center),
          ),
        );
      }).toList(),
    );
  }
}
