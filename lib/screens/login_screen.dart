import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  String _language = 'pt';

  late final Map<String, Map<String, String>> translations;

  @override
  void initState() {
    super.initState();
    _loadLanguage();

    translations = {
      'pt': {
        'label_name': 'Nome',
        'hint_name': 'Digite seu nome',
        'label_password': 'Senha',
        'hint_password': 'Crie uma senha',
        'enter': 'ENTRAR',
      },
      'en': {
        'label_name': 'Name',
        'hint_name': 'Enter your name',
        'label_password': 'Password',
        'hint_password': 'Create a password',
        'enter': 'SIGN IN',
      },
      'es': {
        'label_name': 'Nombre',
        'hint_name': 'Ingresa tu nombre',
        'label_password': 'Contraseña',
        'hint_password': 'Crea una contraseña',
        'enter': 'INGRESAR',
      },
    };
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _language = prefs.getString('language') ?? 'pt';
    });
  }

  Map<String, String> get t =>
      translations[_language] ?? translations['pt']!;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.teal.withValues(alpha: 0.35),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/logo_login.png',
                width: 360,
                height: 360,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 220),

                  Text(
                    t['label_name']!,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  _buildRoundedInput(
                    controller: _nameCtrl,
                    hint: t['hint_name']!,
                    prefix: Icons.person,
                  ),

                  const SizedBox(height: 18),

                  Text(
                    t['label_password']!,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 8),

                  _buildRoundedInput(
                    controller: _passwordCtrl,
                    hint: t['hint_password']!,
                    prefix: Icons.lock,
                    obscureText: true,
                  ),

                  const SizedBox(height: 28),

                  Center(
                    child: ElevatedButton(
                      onPressed: _onLoginPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff055d55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 14,
                        ),
                      ),
                      child: Text(
                        t['enter']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedInput({
    required TextEditingController controller,
    required String hint,
    required IconData prefix,
    bool obscureText = false,
  }) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Icon(prefix, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onLoginPressed() async {
    final name = _nameCtrl.text.trim();
    final password = _passwordCtrl.text.trim();

    if (name.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setBool('logged', true);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}
