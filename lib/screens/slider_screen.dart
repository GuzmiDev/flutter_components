import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Slider and Checks"),
      ),
      body: Column(
        children: [
      
          Slider.adaptive(
            value: _sliderValue,
            min: 50,
            max: 400,
            // divisions: 10,
            activeColor: AppTheme.primary,
            onChanged: !_isCheck ? null : (value){
              _sliderValue = value;
              setState(() {});
            }
          ),

          // Checkbox(
          //   value: _isCheck, 
          //   onChanged: (value){
          //     _isCheck = value ?? false;
          //     setState(() {});
          //   }
          // ),

          //  Switch(
          //   value: _isCheck, 
          //   onChanged: (value){
          //     _isCheck = value;
          //     setState(() {});
          //   }
          // ),

          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text("Habilitar slider"),
            value: _isCheck, 
            onChanged: (value){
              _isCheck = value ?? false;
              setState(() {});
            }
          ),

          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text("Habilitar slider"),
            value: _isCheck, 
            onChanged: (value){
              _isCheck = value;
              setState(() {});
            }
          ),
      
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage("https://www.nicepng.com/png/detail/164-1641494_hinata-transparent-haikyuu-hinata-shouyou-full-body.png"),
                fit: BoxFit.contain,
                width: _sliderValue + 50,
                ),
            ),
          ),

          
      
        ],
      ),
    );
  }
}