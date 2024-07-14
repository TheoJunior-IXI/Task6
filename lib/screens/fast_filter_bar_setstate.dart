import 'package:flutter/material.dart';

class FastFilterBarUsingState extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemTap;

  const FastFilterBarUsingState(
      {super.key, required this.items, required this.onItemTap});

  @override
  _FastFilterBarState createState() => _FastFilterBarState();
}

class _FastFilterBarState extends State<FastFilterBarUsingState> {
  String _selectedItem = '';

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedItem = widget.items[index];
              });
              widget.onItemTap(widget.items[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _selectedItem == widget.items[index]
                    ? Colors.red
                    : Colors.grey,
              ),
              child: Text(
                widget.items[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}