import 'package:flutter/material.dart';
import 'info_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();

  final List<String> _countries = [
    'Kazakhstan',
    'Russia',
    'Uzbekistan',
    'Kyrgyzstan',
    'China',
    'USA',
    'South Korea',
    'Canada',
    'Turkey',
    'Mexico',
  ];

  String? _selectedCountry;

  final TextEditingController _story = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 10),

            TextField(
              controller: _name,
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'What do people call you?',
                prefixIcon: Icon(Icons.person, color: Colors.blue),
                suffixIcon: IconButton(
                  onPressed: () {
                    _name.clear();
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: '+X(XXX)XX-XXXX',
                prefixIcon: const Icon(Icons.phone, color: Colors.blue),
                suffixIcon: IconButton(
                  onPressed: () {
                    _phone.clear();
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@email.com',
                prefixIcon: const Icon(Icons.email, color: Colors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),

              child: DropdownButton<String>(
                hint: const Text('Country?'),
                value: _selectedCountry,
                isExpanded: true,
                underline: const SizedBox(),

                items: _countries.map((country) {
                  return DropdownMenuItem(value: country, child: Text(country));
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    _selectedCountry = value;
                  });
                },
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: _story,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Life Story',
                hintText: 'Tell us about yourself...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: _password,
              obscureText: !_showPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _confirmPassword,
              obscureText: !_showPassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Are you sure you want to submit?'),

                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InfoPage(
                                    name: _name.text,
                                    phone: _phone.text,
                                    email: _email.text,
                                    country: _selectedCountry,
                                    story: _story.text,
                                  ),
                                ),
                              );
                            },
                            child: Text('Verified'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Submit', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
