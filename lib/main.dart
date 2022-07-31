import 'package:flutter/material.dart';  
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
  
void main() {  
  
  runApp(MemorialLotReservationApp());  
}  
  class MemorialLotReservationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memorial Lot Reservation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FirstRoute(),
    
    );
  }
}
class MemorialLotReservation extends StatefulWidget {
  
  
  
  @override  

  MainPage createState() => MainPage();  
  
}  
  class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorial Lot Reservation Application'),
      ),
      body: Padding( 
        padding: EdgeInsets.only(top: 70, left: 70, right: 70),  
          
            child: Column(  
              children: <Widget>[ 
     Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [ Text('   La Hermosa Resources\n Development Corporation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                
                
              ),
            
            ),
              ],
      ),
       Padding(padding: EdgeInsets.only(bottom: 20)),
      Column(
        children: [
          Image.asset('assets/images/Logo.png', width: 300, height: 200,),
        ],

      ),
        Padding(padding: EdgeInsets.only(bottom: 20)),

      Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [ Text('Created by: Eros Anthony Serrano',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontStyle: FontStyle.italic,
                
              ),
            
            ),
              ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 100)),
        Align(  
                  
                  alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.8),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 0), 
        
      ),
    ],
           
              ),
              margin: const EdgeInsets.all(5),
              height: 40,
              width: 240,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemorialLotReservation()));},
                child: const Text('Open Reservation Form'),
                color: Colors.blue.shade500,
                textColor: Colors.white,
                
              ),

              
            ), 

        
                ),
              ],
            ),
      ),
    );
  }
}

class outputPage extends StatelessWidget {
  
 String client = MainPage.clientID.toString();
  String agent = MainPage.agentID.toString();
   String Lot_location = MainPage.lotLocation.toString();
    String Lot_number = MainPage.lotNumber.toString();
     String res_fee = MainPage.reservationFee.toString();
      String res_plan = MainPage.reservationPlan.toString();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorial Lot Reservation Application'),
      ),
      body: Center(
     
        
     child: Column(
      
        children: <Widget>[
          Padding(
            
            padding: EdgeInsets.only(top: 70, left: 15, right: 15, bottom: 15),
           
          ),

        Column(
            
            children: [
             Text('Client ID:  ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ), 
              ),
              Text(client)
            
            ],
           
          
          ),
          Padding(
            padding: EdgeInsets.all(15),
            
          ),
          Column(
            
            children: [
             Text('Agent ID:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ), 
              ),
              Text(agent)
            
            ],
           
          
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
          Column(
            
            children: [
             Text('Memorial Lot Location:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ), 
              ),
              Text(Lot_location)
            
            ],
           
          
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
          Column(
            
            children: [
             Text('Memorial Lot Number:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ), 
              ),
              Text(Lot_number)
            
            ],
           
          
          ),
          Padding(
            padding: EdgeInsets.all(15)
          ),
          Column(
            
            children: [
             Text('Reservation Fee:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ), 
              ),
              Text(res_fee)
            
            ],
           
          
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
          Column(
            
            children: [
             Text('Reservation Plan:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ), 
              ),
              Text(res_plan)
            
            ],
           
          
          ),
          Padding(padding: EdgeInsets.all(20)),
       ElevatedButton(
          child: const Text('EXIT'),
          onPressed: () {
            
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstRoute()),
            );
           MainPage.saveFile(client, agent, Lot_location, Lot_number, res_fee, res_plan);
          },
        ),
        ],
      ),
        
      ),  
    );
  }
}


class MainPage extends State<MemorialLotReservation> {  
  final List<String> items = [
  'Loan Lot',
  'Double Lot',
  'Junior Garden',
  'Family Estate',
];
String? selectedValue;
  static String clientID = '';
  static String agentID = '';
  static String lotLocation = '';
  static String lotNumber = '';
  static String reservationFee = '';
  static String reservationPlan = '';

