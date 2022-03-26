import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon; 
  final TextInputType? textType; 
  final bool ocultarTexto; 

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.textType, 
    this.ocultarTexto = false,
    required this.formProperty, 
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      obscureText: ocultarTexto,
      keyboardType: textType,
      onChanged: (value){
        formValues[formProperty] = value;
      },
      validator: (value){
        if(value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Mínimo de 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:  InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        // prefixIcon: Icon(Icons.group_outlined),
        suffixIcon: icon == null ? null : Icon(icon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}