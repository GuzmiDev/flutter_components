import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name' : '',
      'last_name' : '',
      'email' : '',
      'password' : '',
      'role' : ''
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs y Forms"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children:[
                CustomInputField(hintText: "Nombre del usuario", labelText: "Nombre", formValues: formValues, formProperty: 'first_name', ),
                const SizedBox(height: 30,),
          
                CustomInputField(hintText: "Apellido del usuario", labelText: "Apellido", formValues: formValues, formProperty: 'last_name'),
                const SizedBox(height: 30,),
          
                CustomInputField(hintText: "Correo del usuario", labelText: "Correo", textType: TextInputType.emailAddress, formValues: formValues, formProperty: 'email'),
                const SizedBox(height: 30,),
          
                CustomInputField(hintText: "Contraseña", labelText: "Contraseña", ocultarTexto: true, formValues: formValues, formProperty: 'password'),
                const SizedBox(height: 30,),

                DropdownButtonFormField<String>(
                  items: const[
                    DropdownMenuItem(value: 'Admin', child: Text("Admin")),
                    DropdownMenuItem(value: 'User', child: Text("User")),
                  ],
                  onChanged: (value){
                    formValues['role'] = value ?? 'User';
                  }
                  ),
          
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if(!myFormKey.currentState!.validate()){
                      print("Formulario no valido");
                      return;
                    }
                    print(formValues);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text("Guardar"))
                    )
                  )
              ]
            ),
          ),
          ),
      ),
    );
  }
}

