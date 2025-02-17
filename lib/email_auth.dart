import 'package:flutter/material.dart';
import 'package:sample_firebase/auth_func.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email/Password Auth'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      key: const ValueKey('username'),
                      decoration:
                          const InputDecoration(hintText: "enter username"),
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return "username is too small";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                    )
                  : Container(),
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(hintText: "enter your email"),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return "invalid email";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key: const ValueKey('password'),
                decoration:
                    const InputDecoration(hintText: "enter your password"),
                validator: (value) {
                  if (value.toString().length < 4) {
                    return "password is too small";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        isLogin? signin(email, password): signup(email, password);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    child: isLogin
                        ? const Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          )
                        : const Text(
                            'Signup',
                            style: TextStyle(color: Colors.black),
                          ),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? const Text("don't have an account? signup")
                      : const Text('Already signup? Login'))
            ],
          ),
        ),
      ),
    );
  }
}
