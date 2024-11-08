import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightInFeetController = TextEditingController();
  final TextEditingController _heightInInchController = TextEditingController();
  num? _weight,_heightInFeet,_heightInInch,_heightInMeter,_bmi;
  String _bmiRange = "";
  num _calculateBMI(){
    _weight = num.parse(_weightController.text);
    _heightInFeet = num.parse(_heightInFeetController.text);
    _heightInInch = num.parse(_heightInInchController.text);
    setState(() {
      _heightInMeter = (_heightInFeet!*0.3048) + (_heightInInch!*0.0254);
      _bmi = _weight!/(_heightInMeter!*_heightInMeter!);
    });
    return _bmi!;
  }
  String _weightRange(){
    setState(() {
      if(_bmi!<=18.5){
        _bmiRange = "Underweight";
      }else if(_bmi!>18.5 && _bmi!<=24.9){
        _bmiRange = "Healthy Weight";
      }else if(_bmi!>24.9 && _bmi!<=29.9){
        _bmiRange = "OverWeight";
      }else if(_bmi!>30){
        _bmiRange = "Obese";
      }
    });
    return _bmiRange;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  const SizedBox(height: 110,),
                  Container(
                    width: 300,
                    height: 268,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/heart1.jpg"),fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Center(child: Text(_bmi?.toStringAsFixed(3) ?? "",style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 40),)),
                    ),
                  ),


                  const SizedBox(height: 30,),
                  Text(_bmiRange,style: const TextStyle(fontFamily:"Quosm",fontSize:38,color: Color(0xff4cb197),fontWeight: FontWeight.bold),),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text("Male",style: TextStyle(fontFamily: "Quosm",fontSize: 16,color: Color(0xff5c5c5c),fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Image.asset("assets/images/male.jpg")
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Female",style: TextStyle(fontFamily: "Quosm",fontSize: 16,color: Color(0xff5c5c5c),fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Image.asset("assets/images/female.jpg")
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text("Weight",style: TextStyle(fontFamily: "Quosm",fontSize: 16,color: Color(0xffcdd1d5),fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          // Text("22",style: TextStyle(fontFamily: "Quosm",fontSize: 32,color: Color(0xff5c5c5c),fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 70,
                            height: 40,
                            child: TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Color(0xff5c5c5c),fontSize: 20),textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color:Color(0xffcdd1d5) )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color:Color(0xff88cfc7) )
                                ),

                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset("assets/images/verticle_line.jpg",height: 60,width: 2,fit:BoxFit.fill,color:const Color(0xffcdd1d5)),
                      ),
                      Column(
                        children: [
                          const Text("Height in feet",style: TextStyle(fontFamily: "Quosm",fontSize: 16,color:Color(0xffcdd1d5),fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          //Text("175",style: TextStyle(fontFamily: "Quosm",fontSize: 32,color: Color(0xff5c5c5c),fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 70,
                            height: 40,
                            child: TextField(
                              controller: _heightInFeetController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Color(0xff5c5c5c),fontSize: 20),textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color:Color(0xffcdd1d5) )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color:Color(0xff88cfc7) )
                                ),

                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset("assets/images/verticle_line.jpg",height: 60,width: 2,fit:BoxFit.fill,color: const Color(0xffcdd1d5)),
                      ),
                      Column(
                        children: [
                          const Text("Height in inch",style: TextStyle(fontFamily: "Quosm",fontSize: 16,color:Color(0xffcdd1d5),fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          //Text("75",style: TextStyle(fontFamily: "Quosm",fontSize: 32,color: Color(0xff5c5c5c),fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 70,
                            height: 40,
                            child: TextField(
                              controller: _heightInInchController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Color(0xff5c5c5c),fontSize: 20),textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color:Color(0xffcdd1d5) )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(color:Color(0xff88cfc7) )
                                ),

                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      _calculateBMI();
                    },
                    onDoubleTap: () {
                      _weightRange();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      color: const Color(0xff88cfc7),

                      child: const Center(child: Text("Calculate BMI",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w900,fontFamily: "Quosm"),)),
                    ),
                  )
                ]
            ),
          ),
        )
    );
  }

}