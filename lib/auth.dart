import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AuthMode { login, signUp }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode activeMode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(child: SvgPicture.asset('img/icons/logo.svg')),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _PageTabButton(
                            mode: AuthMode.login,
                            isActive: activeMode == AuthMode.login,
                            onTap: () =>
                                setState(() => activeMode = AuthMode.login),
                          ),
                          _PageTabButton(
                            mode: AuthMode.signUp,
                            isActive: activeMode == AuthMode.signUp,
                            onTap: () =>
                                setState(() => activeMode = AuthMode.signUp),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(32),
                            child: _AuthForm(mode: activeMode),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  final AuthMode mode;
  const _AuthForm({required this.mode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mode == AuthMode.login ? "Welcome back" : "Welcome To App",
          style: const TextStyle(
            fontFamily: "Avenir",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          mode == AuthMode.login
              ? "Sign in with your account"
              : "Create your new account",
          style: const TextStyle(
            fontFamily: "Avenir",
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 32),

        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: UnderlineInputBorder(),
          ),
        ),

        if (mode == AuthMode.signUp) ...[
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: UnderlineInputBorder(),
            ),
          ),
        ],

        const SizedBox(height: 20),
        const _PasswordTextField(),

        const SizedBox(height: 32),

        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              mode == AuthMode.login ? "LOGIN" : "SIGN UP",
              style: const TextStyle(
                fontFamily: "Avenir",
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        if (mode == AuthMode.login)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Forget your password?",
                style: TextStyle(fontFamily: "Avenir"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Reset here",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),

        const SizedBox(height: 30),
        Center(
          child: Text(
            mode == AuthMode.login ? "OR SIGN IN WITH" : "OR SIGN UP WITH",
            style: const TextStyle(
              fontFamily: "Avenir",
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("img/icons/Google.png", width: 40),
            Image.asset("img/icons/Facebook.png", width: 40),
            Image.asset("img/icons/Twitter.png", width: 40),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _PageTabButton extends StatelessWidget {
  final AuthMode mode;
  final bool isActive;
  final VoidCallback onTap;

  const _PageTabButton({
    required this.mode,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        mode == AuthMode.login ? "LOGIN" : "SIGN UP",
        style: TextStyle(
          fontFamily: "Avenir",
          fontSize: 18,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.white : Colors.white54,
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({super.key});

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const UnderlineInputBorder(),
        suffix: TextButton(
          onPressed: () => setState(() => _obscureText = !_obscureText),
          child: Text(_obscureText ? "Show" : "Hide"),
        ),
      ),
    );
  }
}
