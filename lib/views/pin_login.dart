import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:revisi_perdin/core/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revisi_perdin/views/home_page.dart';

class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  State<PinLogin> createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueMain,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "PERDIN MITRA10",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "PIN",
                        style: GoogleFonts.poppins(
                          color: blueMain,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Pinput(
                        onCompleted: (pin) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        onSubmitted: (pin) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        obscureText: true,
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        defaultPinTheme: PinTheme(
                          height: 40,
                          width: 40,
                          textStyle: GoogleFonts.poppins(
                            color: blueMain,
                            fontSize: 18,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                            border: Border.all(
                              color: blueMain,
                              width: 1.4,
                            ),
                          ),
                        ),
                      ),
                      // normalTextPinPutOrp(6, TextInputType.number,
                      //     controller.pinController, controller),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
