import 'package:edhippo/ui_halper/util_colore.dart';
import 'package:edhippo/ui_halper/util_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modal/school_details/details_modal.dart';


imageView(){
  return Column(
    children: [
      Stack(
        children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              decoration: BoxDecoration(
                color: greenColor(),
                borderRadius: BorderRadius.circular(11),
              ),
              padding: const EdgeInsets.all(11),
              child: Text(
                '',
                style: bodyText12(
                    color: whiteColor()), // Use your custom text style here
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '',
              style: headingText24(),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: greenColor1(),
                ),
                const SizedBox(width: 1),
                Text(
                  '',
                  style: bodyText12(color: greenColor1()),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                height: 2,
                color: greenColor().withOpacity(0.4))
          ],
        ),
      ),
    ],
  );

}







allSchoolDetails( ){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(

      children: [


        Text("Boards",style: headingText20(fontWeight: FontWeight.w500),),
        Container(
          height: 40,
          decoration:BoxDecoration(
            color: bgColor1(),
            borderRadius: BorderRadius.circular(11)
          ),
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(''),
          ),
        )
      ],
    ),
  );
}

categoriesDetails( ){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [


        Text("Categories",style: headingText20(fontWeight: FontWeight.w500),),
        Container(

          decoration:BoxDecoration(
              color: bgColor1(),
              borderRadius: BorderRadius.circular(11)
          ),
          child:  const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(''),
          ),
        )
      ],
    ),
  );
}

Widget schoolAbout(  final DetailsModal detailsModal) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "School",
          style: headingText20(fontWeight: FontWeight.w500),
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: greenColor().withOpacity(0.4),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildInfoRow('Chairman', detailsModal.chairman), // Adjusted call to _buildInfoRow
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value),
      ],
    ),
  );
}


schoolFacilities(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("School Facilities",style: headingText20(fontWeight: FontWeight.w500),),
        Container(
          height: 40,
          decoration:BoxDecoration(
              color: bgColor1(),
              borderRadius: BorderRadius.circular(11)
          ),
          child:  Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: const NetworkImage(''),
                backgroundColor: bgColor(),


              ),
              const Text(''),
            ],
          ),

        )
      ],
    ),
  );
}