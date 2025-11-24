import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // language: 'pt' | 'en' | 'es'
  final String language;
  const LoginScreen({super.key, required this.language});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  // Traduções simples (para app pequeno). Para produção use intl / ARB.
  late final Map<String, Map<String, String>> translations;

  @override
  void initState() {
    super.initState();
    translations = {
      'pt': {
        'label_name': 'Nome',
        'hint_name': 'Digite um nome usuário',
        'label_password': 'Senha',
        'hint_password': 'Crie uma senha',
        'enter': 'ENTRAR',
        'or': 'ou',
        'google': 'Entrar com Google',
      },
      'en': {
        'label_name': 'Name',
        'hint_name': 'Enter your name',
        'label_password': 'Password',
        'hint_password': 'Create a password',
        'enter': 'SIGN IN',
        'or': 'or',
        'google': 'Sign in with Google',
      },
      'es': {
        'label_name': 'Nombre',
        'hint_name': 'Ingresa tu nombre',
        'label_password': 'Contraseña',
        'hint_password': 'Crea una contraseña',
        'enter': 'INGRESAR',
        'or': 'o',
        'google': 'Ingresar con Google',
      },
    };
  }

  Map<String, String> get t {
    return translations[widget.language] ?? translations['pt']!;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Para reproduzir o fundo similar ao seu design, deixei a estrutura para você adaptar.
    return Scaffold(
      body: Stack(
        children: [
          // Fundo
          SizedBox.expand(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Gradiente
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.teal.withValues(alpha: 0.25),
                  ],
                ),
              ),
            ),
          ),

          // ✅ LOGO FIXA
          Positioned(
            top: 0, // ajuste conforme quiser
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/logo_login.png',
                width: 360, // ✓ Aqui você controla o tamanho
                height: 360,
              ),
            ),
          ), // Conteúdo (centralizado verticalmente com um padding superior)
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 150),

                    // ícone/logo do topo (você pode substituir)
                    const SizedBox(height: 40),

                    // Label Nome
                    Text(
                      t['label_name']!,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),

                    // Input customizado com ícone à esquerda e fundo arredondado
                    _buildRoundedInput(
                      controller: _nameCtrl,
                      hint: t['hint_name']!,
                      prefix: Icons.person,
                    ),

                    const SizedBox(height: 18),

                    // Label Senha
                    Text(
                      t['label_password']!,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(height: 8),

                    _buildRoundedInput(
                      controller: _passwordCtrl,
                      hint: t['hint_password']!,
                      prefix: Icons.vpn_key,
                      obscureText: true,
                    ),

                    const SizedBox(height: 22),

                    // Botão ENTRAR
                    Center(
                      child: ElevatedButton(
                        onPressed: _onSignInPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff055d55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 34,
                            vertical: 12,
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

                    const SizedBox(height: 12),

                    // ou
                    Center(
                      child: Text(
                        t['or']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Botão Entrar com Google (visual apenas)
                    Center(
                      child: OutlinedButton.icon(
                        onPressed: _onGooglePressed,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                        ),
                        icon: Image.asset(
                          'assets/images/logo_google.png',
                          width: 18,
                          height: 18,
                        ),
                        label: Text(
                          t['google']!,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // helper: campo com borda arredondada + ícone prefixo + fundo semitransparente
  Widget _buildRoundedInput({
    required TextEditingController controller,
    required String hint,
    required IconData prefix,
    bool obscureText = false,
  }) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            alignment: Alignment.center,
            child: Icon(prefix, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
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
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.white.withValues(alpha: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ações (no front-end sem backend apenas demo)
  void _onSignInPressed() {
    final name = _nameCtrl.text.trim();
    final pwd = _passwordCtrl.text.trim();

    // validações simples
    if (name.isEmpty || pwd.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Preencha todos os campos')));
      return;
    }

    // Aqui você pode navegar para a próxima tela. Exemplo:
    // Navigator.push(...);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Simulando login (front-only)')));
  }

  void _onGooglePressed() {
    // Por enquanto só um placeholder visual.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Google Sign-In (a integrar depois)')),
    );
  }
}
