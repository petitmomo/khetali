import 'package:flutter/material.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                //logo
                child: Image.asset("assets/images/logo.png",
                    width: 200.0, height: 200.0, fit: BoxFit.cover),
              ),
             const Padding(
               padding:EdgeInsets.all(15.0),
               child: Text('Bienvenue sur la page de connexion de Khétali !',
               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
               ),
             ),

              // debut formulaire de connexion
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      // champ email
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer votre identifiant";
                          } 
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.perm_identity_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFCDDECE), width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFCDDECE), width: 1.0)),
                          labelText: "Entrer votre identifiant",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      // champ mot de passe
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer un mot de passe";
                          } else if (value.length < 8) {
                            return 'Le mot de passe doit contenir au moins 8 caractères';
                          }
                          return null;
                        },
                        obscureText: _isVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFCDDECE), width: 1.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color(0xFFCDDECE), width: 1.0)),
                          labelText: "Entrer votre mot de passe",
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            child: Icon(_isVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    // mot de passe oublié
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/reset_password');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Mot de passe oublié'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      //Button de connexion
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // vérifier si le formulaire est valide
                            if (_formKey.currentState!.validate()) {
                              // naviguer vers home page pour le moment
                              Navigator.pushNamed(context, '/main');
                             
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (const Color(0xFF8A2BE2)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0
                          ),
                            ),
                            ),
                          child: const Text('SE CONNECTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
