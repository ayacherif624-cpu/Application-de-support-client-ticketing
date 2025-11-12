// styles.dart

import 'package:flutter/material.dart';

// --- Palette de Couleurs Bleues Thématiques ---
const Color primaryColor = Color(0xFF1976D2); // Bleu Principal (Action, Boutons)
const Color secondaryColor = Color(0xFF42A5F5); // Bleu Vif (Accentuation, Icônes)
const Color darkColor = Color(0xFF0D1D3A); // Fond Bleu Nuit Profond
const Color surfaceColor = Color(0xFF1E3A63); // Surface des Champs

// Couleurs de statut (adaptées au bleu)
const Color successColor = Color(0xFF4CAF50); // Vert pour Résolu
const Color warningColor = Color(0xFFFFC107); // Jaune pour En cours
const Color dangerColor = Color(0xFFE53935); // Rouge pour Urgent
const Color infoColor = Color(0xFF03A9F4); // Bleu Cyan pour Nouveau

// --- Dégradé du bouton (Bleu Saphir vers Bleu Vif) ---
const LinearGradient buttonGradient = LinearGradient(
  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)], 
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// --- Dégradé de Fond (Créatif/Profond) ---
const LinearGradient backgroundGradient = LinearGradient(
  colors: [Color(0xFF0D1D3A), Color(0xFF0A1428)], // Bleu Nuit Profond
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// --- Styles de Texte ---
final TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  letterSpacing: 2.0,
);

final TextStyle subtitleStyle = TextStyle(
  color: secondaryColor,
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

final TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

// --- Décoration des champs de saisie ---
InputDecoration kInputDecoration(String labelText, IconData icon) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(color: secondaryColor.withOpacity(0.7)),
    prefixIcon: Icon(icon, color: secondaryColor),
    filled: true,
    fillColor: surfaceColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0), // Bordures plus arrondies
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: secondaryColor, width: 2.0),
    ),
  );
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'résolu':
      return successColor;
    case 'en cours':
      return warningColor;
    case 'nouveau':
      return infoColor;
    case 'urgent':
      return dangerColor;
    default:
      return Colors.grey;
  }
}