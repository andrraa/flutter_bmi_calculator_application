import 'package:bmi_application/const/app_const.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Kalkulator",
          style: TextStyle(fontWeight: FontWeight.w500, color: accentHexColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tinggi",
                      hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Berat",
                      hintStyle: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      double tinggi = double.parse(_heightController.text);
                      double berat = double.parse(_weightController.text);

                      setState(() {
                        _result = berat / ((tinggi / 100) * (tinggi / 100));
                        if (_result >= 25) {
                          _textResult = "Kamu Obesitas";
                        } else if (_result >= 23 && _result <= 24.9) {
                          _textResult = "Kamu Kelebihan Berat";
                        } else if (_result >= 18.5 && _result <= 24.9) {
                          _textResult = "Berat Kamu Normal";
                        } else {
                          _textResult = "Kamu Kekurangan Berat";
                        }
                      });
                    },
                    child: const Text(
                      "Hitung",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _result = 0;
                        _textResult = "";
                        _heightController.clear();
                        _weightController.clear();
                      });
                    },
                    child: const Text(
                      "Hapus",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              _result.toStringAsFixed(2),
              style: const TextStyle(fontSize: 32, color: accentHexColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Note: Masukkan Tinggi Dalam CM dan Berat Dalam KG",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
