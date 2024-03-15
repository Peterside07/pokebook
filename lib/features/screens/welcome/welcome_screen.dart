import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokebook/features/screens/bloc/pokebook_home.dart';

import '../../../core/widgets/app_input.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        // Background Image
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        // Blue Overlay
        Container(
          color: Colors.white.withOpacity(0.9),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),

              SvgPicture.asset(
                
                   Theme.of(context).brightness == Brightness.light
                ? "assets/images/landinglogo.svg"
                : 'assets/images/landing_logo_blue.svg',
               
                  width: 315, height: 241),
              const SizedBox(height: 20),
              SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.light
                ? 'assets/images/pokebook.svg'
                : 'assets/images/poke_book_logo.svg',
             
              ),
              const SizedBox(height: 20),
              Text(
                'Largest Pokémon index with information about every Pokemon you can think of.',
                textAlign: TextAlign.center,
                style: GoogleFonts.sofiaSans(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 70),
              InkResponse(
                onTap: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PokeBookHome()));
                },
                child: AppInput(
                  
                  enabled: false,
                  placeholder: 'Enter pokemon name',
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? const Color(0xffDE527F)
                            : const Color(0xff39BADF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                
                    ),
                  ),
                  onChanged: (val) {
                    
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PokeBookHome()));
                  },
                  child: Text(
                    'View all',
                    style: GoogleFonts.sofiaSans(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        color: Colors.black),
                  )),
            ],
          ),
        ),
      ]),
    ));
  }
}
