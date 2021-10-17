import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=19;
  // Color maleCardColour=inactiveCardColour;
  // Color femaleCardColour=inactiveCardColour;
  //
  // //1-male
  // void updateColour(Gender selectedGender){
  //   if(selectedGender==Gender.male){
  //     if(maleCardColour==inactiveCardColour){
  //       maleCardColour=activeCardColour;
  //       femaleCardColour=inactiveCardColour;
  //     }else{
  //       maleCardColour=inactiveCardColour;
  //     }
  //   }
  //   //2-female
  //   if(selectedGender==Gender.female){
  //     if(femaleCardColour==inactiveCardColour){
  //       femaleCardColour=activeCardColour;
  //       maleCardColour=inactiveCardColour;
  //     }else{
  //       femaleCardColour=inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  //ternary operator
                  colour: selectedGender==Gender.male ? kactiveCardColour:kinactiveCardColour,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female ? kactiveCardColour:kinactiveCardColour,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE')),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
                colour: kactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor:Color(0xFF8DB8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(value: height.toDouble(), min: 120.0,max: 220.0,onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      },),
                    ),
                  ],
                ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: kactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon:FontAwesomeIcons.minus,onPressed: (){ setState(() {
                            weight--;
                          });},),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                              icon:FontAwesomeIcons.plus,onPressed: () {setState(() {
                            weight++;
                          });},),
                        ],
                      ),

                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: kactiveCardColour,cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon:FontAwesomeIcons.minus,onPressed: (){ setState(() {
                            age--;
                          });},),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon:FontAwesomeIcons.plus,onPressed: () {setState(() {
                            age++;
                          });},),
                        ],
                      ),

                    ],
                  ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            ButtonTitle: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiResult:calc.calculateBMI() ,resultText: calc.getResult(),interpretation:calc.getInterpretation() ,),),);
            },
          ),
        ],
      ),
    );
  }
}

