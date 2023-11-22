import 'package:flutter/material.dart';
import 'package:bp_mart/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Register',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                if (username.isEmpty || password.isEmpty) {
                  _usernameController.clear();
                  _passwordController.clear();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Input Tidak Valid'),
                      content: const Text('Harap isi semua kolom input.'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                  return; // Stop eksekusi jika input tidak valid
                }

                final response =
                    await request.post("http://127.0.0.1:8000/auth/register/", {
                  'username': username,
                  'password': password,
                });

                bool status = response['status'];

                if (status == false) {
                  _usernameController.clear();
                  _passwordController.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Register Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  _usernameController.clear();
                  _passwordController.clear();
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text(
                            "$message Berhasil membuat akun dengan username $uname.")));
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ketika tombol ditekan
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
