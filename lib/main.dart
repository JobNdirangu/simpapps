import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
// we extend the statelestwidget 
// meaning we inherit the all the methods and proper
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // we 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome Screen"),
          titleTextStyle: TextStyle(
            color: Colors.blue,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [          
              Text("Welcome Back",
              style: TextStyle(
                fontSize: 34,
                fontWeight:FontWeight.bold,
                color: Colors.lightBlue ),), 
              Text("User Admin", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
              ),
               
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text("Email", 
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(width: 15),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email",labelStyle: TextStyle(
                          color: Colors.purple[400]
                        ),
                        hintText: "Enter email here",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.red )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.red )
                        )
                        ),
                    )
                  )
                ], 
              ),
              SizedBox(height: 20),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text("Pass", 
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(width: 15),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.purple[400]
                          ),  
                        hintText: "Enter password here",
                          hintStyle: TextStyle(
                            color: Colors.black38
                          ),
                        border: OutlineInputBorder()
                      ),
                    )
                  )
                ], 
              ),
              SizedBox(height: 20,),

              Text("If you dont have account Register"),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  //nothing for now
                }, 
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white
                ),
              ),
              

            ],
          ),
        ),
      ),
    );
    
  }
}