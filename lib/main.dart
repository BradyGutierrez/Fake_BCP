import 'package:flutter/material.dart';

void main() {
  runApp(const DemoBankApp());
}

// ============================================================
// APP
// ============================================================

class DemoBankApp extends StatelessWidget {
  const DemoBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BCP',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0066CC)),
      ),
      home: const LoginScreen(),
    );
  }
}

// ============================================================
// LOGIN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController creditController = TextEditingController(
    text: '******2610',
  );

  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  static const Color blue = Color(0xFF0066CC);

  void login() {
    if (creditController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
    }
  }

  void cambiarCredito() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cambio de crédito simulado')));
  }

  @override
  void dispose() {
    creditController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ==================================================
              // HEADER LOGIN
              // ==================================================
              SizedBox(
                width: double.infinity,
                height: 165,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: HeaderWaveClipper(),
                      child: Container(
                        width: double.infinity,
                        height: 165,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF004FA8),
                              Color(0xFF0078D7),
                              Color(0xFF1595E8),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 28,
                      bottom: 45,
                      child: SizedBox(
                        width: 145,
                        height: 65,
                        child: Image.asset(
                          'assets/images/logo_banco.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // CONTENIDO LOGIN
              // ==================================================
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 45),
                child: Column(
                  children: [
                    const Text(
                      'Hola',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: blue,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      '¡Qué bueno tenerte aquí!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 23, color: Colors.black87),
                    ),

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _OrangeActionButton(
                          icon: Icons.more_horiz,
                          onTap: () {},
                        ),
                        _OrangeActionButton(
                          icon: Icons.qr_code_2,
                          onTap: () {},
                        ),
                        _OrangeActionButton(
                          icon: Icons.lock_outline,
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 38),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _OrangeActionButton(
                          icon: Icons.lock_outline,
                          onTap: () {},
                        ),
                        _OrangeActionButton(
                          icon: Icons.water_drop_outlined,
                          onTap: () {},
                        ),
                        _OrangeActionButton(icon: Icons.send, onTap: () {}),
                      ],
                    ),

                    const SizedBox(height: 48),

                    _CreditCard(
                      controller: creditController,
                      onChange: cambiarCredito,
                    ),

                    const SizedBox(height: 18),

                    _PasswordCard(
                      controller: passwordController,
                      obscurePassword: obscurePassword,
                      onToggle: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),

                    const SizedBox(height: 38),

                    _LoginButton(onPressed: login),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CREDITO LOGIN
// ============================================================

class _CreditCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChange;

  const _CreditCard({required this.controller, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE3E8EF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F0FC),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.credit_card_rounded,
                  color: Color(0xFF0066CC),
                ),
              ),

              const SizedBox(width: 13),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CREDITO',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF59636F),
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Tarjeta principal',
                      style: TextStyle(fontSize: 12, color: Color(0xFF8A939E)),
                    ),
                  ],
                ),
              ),

              TextButton(
                onPressed: onChange,
                child: const Text(
                  'Cambiar',
                  style: TextStyle(
                    color: Color(0xFFFF8500),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE7EBF0)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.credit_card,
                  size: 20,
                  color: Color(0xFF6F7883),
                ),
                const SizedBox(width: 10),
                Text(
                  controller.text,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8,
                    color: Color(0xFF242A31),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CLAVE INTERNET LOGIN
// ============================================================

class _PasswordCard extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback onToggle;

  const _PasswordCard({
    required this.controller,
    required this.obscurePassword,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 10, 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE3E8EF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFE5F0FC),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.lock_outline_rounded,
              color: Color(0xFF0066CC),
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscurePassword,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
                isDense: true,
                hintText: 'Clave de internet',
                hintStyle: TextStyle(color: Color(0xFF89929D), fontSize: 16),
              ),
            ),
          ),

          IconButton(
            onPressed: onToggle,
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: const Color(0xFF737C86),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// BOTON INGRESAR
// ============================================================

class _LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _LoginButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFA21A), Color(0xFFFF8500)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.30),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          child: const Text(
            'INGRESAR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBalance = false;

  // ESTE ES EL MONTO INICIAL.
  // SOLO CAMBIA SI TÚ LO MODIFICAS MANUALMENTE.
  double personalBalance = 7228.90;

  String formatMoney(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }

  // ==========================================================
  // ERROR TRANSFERENCIA
  // ==========================================================

  void showTransferError() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          icon: const Icon(
            Icons.cloud_off_rounded,
            color: Color(0xFFE56D2F),
            size: 48,
          ),

          title: const Text(
            'No se pudo cargar esta ventana',
            textAlign: TextAlign.center,
          ),

          content: const Text(
            'Inténtelo más tarde.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),

          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Aceptar',
                  style: TextStyle(
                    color: Color(0xFFE56D2F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // PERSONAL BRADY
  // ==========================================================

  void openPersonalAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalAccountScreen(
          initialBalance: personalBalance,

          onBalanceChanged: (newBalance) {
            setState(() {
              personalBalance = newBalance;
            });
          },

          onTransferPressed: showTransferError,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF9),

      body: SafeArea(
        child: Column(
          children: [
            // ==================================================
            // HEADER
            // ==================================================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 26),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF071BFF), Color(0xFF1239E8)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo_banco.png',
                        width: 105,
                        height: 45,
                        fit: BoxFit.contain,
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.headset_mic_outlined,
                        color: Colors.white,
                        size: 28,
                      ),

                      const SizedBox(width: 18),

                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 29,
                          ),

                          Positioned(
                            right: -1,
                            top: 1,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF8500),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Hola, BRADY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // CONTENIDO
            // ==================================================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 25, 22, 100),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // TUS PRODUCTOS
                    Row(
                      children: [
                        const Text(
                          'Tus productos',
                          style: TextStyle(
                            color: Color(0xFF4B4B91),
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              showBalance = !showBalance;
                            });
                          },

                          icon: Icon(
                            showBalance
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF64748B),
                          ),
                        ),

                        IconButton(
                          onPressed: () {},

                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // PERSONAL BRADY
                    GestureDetector(
                      onTap: openPersonalAccount,

                      child: _ProductTile(
                        title: 'Personal Brady',
                        number: '**** 0001',
                        balance: showBalance
                            ? 'S/ ${formatMoney(personalBalance)}'
                            : 'S/ *****',
                        enabled: true,
                      ),
                    ),

                    // YAPE
                    _ProductTile(
                      title: 'Cuenta YAPE Soles',
                      number: '**** 4090',
                      balance: 'S/ *****',
                      enabled: false,
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: TextButton(
                        onPressed: () {},

                        child: const Text(
                          'Ver todos',
                          style: TextStyle(
                            color: Color(0xFFE56D2F),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ==================================================
                    // ACCIONES
                    // ==================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        _HomeAction(
                          icon: Icons.swap_horiz_rounded,
                          title: 'Transferir',
                          subtitle: 'dinero',
                          onTap: showTransferError,
                        ),

                        _HomeAction(
                          icon: Icons.water_drop_outlined,
                          title: 'Pagar',
                          subtitle: 'servicios',
                          onTap: () {},
                        ),

                        _HomeAction(
                          icon: Icons.send_outlined,
                          title: 'Yapear a',
                          subtitle: 'celular',
                          onTap: () {},
                        ),

                        _HomeAction(
                          icon: Icons.qr_code_2_rounded,
                          title: 'Pagar',
                          subtitle: 'con QR',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 34),

                    // ==================================================
                    // DESTACADOS
                    // ==================================================
                    const Text(
                      'Lo más destacado',
                      style: TextStyle(
                        color: Color(0xFF4B4B91),
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 14),

                    SizedBox(
                      height: 125,

                      child: ListView(
                        scrollDirection: Axis.horizontal,

                        children: [
                          _HighlightCard(
                            title: 'Ahorra con Wardaditos',
                            subtitle: 'La alcancía virtual del BCP',
                            isNew: true,
                          ),

                          const SizedBox(width: 14),

                          _HighlightCard(
                            title: 'Actualiza tus datos',
                            subtitle: 'Mejora tu nivel de seguridad',
                            isNew: false,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: List.generate(
                        7,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: index == 2
                                ? const Color(0xFF2045E8)
                                : const Color(0xFFD1D5DB),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const _BottomNavigation(),
    );
  }
}

// ============================================================
// PERSONAL BRADY
// ============================================================

class PersonalAccountScreen extends StatefulWidget {
  final double initialBalance;

  final Function(double) onBalanceChanged;

  final VoidCallback onTransferPressed;

  const PersonalAccountScreen({
    super.key,
    required this.initialBalance,
    required this.onBalanceChanged,
    required this.onTransferPressed,
  });

  @override
  State<PersonalAccountScreen> createState() => _PersonalAccountScreenState();
}

class _PersonalAccountScreenState extends State<PersonalAccountScreen> {
  late double balance;

  @override
  void initState() {
    super.initState();
    balance = widget.initialBalance;
  }

  String formatMoney(double value) {
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }

  // ==========================================================
  // MOVIMIENTOS
  // ==========================================================

  final List<Map<String, dynamic>> movements = [
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '08 Octubre',
      'amount': 'S/ -8.50',
      'negative': true,
    },
    {
      'initials': 'OX',
      'title': 'OXXO',
      'date': '08 Octubre',
      'amount': 'S/ -12.90',
      'negative': true,
    },
    {
      'initials': 'YM',
      'title': 'YouTube Music',
      'date': '07 Octubre',
      'amount': 'S/ -20.90',
      'negative': true,
    },
    {
      'initials': 'GO',
      'title': 'Google',
      'date': '07 Octubre',
      'amount': 'S/ -4.90',
      'negative': true,
    },
    {
      'initials': 'SP',
      'title': 'Spotify',
      'date': '06 Octubre',
      'amount': 'S/ -24.90',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '05 Octubre',
      'amount': 'S/ -6.50',
      'negative': true,
    },
    {
      'initials': 'RI',
      'title': 'Rappi',
      'date': '05 Octubre',
      'amount': 'S/ -18.90',
      'negative': true,
    },
    {
      'initials': 'MC',
      'title': 'McDonald\'s',
      'date': '04 Octubre',
      'amount': 'S/ -15.90',
      'negative': true,
    },
    {
      'initials': 'OX',
      'title': 'OXXO',
      'date': '04 Octubre',
      'amount': 'S/ -9.50',
      'negative': true,
    },
    {
      'initials': 'GO',
      'title': 'Google YouTube',
      'date': '03 Octubre',
      'amount': 'S/ -8.92',
      'negative': true,
    },
    {
      'initials': 'PL',
      'title': 'Plaza Vea',
      'date': '03 Octubre',
      'amount': 'S/ -32.40',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '02 Octubre',
      'amount': 'S/ -7.80',
      'negative': true,
    },
    {
      'initials': 'IN',
      'title': 'Inkafarma',
      'date': '02 Octubre',
      'amount': 'S/ -16.50',
      'negative': true,
    },
    {
      'initials': 'UB',
      'title': 'Uber',
      'date': '01 Octubre',
      'amount': 'S/ -11.90',
      'negative': true,
    },
    {
      'initials': 'CA',
      'title': 'Cafetería',
      'date': '01 Octubre',
      'amount': 'S/ -7.50',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '30 Septiembre',
      'amount': 'S/ -5.90',
      'negative': true,
    },
    {
      'initials': 'OX',
      'title': 'OXXO',
      'date': '29 Septiembre',
      'amount': 'S/ -13.50',
      'negative': true,
    },
    {
      'initials': 'YT',
      'title': 'YouTube Premium',
      'date': '28 Septiembre',
      'amount': 'S/ -20.90',
      'negative': true,
    },
    {
      'initials': 'ST',
      'title': 'Starbucks',
      'date': '28 Septiembre',
      'amount': 'S/ -14.00',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '27 Septiembre',
      'amount': 'S/ -10.20',
      'negative': true,
    },
    {
      'initials': 'MA',
      'title': 'Mantenimiento cuenta',
      'date': '26 Septiembre',
      'amount': 'S/ 0.00',
      'negative': false,
    },
    {
      'initials': 'GO',
      'title': 'Google Play',
      'date': '25 Septiembre',
      'amount': 'S/ -6.90',
      'negative': true,
    },
    {
      'initials': 'RA',
      'title': 'Restaurante',
      'date': '24 Septiembre',
      'amount': 'S/ -28.00',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '23 Septiembre',
      'amount': 'S/ -9.30',
      'negative': true,
    },
    {
      'initials': 'OX',
      'title': 'OXXO',
      'date': '22 Septiembre',
      'amount': 'S/ -8.70',
      'negative': true,
    },
    {
      'initials': 'MO',
      'title': 'Movistar',
      'date': '21 Septiembre',
      'amount': 'S/ -29.90',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '20 Septiembre',
      'amount': 'S/ -6.80',
      'negative': true,
    },
    {
      'initials': 'YA',
      'title': 'Yape',
      'date': '19 Septiembre',
      'amount': 'S/ -15.00',
      'negative': true,
    },
    {
      'initials': 'PL',
      'title': 'Plaza Vea',
      'date': '18 Septiembre',
      'amount': 'S/ -24.60',
      'negative': true,
    },
    {
      'initials': 'TA',
      'title': 'Tambo',
      'date': '17 Septiembre',
      'amount': 'S/ -5.50',
      'negative': true,
    },
  ];

  // ==========================================================
  // MODIFICAR SALDO
  // ==========================================================

  void editBalance() {
    final controller = TextEditingController(text: balance.toStringAsFixed(2));

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text('Modificar saldo'),

          content: TextField(
            controller: controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),

            decoration: InputDecoration(
              prefixText: 'S/ ',
              hintText: 'Ej. 7000',
              filled: true,
              fillColor: const Color(0xFFF5F7FA),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),

            ElevatedButton(
              onPressed: () {
                final value = double.tryParse(
                  controller.text.replaceAll(',', '.'),
                );

                if (value != null && value >= 0) {
                  setState(() {
                    balance = value;
                  });

                  widget.onBalanceChanged(value);

                  Navigator.pop(context);
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7200),
                foregroundColor: Colors.white,
              ),

              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF9),

      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppBar(
        backgroundColor: const Color(0xFF071BFF),

        foregroundColor: Colors.white,

        elevation: 0,

        title: const Text(
          'Cuentas',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(Icons.arrow_back, size: 30),
        ),
      ),

      // ========================================================
      // CONTENIDO
      // ========================================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 110),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ==================================================
            // DATOS
            // ==================================================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Personal Brady',
                        style: TextStyle(
                          color: Color(0xFF565656),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        '21570747090001',
                        style: TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'CCI: 00221517074709000129',
                        style: TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFFE56D2F),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.share_outlined,
                        color: Color(0xFFE56D2F),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // ==================================================
            // SALDO
            // ==================================================
            const Text(
              'Disponible',
              style: TextStyle(color: Color(0xFF777777), fontSize: 18),
            ),

            const SizedBox(height: 3),

            GestureDetector(
              onTap: editBalance,

              child: Row(
                children: [
                  Text(
                    'S/ ${formatMoney(balance)}',

                    style: const TextStyle(
                      color: Color(0xFF303AA0),
                      fontSize: 45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(
                    Icons.edit_outlined,
                    color: Color(0xFFE56D2F),
                    size: 21,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Container(height: 1, color: const Color(0xFFE1E1E1)),

            const SizedBox(height: 25),

            // ==================================================
            // ACCIONES
            // ==================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _AccountAction(
                  icon: Icons.swap_horiz_rounded,
                  title: 'Transferir',
                  subtitle: 'dinero',
                  onTap: widget.onTransferPressed,
                ),

                _AccountAction(
                  icon: Icons.water_drop_outlined,
                  title: 'Pagar',
                  subtitle: 'servicios',
                  onTap: () {},
                ),

                _AccountAction(
                  icon: Icons.savings_outlined,
                  title: 'Ahorra con',
                  subtitle: 'Wardaditos',
                  onTap: () {},
                ),

                _AccountAction(
                  icon: Icons.more_horiz,
                  title: 'Más',
                  subtitle: '',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 35),

            Container(height: 1, color: const Color(0xFFE1E1E1)),

            const SizedBox(height: 28),

            // ==================================================
            // MOVIMIENTOS
            // ==================================================
            Row(
              children: [
                const Text(
                  'Movimientos',
                  style: TextStyle(
                    color: Color(0xFF303AA0),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                TextButton(
                  onPressed: () {},

                  child: const Text(
                    'Ver más',
                    style: TextStyle(color: Color(0xFFE56D2F), fontSize: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Octubre 2026',
              style: TextStyle(color: Color(0xFF777777), fontSize: 17),
            ),

            const SizedBox(height: 10),

            // ==================================================
            // 30 MOVIMIENTOS
            // ==================================================
            ...movements.map((movement) {
              return _Movement(
                initials: movement['initials'],
                title: movement['title'],
                date: movement['date'],
                amount: movement['amount'],
                negative: movement['negative'],
              );
            }),
          ],
        ),
      ),

      bottomNavigationBar: const _BottomNavigation(),
    );
  }
}

// ============================================================
// PRODUCTO
// ============================================================

class _ProductTile extends StatelessWidget {
  final String title;
  final String number;
  final String balance;
  final bool enabled;

  const _ProductTile({
    required this.title,
    required this.number,
    required this.balance,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.85,

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),

        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFE2E2E2))),
        ),

        child: Row(
          children: [
            Container(
              width: 43,
              height: 43,

              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF2F2F2),
              ),

              child: Padding(
                padding: const EdgeInsets.all(7),

                child: Image.asset(
                  'assets/images/logo_banco.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFF565656),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    number,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF929292),
                    ),
                  ),
                ],
              ),
            ),

            Text(
              balance,
              style: const TextStyle(fontSize: 16, color: Color(0xFF565656)),
            ),

            const SizedBox(width: 7),

            const Icon(Icons.chevron_right, color: Color(0xFF9B9B9B)),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ACCIONES HOME
// ============================================================

class _HomeAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _HomeAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: SizedBox(
        width: 72,

        child: Column(
          children: [
            Container(
              width: 58,
              height: 58,

              decoration: const BoxDecoration(
                color: Color(0xFFF36F18),
                shape: BoxShape.circle,
              ),

              child: Icon(icon, color: Colors.white, size: 30),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF666666), fontSize: 13),
            ),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF666666), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ACCIONES CUENTA
// ============================================================

class _AccountAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _AccountAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: SizedBox(
        width: 76,

        child: Column(
          children: [
            Container(
              width: 58,
              height: 58,

              decoration: const BoxDecoration(
                color: Color(0xFFF36F18),
                shape: BoxShape.circle,
              ),

              child: Icon(icon, color: Colors.white, size: 29),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF666666), fontSize: 13),
            ),

            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF666666), fontSize: 13),
              ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DESTACADOS
// ============================================================

class _HighlightCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isNew;

  const _HighlightCard({
    required this.title,
    required this.subtitle,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFE4E4E4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                width: 38,
                height: 38,

                decoration: const BoxDecoration(
                  color: Color(0xFFE7E9FF),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.savings_outlined,
                  color: Color(0xFF303AA0),
                ),
              ),

              const SizedBox(height: 9),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF555555),
                ),
              ),

              const SizedBox(height: 3),

              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: Color(0xFF888888)),
              ),
            ],
          ),

          if (isNew)
            Positioned(
              right: 0,
              top: 0,

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 4,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFF172DDB),

                  borderRadius: BorderRadius.circular(10),
                ),

                child: const Text(
                  'Nuevo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================
// MOVIMIENTO
// ============================================================

class _Movement extends StatelessWidget {
  final String initials;
  final String title;
  final String date;
  final String amount;
  final bool negative;

  const _Movement({
    required this.initials,
    required this.title,
    required this.date,
    required this.amount,
    required this.negative,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),

      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE3E3E3))),
      ),

      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,

            decoration: const BoxDecoration(
              color: Color(0xFF2449E8),
              shape: BoxShape.circle,
            ),

            alignment: Alignment.center,

            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(
              color: negative
                  ? const Color(0xFFB43C52)
                  : const Color(0xFF555555),

              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(width: 10),

          const Icon(Icons.chevron_right, color: Color(0xFF5A60A8)),
        ],
      ),
    );
  }
}

