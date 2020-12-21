import 'package:flutter/material.dart';

import '../services/auth_credentials.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback shouldShowLogin;
  final ValueChanged<SignUpCredentials> didProvideCredentials;

  SignUpPage({Key key, this.shouldShowLogin, this.didProvideCredentials})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children: [
            _signUpForm(),
            Container(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: widget.shouldShowLogin,
                child: Text(
                  'Already have an account? Login.',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
          decoration:
              InputDecoration(icon: Icon(Icons.person), labelText: 'Username'),
        ),
        TextField(
          controller: _emailController,
          decoration:
              InputDecoration(icon: Icon(Icons.mail), labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_open), labelText: 'Password'),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        FlatButton(
            onPressed: _signUp,
            child: Text('Sign Up'),
            color: Theme.of(context).accentColor)
      ],
    );
  }

  void _signUp() {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    print('username: $username');
    print('email: $email');
    print('password: $password');

    final credentails =
        SignUpCredentials(username: username, email: email, password: password);
    widget.didProvideCredentials(credentails);
  }
}
