import 'package:tikchap/auth/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottomNavigationBar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  SafeArea _safeArea = SafeArea.login;
  bool _obscureText = true;
  bool _showCircle = false;
  TextEditingController _user_firstnameController = TextEditingController();
  TextEditingController _user_lastnameController = TextEditingController();
  TextEditingController _user_phoneController = TextEditingController();
  TextEditingController _user_passwordController = TextEditingController();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onshowCircle() {
    setState(() {
      _showCircle = !_showCircle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _safeArea == SafeArea.login ? loginForm() : registerForm(),
      ),
    );
  }

  Padding loginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "Connectez-vous",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002920),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _user_phoneController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: const Color.fromARGB(125, 119, 138, 119),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Numero de telephone",
                    labelStyle:
                        const TextStyle(color: Colors.black26, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _user_passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: const Color.fromARGB(125, 119, 138, 119),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Mot de Passe",
                    labelStyle:
                        const TextStyle(color: Colors.black26, fontSize: 16),
                    suffixIcon: GestureDetector(
                      onTap: _toggle,
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF002920),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Mot de passe oublié",
                        style: TextStyle(
                            fontSize: (16 / 375.0) *
                                MediaQuery.of(context).size.width,
                            color: const Color(0xFFFF7F00)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                        await _viewModel.loginUser(_user_phoneController.text,
                         _user_passwordController.text);
                     // print("test");
                     setState(() {
      _showCircle = !_showCircle;
    });
                     // _onshowCircle;
                      //  Get.to(() => const Dashboard());
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF7F00)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Se connecter",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _showCircle
                    ? const CircularProgressIndicator(color: Color(0xFFFF7F00))
                    : const CircularProgressIndicator(value: 0.0),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'avez pas de compte?",
                      style: TextStyle(
                          fontSize:
                              (13 / 375.0) * MediaQuery.of(context).size.width,
                          color: const Color(0xFF002920)),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        _safeArea = SafeArea.register;
                      }),
                      child: Text(
                        " Créer un compte",
                        style: TextStyle(
                          fontSize:
                              (13 / 375.0) * MediaQuery.of(context).size.width,
                          color: const Color(0xFFFF7F00),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Padding registerForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "Créez votre compte",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF002920),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: _user_firstnameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: const Color.fromARGB(125, 119, 138, 119),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Entrez votre nom",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _user_lastnameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: const Color.fromARGB(125, 119, 138, 119),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Entrez votre prenom",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _user_phoneController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: const Color.fromARGB(125, 119, 138, 119),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Numero de telephone",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _user_passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      filled: true,
                      // fillColor: const Color.fromARGB(125, 119, 138, 119),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Mot de Passe",
                      labelStyle:
                          const TextStyle(color: Colors.black26, fontSize: 16),
                      suffixIcon: GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFF002920),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _viewModel.registerUser(
                            _user_phoneController.text,
                            _user_passwordController.text,
                            _user_firstnameController.text,
                            _user_lastnameController.text);
                        _onshowCircle;
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFFF7F00)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: const <Widget>[
                            Text(
                              "S'inscrire",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _showCircle
                      ? const CircularProgressIndicator(
                          color: Color(0xFFFF7F00))
                      : const CircularProgressIndicator(value: 0.0),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Vous avez deja un compte ?",
                        style: TextStyle(
                            fontSize: (13 / 375.0) *
                                MediaQuery.of(context).size.width,
                            color: const Color(0xFF002920)),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          _safeArea = SafeArea.login;
                        }),
                        child: Text(
                          " Connectez vous",
                          style: TextStyle(
                              fontSize: (13 / 375.0) *
                                  MediaQuery.of(context).size.width,
                              color: const Color(0xFFFF7F00)),
                        ),
                      ),
                    ],
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

enum SafeArea { login, register }
