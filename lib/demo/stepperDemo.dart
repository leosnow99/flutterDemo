import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Theme(
             data: Theme.of(context).copyWith(
               primaryColor: Colors.black,
             ),
             child: Stepper(
               currentStep: _currentStep,
               onStepTapped: (int value) {
                 setState(() {
                   _currentStep = value;
                 });
               },
               onStepContinue: () {
                 setState(() {
                   _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                 });
               },
               onStepCancel: () {
                 setState(() {
                   _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                 });
               },
               steps: [
                 Step(
                   title: Text('Login'),
                   content: Text("不必太纠结于当下，也不必太忧虑未来，当你经历过一些事情的时候，眼前的风景已经和从前不一样了。"),
                   isActive: _currentStep == 0,
                 ),
                 Step(
                   title: Text('Login'),
                   content: Text("真正的强者，不是流泪的人，而是含泪奔跑的人."),
                   isActive: _currentStep == 1,
                 ),
                 Step(
                   title: Text('Login'),
                   content: Text("在茫茫沙漠，唯有前时进的脚步才是希望的象征。"),
                   isActive: _currentStep == 2,
                 ),

               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
