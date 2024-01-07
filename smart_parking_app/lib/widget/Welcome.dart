// lib/screens/welcome.dart
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smart_parking_app/widget/Dashboard.dart';
import 'register.dart';

class WelcomeScreen extends StatelessWidget {
  final List<WelcomeSlide> slides = [
    WelcomeSlide(
      title: 'Find Parking Spaces',
      description: 'Locate available parking spaces nearby using our app.',
      imagePath: 'assets/slide1.jpg', // Replace with your image path
    ),
    WelcomeSlide(
      title: 'Reserve Your Spot',
      description: 'Reserve parking spots in advance to save time and effort.',
      imagePath: 'assets/slide2.jpg', // Replace with your image path
    ),
    WelcomeSlide(
      title: 'Track Your History',
      description: 'Keep track of your parking history and payments with ease.',
      imagePath: 'assets/slide3.jpg', // Replace with your image path
    ),
    WelcomeSlide(
      title: 'User-Friendly Experience',
      description: 'Enjoy a user-friendly interface for a seamless parking experience.',
      imagePath: 'assets/slide4.jpg', // Replace with your image path
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return WelcomeSlideWidget(
            title: slides[index].title,
            description: slides[index].description,
            imagePath: slides[index].imagePath,
          );
        },
        itemCount: slides.length,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        loop: false,
        onTap: (index) {
          if (index == slides.length - 1) {
            // If the last slide is tapped, navigate to RegisterScreen
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
          }
        },
      ),
    );
  }
}

class WelcomeSlide {
  final String title;
  final String description;
  final String imagePath;

  WelcomeSlide({required this.title, required this.description, required this.imagePath});
}

class WelcomeSlideWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  WelcomeSlideWidget({required this.title, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
