// screens.dart

import 'package:flutter/material.dart';
import 'package:application_de_support_client_ticketing/styles/style.dart'; 

// 1. Conversion en StatefulWidget
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); 
  String _email = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      print('Connexion réussie pour l\'email : $_email');
      
       
    }
  }
  
  // Validation stricte du format de l'email (doit contenir @)
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre identifiant.';
    }
    // Expression régulière standard pour vérifier le format email
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    
    if (!emailRegExp.hasMatch(value)) {
      return 'Veuillez entrer un email valide (doit contenir @).';
    }
    return null;
  }

  // Validation robuste du mot de passe
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe.';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères.';
    }
    
    // RegEx pour vérifier:
    // (?=.*[a-z]) : au moins une minuscule
    // (?=.*[A-Z]) : au moins une majuscule
    // (?=.*[0-9]) : au moins un chiffre
    // (?=.*[!@#\$%^&*()_+]) : au moins un caractère spécial (liste personnalisée)
    final passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()_+]).{8,}$');

    if (!passwordRegExp.hasMatch(value)) {
      return 'Le mot de passe doit inclure: majuscule, minuscule, chiffre et caractère spécial.';
    }
    
    return null; 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // 1. Logo Créatif
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ]
                    ),
                    child: Icon(
                      Icons.support_agent_rounded,
                      size: 70,
                      color: secondaryColor,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'TicketPro',
                    style: titleStyle,
                  ),
                  Text(
                    'La gestion de vos incidents, simplifiée.',
                    style: subtitleStyle,
                  ),
                  SizedBox(height: 40),

                  // 2. Champs de Saisie (avec Validators mis à jour)
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: kInputDecoration('Email', Icons.email_outlined), // Changement d'icône pour l'email
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail, // Validation Email stricte
                    onSaved: (value) {
                      _email = value ?? '';
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: kInputDecoration('Mot de passe', Icons.lock_outline),
                    validator: _validatePassword, // Validation Mot de Passe robuste
                    onSaved: (value) {
                      _password = value ?? '';
                    },
                  ),
                  SizedBox(height: 35),

                  // 3. Bouton "Se Connecter"
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: buttonGradient, 
                      boxShadow: [
                         BoxShadow(
                          color: secondaryColor.withOpacity(0.4),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _submitForm, 
                        borderRadius: BorderRadius.circular(15.0),
                        child: Center(
                          child: Text(
                            'SE CONNECTER',
                            style: buttonTextStyle, 
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 25),
                  
                  // 4. Liens secondaires
                  TextButton(
                    onPressed: () {},
                    child: Text('Mot de passe oublié ?', style: TextStyle(color: secondaryColor.withOpacity(0.8))),
                  ),
                  
                  SizedBox(height: 50), 
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}