import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:natureatoz/models/item.dart';
import 'package:natureatoz/pages/search/items/item_screen.dart';
import 'package:natureatoz/providers/items_provider.dart';
import 'package:provider/provider.dart';

class AccordionSunshine extends StatefulWidget {
  final Item item;
   late bool fav;
  final VoidCallback onFavoritePressed;
  AccordionSunshine({required this.item, required this.fav,required this.onFavoritePressed});

  @override
  _AccordionSunshineState createState() => _AccordionSunshineState();
}

class _AccordionSunshineState extends State<AccordionSunshine> {

  static const headerStyle = TextStyle(
      color: Color(0xFF222222), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentButton = TextStyle(
      color: Color(0xFF222222), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xFF8B8B8B), fontSize: 14, fontWeight: FontWeight.normal);

 void _toggleFavorite() {
    setState(() {
       widget.fav = !widget.fav;
      widget.onFavoritePressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon icon = widget.fav
        ? const Icon(
            Icons.favorite,
            size: 18,
            color: Colors.red,
          )
        : const Icon(
            Icons.favorite_border_outlined,
            size: 18,
            color: Color.fromARGB(255, 186, 186, 186),
          );

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
          leftIcon: widget.item.image != null && widget.item.image != ""
              ? const Icon(Icons.photo_size_select_actual,
                  color: Color(0xFF222222))
              : null,
          header: Text(widget.item.title, style: headerStyle),
          content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.item.description, style: contentStyle),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                         _toggleFavorite();
                      },
                      icon: icon,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 235, 235, 235),
                        ),
                      ),
                    ),
                    if (widget.item.image != null && widget.item.image != "")
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ItemScreen(itemActual: widget.item)),
                          );
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
                      ),
                  ],
                )
              ]),
        ),
      ],
    );
  }
}
