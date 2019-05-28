import "package:flutter/material.dart";

class BMIHome extends StatefulWidget {
  BMIHomeState createState() => new BMIHomeState();
}

class BMIHomeState extends State<BMIHome>{

  TextEditingController _ageController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();

  String _result = "Hello, Try Entering Details";
  String _msg = "";

  void _clearAll(){
    setState(() {
      _ageController.clear();
      _heightController.clear();
      _weightController.clear();
    });
  }

  void _calculateBMI(){

    //formula to calculate BMI (weight in kg and height in meter)
    //BMI = weight/(height * height)

    setState(() {
      //weight is alredy in kg
      double _w = double.parse(_weightController.text).toDouble();

      //converrting height into meters
      double _h = double.parse(_heightController.text).toDouble() * 12 * 2.54 * 0.01;

      double _bmi = _w/(_h * _h);
      _result = (_bmi).toStringAsFixed(2);

      /*
      _bmi < 18.5 ?  _msg = "UnderWeight" : 
      _bmi < 24.9 ?  _msg = "Normal" : 
      _bmi < 29.9 ? _msg = "Overweight" : _msg = "Obese";
      */

      if(_bmi < 18.5)  _msg = "UnderWeight";
      else if(_bmi < 24.9) _msg = "Normal";
      else if(_bmi < 29.9) _msg = "OverWeight";
      else _msg = "Obese";

    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: new Color(0xDDE8E8E8),
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),

      //the main Container
      body:new Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(5.0),
        child: new ListView(
          children: <Widget>[

            //The BMI logo
            new Container(
              child: new Image.asset(
                "assets/bmi.png",
                height: 80.0,
                width: 80.0,  
              ),
            ),


            //The form container
            new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: new Column(
                children: <Widget>[

                  //Age Input
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: new InputDecoration(
                      icon: Icon(Icons.person_outline),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => setState((){_ageController.clear();}),
                      ),
                      labelText: "Enter Your age (in year)",
                      hintText: "eg 25",
                    ),
                  ),

                  //weight Input
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: new InputDecoration(
                      icon: Icon(Icons.av_timer),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => setState((){_weightController.clear();}),
                      ),
                      labelText: "Enter Your weight (in Kg)",
                      hintText: "eg 66.71",
                    ),
                  ),


                  //height Input
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: new InputDecoration(
                      icon: Icon(Icons.arrow_upward),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => setState((){_heightController.clear();}),
                      ),
                      labelText: "Enter Your height in Feet",
                      hintText: "eg 6.3",
                    ),
                  ),


                  new Padding(padding: EdgeInsets.symmetric(vertical: 11.0)),


                  //Buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      //clear All Button
                      new RawMaterialButton(
                        fillColor: Colors.pink.shade400,
                        splashColor: Colors.pink.shade700,
                        shape: StadiumBorder(),
                        onPressed: () => _clearAll(),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.clear_all, color: Colors.white70),
                            new Padding(padding: EdgeInsets.symmetric(horizontal: 1.35),),
                            new Text(
                              "Clear",
                              style: new TextStyle(
                                color: Colors.white70,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),


                      new Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),),

                      //BMI Button
                      new RawMaterialButton(
                        fillColor: Colors.pink.shade400,
                        splashColor: Colors.pink.shade700,
                        shape: StadiumBorder(),
                        onPressed: () => _calculateBMI(),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Icon(Icons.edit, color: Colors.white70),
                            new Padding(padding: EdgeInsets.symmetric(horizontal: 1.35),),
                            new Text(
                              "BMI",
                              style: new TextStyle(
                                color: Colors.white70,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  //Button end

                  new Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),

                ],
              ),
            ),

            new Padding(padding: EdgeInsets.symmetric(vertical: 6.0)),
    
            //Result
            new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Colors.white24,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  new Expanded(
                    flex: 2,
                    child: new Row(
                      children: <Widget>[
                        new Text("BMI",
                        style: new TextStyle(
                          color: Colors.pink.shade500,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                        ),

                        new Icon(Icons.arrow_forward_ios, color: Colors.pink.shade400),

                      ],
                    ),
                  ),
                  
                  new Expanded(
                    flex: 8,
                    child: new Text(
                      "$_result",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: new TextStyle(
                        color: Colors.pink.shade500,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                      
                    ),
                  ),
                ]
              ),
            ),

            new Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),
           
            new Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                new Text(
                  "$_msg",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}