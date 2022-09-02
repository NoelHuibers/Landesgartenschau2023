import 'package:flutter/material.dart';

/*
Die Datei ist für das Bilden der SearchBar
*/

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var styleActive =
        TextStyle(color: Theme.of(context).colorScheme.onBackground);
    var styleHint =
        TextStyle(color: Theme.of(context).colorScheme.onBackground);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceTint,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search,
              color: Theme.of(context).colorScheme.onBackground),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close,
                      color: Theme.of(context).colorScheme.onBackground),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
