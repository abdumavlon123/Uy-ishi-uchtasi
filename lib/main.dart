import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: TextField(
            inputFormatters: [LengthLimitingTextInputFormatter(60)],
            controller: controller,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            cursorWidth: 2,
            decoration: InputDecoration(
              counterText: "Salomat",
              prefixText: "yoz ",
              label: Text("So'z kirit"),
              hintText: "Qidirish",
              helperText: "Matn",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(128),
              ),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OTPVerificationPage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class OTPVerificationPage extends StatefulWidget {
  OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Enter Code"),
    centerTitle: true,
    ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "Enter the Code",
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(4, (index) {
    return SizedBox(
    width: 50,
    height: 50,
    child: TextField(
    controller: otpControllers[index],
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    maxLength: 1,
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    decoration: InputDecoration(
    counterText: "",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    onChanged: (value) {
    if (value.isNotEmpty && index < 3) {
    FocusScope.of(context).nextFocus();
    }
    },
    ),
    );
    }),
    ),
    SizedBox(height: 30),
    ElevatedButton(
    onPressed: () {
    String otp = otpControllers.map((e) => e.text).join();
    print("Entered OTP: $otp");
    },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        "Continue",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    ],
    ),
    ),
    );
  }
}

