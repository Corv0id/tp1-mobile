# PROGRESS — TP1 (Découverte comparative React Native & Flutter)

Source de vérité : `tp1/TP1_React_Native_Flutter_Support_Etudiants.pdf` (copie `tp.txt`).
Projet RN : `TP2ReactNative` (Expo / JS). Projet Flutter : `tp2_flutter`.

Légende : [x] fait · [ ] à faire

---

## Réactiver dans une session neuve
- Le code source est complet et vérifié (`flutter analyze` = 0 issue ; syntaxe RN OK).
- Pour lancer : `cd TP2ReactNative && npx expo start`  et  `cd tp2_flutter && flutter run`.
- Écran d'accueil de chaque app : un bouton par exercice + bouton « Retour » par exercice.
- Actions encore à faire : réponses écrites (voir `ANSWERS.md`, volontairement vides) et captures d'écran (voir `screenshots/README.md`).

---

## Livrables (section 1.2)
- [x] Projet React Native `TP2ReactNative`
- [x] Projet Flutter `tp2_flutter`
- [ ] Captures d'écran des applications exécutées (student to do — voir screenshots/README.md)
- [ ] Tableau comparatif RN / Flutter complété par l'étudiant → ANSWERS.md §1 (vide, à remplir)
- [ ] Réponses des questions de synthèse (section 19.1) → ANSWERS.md (vides, à remplir)

## Parties A et B — exercices
### React Native — `TP2ReactNative/src/exercises/`
- [x] RN1 Hello World & StyleSheet — default export, StyleSheet
  - [ ] Travail étudiant 1 : texte principal = nom + groupe → `NOM_GROUPE` dans RN1.js (placeholder à personnaliser)
  - [ ] Travail étudiant 2 : 2e Text = date du TP → `DATE_TP` dans RN1.js (placeholder à personnaliser)
  - [ ] Travail étudiant 3 : modif. alignement (commentaire de valeurs alternatives dans RN1.js)
- [x] RN2 Bouton + événement + Alert — default export
  - [x] Mini-défi : 2e bouton « Annuler » avec autre message
- [x] RN3 State + compteur — default export
  - [x] Travail étudiant 1 : bouton « Remettre à zéro »
  - [x] Travail étudiant 2 : empêcher valeur négative (Math.max(0, …))
  - [x] Travail étudiant 3 : message « Valeur élevée » à 10 (>= 10)
- [x] RN4 TextInput + state + bouton — default export
  - [ ] Questions RN4 → ANSWERS.md (vides, à remplir)
- [x] RN5 Props parent → enfant (Heading) — default export
- [x] RN6 Position GPS (expo-location) — default export
  - [ ] Extension facultative `watchPositionAsync()` (non demandée, non incluse)

### Flutter — `tp2_flutter/lib/exercises/`
- [x] FL1 Hello World StatelessWidget — Scaffold + AppBar, pas de MaterialApp dedans
- [x] FL2 StatefulWidget + compteur
  - [x] Travail étudiant 1 : bouton Reset
  - [x] Travail étudiant 2 : valeur minimale bloquée à 0
  - [x] Travail étudiant 3 : titre AppBar change quand le compteur > 5
- [x] FL3 TextField + ElevatedButton (showDialog / AlertDialog)
- [x] FL4 CounterCubit + BlocProvider + BlocBuilder
- [x] FL5 Géolocalisation (geolocator) — flow permission, Scaffold
  - [x] Permissions `<uses-permission…>` ajoutées dans `android/app/src/main/AndroidManifest.xml` (avant `<application>`)

## Navigateurs
- [x] RN `App.js` : écran d'accueil, un bouton/exercice, « Retour » par écran, state simple (pas de librairie de navigation)
- [x] Flutter `lib/main.dart` : MaterialApp + home listant un bouton/exercice, navigation via `Navigator.push`

## Section 19 — Synthèse
- [x] Tableau comparatif (structuré) → ANSWERS.md §1
- [ ] Réponses 19.1 (5 questions) → ANSWERS.md (vides, à remplir)

## Section 20 — Approfondissement (B et C demandés par l'utilisateur)
- [x] B — Compteur enrichi : +1, -1, +5, Reset, couleur selon la valeur
  - [x] RN : `src/exercises/B_Compteur_enrichi.js`
  - [x] Flutter : `lib/exercises/b_compteur_enrichi.dart`
- [x] C — GPS : lat, lon, précision, horodatage, bouton « Actualiser »
  - [x] RN : `src/exercises/C_GPS.js`
  - [x] Flutter : `lib/exercises/c_gps.dart`
- [ ] A, D, E : non demandés par l'utilisateur → non inclus

## Dépendances installées
- [x] RN : `npx expo install expo-location`
- [x] Flutter : `flutter pub add flutter_bloc geolocator`

## Suivi des actions manuelles restant à l'étudiant
- [ ] Rentrer son nom / groupe / date (RN1)
- [ ] Écrire les réponses dans ANSWERS.md
- [ ] Captures d'écran (screenshots/README.md)
