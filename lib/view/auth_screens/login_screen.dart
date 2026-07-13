import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/view/dashboard/dashboard.dart';
import 'package:skill_link/view/auth_screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final RxBool otpSent = false.obs;
  final RxString phoneNumber = ''.obs;
  final RxInt countdown = 28.obs;
  final RxBool isLoading = false.obs;

  final List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes =
      List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    _phoneController.dispose();
    for (var c in otpControllers) c.dispose();
    for (var f in otpFocusNodes) f.dispose();
    super.dispose();
  }

  void startCountdown() {
    countdown.value = 28;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (countdown.value > 0) {
        countdown.value--;
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // ── BLUE TOP SECTION ──
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.28,
                        child: Stack(
                          children: [
                            Positioned(
                              right: -40,
                              top: 20,
                              child: Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.white.withOpacity(0.08),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 30,
                              top: 100,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.white.withOpacity(0.06),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28, top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Welcome\nBack!",
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w800,
                                      color: AppColor.white,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Sign in with your phone number to continue",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColor.white.withOpacity(0.85),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ── WHITE BOTTOM CARD ──
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColor.background,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 32),
                          child: Obx(() => otpSent.value
                              ? _buildOtpSection()
                              : _buildPhoneSection()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPhoneSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone Number",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColor.textPrimary,
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: AppColor.cardBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.grey200),
              ),
              child: const Row(
                children: [
                  Text(
                    "IN +91",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_drop_down, color: AppColor.primary, size: 20),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey200),
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.textPrimary,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Enter your mobile number",
                    hintStyle: TextStyle(color: AppColor.textHint, fontSize: 14),
                    border: InputBorder.none,
                    counterText: '',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        Obx(() => SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: isLoading.value
                    ? null
                    : () {
                        if (_phoneController.text.length == 10) {
                          phoneNumber.value = _phoneController.text;
                          isLoading.value = true;
                          Future.delayed(const Duration(seconds: 1), () {
                            isLoading.value = false;
                            otpSent.value = true;
                            startCountdown();
                          });
                        } else {
                          Get.snackbar(
                            'Error',
                            'Please enter a valid 10-digit number',
                            backgroundColor: AppColor.red,
                            colorText: AppColor.white,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: isLoading.value
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          color: AppColor.white,
                          strokeWidth: 2.5,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Send OTP",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward,
                              color: AppColor.white, size: 18),
                        ],
                      ),
              ),
            )),

        const SizedBox(height: 20),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text(
        //       "Don't have an account?",
        //       style: TextStyle(
        //         color: AppColor.textSecondary,
        //         fontSize: 14,
        //       ),
        //     ),
        //     InkWell(
        //       onTap: () => Get.to(() => const SignupScreen()),
        //       child: const Text(
        //         "  Sign Up",
        //         style: TextStyle(
        //           fontSize: 14,
        //           fontWeight: FontWeight.bold,
        //           color: AppColor.primary,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        const Spacer(),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 12, color: AppColor.textSecondary),
              children: [
                TextSpan(text: "By continuing, you agree to our "),
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.w600),
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
                child: Divider(color: AppColor.grey200, thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "OR ENTER OTP",
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primary,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const Expanded(
                child: Divider(color: AppColor.grey200, thickness: 1)),
          ],
        ),

        const SizedBox(height: 20),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style:
                  const TextStyle(fontSize: 13, color: AppColor.textSecondary),
              children: [
                const TextSpan(text: "Enter the 6-digit code sent to "),
                TextSpan(
                  text: "+91 ${phoneNumber.value}",
                  style: const TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 28),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) => _buildOtpBox(index)),
        ),

        const SizedBox(height: 20),

        Obx(() => Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 13, color: AppColor.textSecondary),
                  children: [
                    const TextSpan(text: "Didn't receive code? "),
                    TextSpan(
                      text: countdown.value > 0
                          ? "Resend in 00:${countdown.value.toString().padLeft(2, '0')}"
                          : "Resend",
                      style: TextStyle(
                        color: countdown.value > 0
                            ? AppColor.textSecondary
                            : AppColor.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            )),

        const SizedBox(height: 28),

        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: () {
              // Navigation to DashboardScreen (Removing 'const' as requested by turn context)
              Get.offAll(() => DashboardScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verify & Continue",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.check, color: AppColor.white, size: 18),
              ],
            ),
          ),
        ),

        const Spacer(),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 12, color: AppColor.textSecondary),
              children: [
                TextSpan(text: "By continuing, you agree to our "),
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.w600),
                ),
                TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 46,
      height: 54,
      child: TextField(
        controller: otpControllers[index],
        focusNode: otpFocusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColor.primary,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: AppColor.cardBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.grey200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.grey200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.primary, width: 2),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            otpFocusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            otpFocusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}
