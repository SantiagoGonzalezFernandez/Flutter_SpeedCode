import 'package:flutter/material.dart';
import 'package:web_app/components/default_button.dart';
import 'package:web_app/components/my_outline_button.dart';
import 'package:web_app/constants.dart';

import 'components/about_section_text.dart';
import 'components/about_text_with_sign.dart';
import 'components/experience_card.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1110
      ),
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AboutTextWithSign(),
              Expanded(
                child: AboutSectionText(
                  text: 'Anim aliquip aute deserunt excepteur excepteur culpa qui exercitation aliquip ullamco laboris dolore aute. Tempor laboris eu aute elit cillum nulla consectetur excepteur magna eiusmod laborum anim sunt commodo. Fugiat ut Lorem ullamco sunt excepteur dolor sit officia ad cillum ea quis.',
                ),
              ),
              ExperienceCard(numOfExp: '08'),
              Expanded(
                child: AboutSectionText(
                  text: 'Anim aliquip aute deserunt excepteur excepteur culpa qui exercitation aliquip ullamco laboris dolore aute. Tempor laboris eu aute elit cillum nulla consectetur excepteur magna eiusmod laborum anim sunt commodo. Fugiat ut Lorem ullamco sunt excepteur dolor sit officia ad cillum ea quis.',
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyOutlineButton(
                imageSrc: 'assets/images/hand.png',
                text: 'Hire Me!',
                press: (){},
              ),
              SizedBox(
                width: kDefaultPadding * 1.5,
              ),
              DefaultButton(
                imageSrc: 'assets/images/download.png',
                text: 'Download CV',
                press: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}