// ============================================================
// BOTONES LOGIN
// ============================================================

class _OrangeActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _OrangeActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 76,
        height: 76,

        decoration: const BoxDecoration(
          color: Color(0xFFFF9200),
          shape: BoxShape.circle,
        ),

        child: Icon(icon, color: Colors.white, size: 37),
      ),
    );
  }
}

// ============================================================
// CURVA LOGIN
// ============================================================

class HeaderWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height - 40);

    path.quadraticBezierTo(
      size.width * 0.78,
      size.height,
      size.width * 0.50,
      size.height - 22,
    );

    path.quadraticBezierTo(
      size.width * 0.22,
      size.height - 45,
      0,
      size.height - 22,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// ============================================================
// BARRA INFERIOR
// ============================================================

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),

      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              _NavItem(
                icon: Icons.home_rounded,
                label: 'Inicio',
                selected: true,
              ),

              _NavItem(icon: Icons.swap_horiz_rounded, label: 'Operaciones'),

              _NavItem(icon: Icons.shopping_cart_outlined, label: 'Para ti'),

              _NavItem(icon: Icons.settings_outlined, label: 'Configuración'),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// NAV ITEM
// ============================================================

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),

          decoration: selected
              ? BoxDecoration(
                  color: const Color(0xFFDCEBFF),
                  borderRadius: BorderRadius.circular(20),
                )
              : null,

          child: Icon(
            icon,

            color: selected ? const Color(0xFF1436D9) : const Color(0xFF8D949D),

            size: 24,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          label,

          style: TextStyle(
            color: selected ? const Color(0xFF4A4A4A) : const Color(0xFF999999),

            fontSize: 11,

            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
