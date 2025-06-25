# simpapps

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## First App
```dart
import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ), 
        body: Center(
          child: Text("My first flutter"),
        ),
      ),
    );
  }
  
}
```
## Adding the second widget
## we need a column to hold multiple widgets vertical
```dart
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
```

## State management using Provider

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//step 1: Model class — holds data and logic (like an OOP object)
class CounterModel extends ChangeNotifier {

  // Private variable (encapsulation — hide internal state)
  int _count = 0; //initial state

  // Public getter — read-only access from outside
  int get count => _count;  
  // Public method
  void increment() {
    _count++;
    notifyListeners(); // Notifies all listening widgets
  }
}

// Step 2: Wrap Your App with Provider
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>CounterModel(),
      child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider App",
      home: CounterScreen()
    );
    
  }
}

// Step 3: Access Data with Consumer or Provider.of

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Consumer<CounterModel> means: 
        // Listen to changes in the CounterModel class.”
        // part inside angle brackets is called a generic. 
        // It tells Flutter which type of data to listen for.
        child: Consumer<CounterModel>(
          // The builder is a function that gives you access to:
          // context the current widget context
          // counter: the instance of your model (from Provider)
          // child: an optional widget that doesn't rebuild
          builder: (context, counter,child ) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Count: ${counter.count}", style: TextStyle(fontSize: 24)),
                ElevatedButton(
                  onPressed: counter.increment,
                  child: Text("Increase"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
```
## Forms and User Input
### Contact us form
```dart 
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactForm()
    );
  }
  
}
class ContactForm extends StatelessWidget {
  // Unique key to manage the form's state later
  final _formKey = GlobalKey<FormState>();

  ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // This key connects to FormState
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Fill in your details below:", style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Form submission logic comes later
                  },
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```