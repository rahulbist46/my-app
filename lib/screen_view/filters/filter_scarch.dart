import 'package:flutter/material.dart';

 FilterSearch() {
  return Column(
    children: [
      SingleChildScrollView(
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: const Color(0xFFF5F4F8),
            filled: true,
            suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            prefixIcon: const Icon(Icons.add),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
        ),

      ),

    ],
  );
}
