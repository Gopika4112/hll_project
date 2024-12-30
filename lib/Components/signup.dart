import 'package:flutter/material.dart';
import 'package:hll_project/Components/loginpage.dart';
import 'package:hll_project/Components/signup2.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtlr = TextEditingController();
  TextEditingController usernameCtlr = TextEditingController();
  TextEditingController emailCtlr = TextEditingController();
  TextEditingController passwordCtlr = TextEditingController();
  TextEditingController confirmPasswordCtlr = TextEditingController();
  TextEditingController dobCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.lightGreen[100],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Create your\naccount',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          height: 1.2),
                    ),

                    const SizedBox(height: 40),
                    _textField(
                      controller: nameCtlr,
                      label: "Full Name",
                      icon: Icons.person_outline,
                    ),
                    _textField(
                      controller: usernameCtlr,
                      label: 'Username',
                      icon: Icons.alternate_email,
                    ),
                    // const SizedBox(height: 20),
                    _textField(
                      controller: emailCtlr,
                      label: 'Email',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    // const SizedBox(height: 20),
                    _textField(
                      controller: passwordCtlr,
                      label: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    // const SizedBox(height: 20),
                    _textField(
                      controller: confirmPasswordCtlr,
                      label: 'Confirm Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      
                    ),
                    const SizedBox(height: 40),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PersonalInfo(),
                            ),
                          );
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        minimumSize: const Size.fromHeight(56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    // String? Function(String?)? validator,
    TextEditingController? confirmPasswordCtlr,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          prefixIcon: Icon(icon, color: Colors.grey.shade700),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700),
          ),
          filled: true,
          fillColor: Colors.lightGreen.shade50,
        ),
        
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return '*required';
          }
          return null;
        },
      ),
    );
  }
}
