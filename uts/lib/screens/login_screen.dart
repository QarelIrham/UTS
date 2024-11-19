import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _inputUsername = '';
  String _inputPassword = '';
  bool _isLoading = false;

  // Dummy data untuk validasi
  final String _correctUsername = 'marvel';
  final String _correctPassword = '12345';

  void _login() {
    setState(() {
      _isLoading = true; // Memulai loading
    });

    // Simulasi proses login
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false; // Selesai loading
      });

      if (_inputUsername == _correctUsername &&
          _inputPassword == _correctPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // Menampilkan notifikasi error jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Username atau Password salah!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Marvel Login',
              style: TextStyle(
                color: Colors.red,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white12,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: Colors.red),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) => _inputUsername = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Username tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white12,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.red),
                    ),
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) => _inputPassword = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Password tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 30),
                  _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.red,
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _login(); // Panggil fungsi login
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
