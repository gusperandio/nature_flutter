import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:natureatoz/models/item.dart';

class AccordionSunshine extends StatelessWidget {
  final Item item;
  static const headerStyle = TextStyle(
      color: Color(0xFF222222), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentButton = TextStyle(
      color: Color(0xFF222222), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xFF8B8B8B), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionSunshine({required this.item});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBorderColor: Colors.black,
      headerBorderColorOpened: Colors.black,
      headerBorderWidth: 1.1,
      headerBackgroundColor: Colors.amber,
      headerBackgroundColorOpened: Color(0xffF28705),
      contentBackgroundColor: Colors.white,
      contentBorderColor: Colors.black,
      contentBorderWidth: 1,
      contentHorizontalPadding: 20,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      paddingBetweenClosedSections: 0,
      disableScrolling: true,
      children: [
        AccordionSection(
          isOpen: false,
          contentVerticalPadding: 20,
          leftIcon: item.image != null && item.image != ""
              ? const Icon(Icons.photo_size_select_actual,
                  color: Color(0xFF222222))
              : null,
          header: Text(item.title, style: headerStyle),
          content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(item.description, style: contentStyle),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (item.image != null && item.image != "")
                      OutlinedButton.icon(
                        onPressed: () {
                        
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          size: 18,
                          color: Color(0xFF222222),
                        ),
                        label: const Text(
                          "Visualizar",
                          style: contentButton,
                        ),
                      )
                    else
                      IconButton.filled(
                        onPressed: () {
                         
                        },
                        icon: const Icon(
                          Icons.favorite,
                          size: 18,
                          color: Color(0xFFf23030),
                        ),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 235, 235, 235)),
                        ),
                      ),
                  ],
                )
              ]),
        ),
      ],
    );
  }
}