  static Future<String> get _localPath async {
   final directory = (await getApplicationDocumentsDirectory()).path; // 1
     // 3

    return directory;
  }
  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/inputTextFile.txt');
  }

  static Future<File> saveFile(String CID, String AID, String MLL, String MLN, String RF, String RP) async {
   final file = await _localFile; // 1
    return file.writeAsString('$CID'+'|'+'$AID'+'|'+'$MLL'+'|'+'$MLN'+'|'+'$RF'+'|'+'$RP'); // 2
  }

  @override  
  Widget build(BuildContext context) {  
   
    
    return Scaffold(  
     
        appBar: AppBar(  
             
          title: Text('Memorial Lot Reservation Application'), 
        ),  
         backgroundColor: Colors.lightBlue,
        body: Padding(
            padding: EdgeInsets.only(top: 60, left: 70, right: 70),  
          
            child: Column(  
              children: <Widget>[  
                Padding(  
                  padding: EdgeInsets.all(5),  
                  child: TextField(  
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                        setState(() {
                          clientID = value;
                        });
                    },
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Client ID',  
                      hintText: 'Enter the Client ID',
                      fillColor: Colors.white,
                      filled: true, 
                       
                    ),  
                  ),  
                ),  
                Padding(  
                  padding: EdgeInsets.all(5),  
                  
                  child: TextField(  
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                        setState(() {
                          agentID = value;
                        });
                    },
                      style: TextStyle(fontWeight: FontWeight.bold),
                  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Agent ID',  
                      hintText: 'Enter the Agent ID', 
                       fillColor: Colors.white,
                      filled: true, 
                    ),  
                  ),  
                ), 
                Padding(  
                  padding: EdgeInsets.all(5),  
                  child: TextField(  
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                        setState(() {
                          lotLocation = value;
                        });
                    },
                     style: TextStyle(fontWeight: FontWeight.bold),
                   
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Memorial Lot Location',  
                      hintText: 'Enter Memorial Lot Location',
                        fillColor: Colors.white,
                      filled: true,   
                    ),  
                  ),  
                ), 
                 Padding(  
                  padding: EdgeInsets.all(5),  
                  child: TextField(  
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                        setState(() {
                          lotNumber = value;
                        });
                    },
                     style: TextStyle(fontWeight: FontWeight.bold),
                  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Memorial Lot Number',  
                      hintText: 'Enter Memorial Lot Number',  
                        fillColor: Colors.white,
                      filled: true, 
                    ),  
                  ),  
                ),
                Padding(  
                  padding: EdgeInsets.all(5),  
                
                  child: TextField(  
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                        setState(() {
                          reservationFee = value;
                        });
                    },
                     style: TextStyle(fontWeight: FontWeight.bold),
                   
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Reservation Fee',  
                      hintText: 'Enter Reservation Fee',
                        fillColor: Colors.white,
                      filled: true,   
                    ),  
                  ),  
                ),
               
               Padding(padding: EdgeInsets.all(5)),

        Container(    
        decoration: BoxDecoration(color: Colors.white, ),
   child: DropdownButton2(
    
    isExpanded: true,
    
      style: TextStyle(fontWeight: FontWeight.bold),
 
          hint: Text(
            'Reservation Plan',
            
            style: TextStyle(
              fontSize: 14,
              color: Theme
                      .of(context)
                      .hintColor,
            
            ),
          ),
         
          items: items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: item,
                    
                    child: Text(
                      
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      color: Colors.black
                        
                    
                      ),
                    ),
                  ))
                  .toList(),
       
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
              reservationPlan = value as String;
            });
          },
          buttonPadding: EdgeInsets.all(5),
          buttonHeight: 40,
          buttonWidth: 140,
                         
          itemHeight: 40,
   ),
        ),
      
      Padding(padding: EdgeInsets.all(20)),
                Align(  
                  
                  alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.8),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 0), 
        
      ),
    ],
           
              ),
              margin: const EdgeInsets.all(5),
              height: 40,
              width: 140,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            
                onPressed: () {
                       
                  showDialog(
                    context: context, builder: (context) => AlertDialog(
                      title: Text('Successfully Reserved!', textAlign: TextAlign.center,),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed:  () => Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  outputPage()))
              
              
                        ),
                      ],
                    ),
                    ); 
                   
                },
                child: const Text('Reserve'),
                color: Colors.blue.shade500,
                textColor: Colors.white,
              ),
            ), 
                ), 


                Align(  
                  
                  alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.8),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 0), 
        
      ),
    ],
           
              ),
              margin: const EdgeInsets.all(5),
              height: 40,
              width: 140,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FirstRoute()));},
                child: const Text('Back'),
                color: Colors.blue.shade500,
                textColor: Colors.white,
                
              ),
            ), 
                ) 
              ],  
            
            ) 
           
        ),
        
    );  
  
  }  
}  