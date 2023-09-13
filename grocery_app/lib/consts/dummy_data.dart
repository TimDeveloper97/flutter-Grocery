class DummyData {
  static const List<Map<String, dynamic>> _menus = [
    {
      "id": "6",
      "number": "1",
      "title": "Nutritional cereals",
      "subTitle": "whole grains",
      "description":
          "Breakfast cereal is a breakfast food made from processed cereal grains. It is traditionally eaten as part of breakfast, or a snack food, primarily in Western societies.\nAlthough warm cereals like porridge and grits have the longest history, ready-to-eat cold cereals appeared around the late 19th century and are most often mixed with dairy products, traditionally cow's milk. They can also be paired with yogurt or plant-based milks, or eaten plain. Fruit or nuts are sometimes added. Many cereals are produced via extrusion.",
      "price": "110.4",
      "icon": "assets/images/cat/nuts.png"
    },
    {
      "id": "5",
      "number": "1",
      "title": "Dried fruit",
      "description":
          "Dried fruit is fruit from which the majority of the original water content has been removed either naturally, through sun drying, or through the use of specialized dryers or dehydrators. Dried fruit has a long tradition of use dating back to the fourth millennium BC in Mesopotamia, and is prized because of its sweet taste, nutritive value, and long shelf life.",
      "subTitle": "clean fruit",
      "price": "8.4",
      "icon": "assets/images/cat/fruits.png"
    },
    {
      "id": "4",
      "number": "1",
      "title": "Grains and cereals",
      "description":
          "Grains refer to any type of seed that can be ground into flour or used for food, while cereals are specifically derived from grasses such as wheat, rice, and corn. Both offer a range of nutritional benefits, including fiber, vitamins, minerals, and protein.",
      "subTitle": "whole grains",
      "price": "19.2",
      "icon": "assets/images/cat/grains.png"
    },
    {
      "id": "3",
      "number": "1",
      "title": "Spices",
      "description":
          "A spice is a seed, fruit, root, bark, or other plant substance primarily used for flavoring or coloring food. Spices are distinguished from herbs, which are the leaves, flowers, or stems of plants used for flavoring or as a garnish. Spices are sometimes used in medicine, religious rituals, cosmetics, or perfume production. For example, vanilla is commonly used as an ingredient in fragrance manufacturing.",
      "subTitle": "Spices and condiments",
      "price": "50",
      "icon": "assets/images/cat/spices.png"
    },
    {
      "id": "2",
      "number": "1",
      "title": "Spinach",
      "description":
          "Spinach (Spinacia oleracea) is a leafy green flowering plant native to central and Western Asia. It is of the order Caryophyllales, family Amaranthaceae, subfamily Chenopodioideae. Its leaves are a common edible vegetable consumed either fresh, or after storage using preservation techniques by canning, freezing, or dehydration. It may be eaten cooked or raw, and the taste differs considerably; the high oxalate content may be reduced by steaming.",
      "subTitle": "spinach leaves",
      "price": "20.8",
      "icon": "assets/images/cat/Spinach.png"
    },
    {
      "id": "1",
      "number": "1",
      "title": "Vegetable",
      "description":
          "Vegetables are parts of plants that are consumed by humans or other animals as food. The original meaning is still commonly used and is applied to plants collectively to refer to all edible plant matter, including the flowers, fruits, stems, leaves, roots, and seeds. An alternative definition of the term is applied somewhat arbitrarily, often by culinary and cultural tradition. It may exclude foods derived from some plants that are fruits, flowers, nuts, and cereal grains, but include savoury fruits such as tomatoes and courgettes, flowers such as broccoli, and seeds such as pulses.",
      "subTitle": "clean vegetables",
      "price": "45.2",
      "icon": "assets/images/cat/veg.png"
    },
  ];
  List<Map<String, dynamic>> get getMenus => _menus;

  static const List<Map<String, dynamic>> _sales = [
    {
      "id": "6",
      "number": "1",
      "title": "BBQ Chicken",
      "description": "500g",
      "priceNew": "110.4",
      "priceOld": "130.4",
      "icon": "assets/images/sales/chicken.png"
    },
    {
      "id": "5",
      "number": "1",
      "title": "Fastfood",
      "description": "200g",
      "priceNew": "42.4",
      "priceOld": "99.3",
      "icon": "assets/images/sales/fastfood.png"
    },
    {
      "id": "4",
      "number": "1",
      "title": "Mackerel",
      "description": "1KG",
      "priceNew": "71.4",
      "priceOld": "100.4",
      "icon": "assets/images/sales/fish.png"
    },
    {
      "id": "3",
      "number": "1",
      "title": "Roast pork",
      "description": "1KG",
      "priceNew": "15.4",
      "priceOld": "32.4",
      "icon": "assets/images/sales/meat.png"
    },
    {
      "id": "2",
      "number": "1",
      "title": "Rice",
      "description": "10KG",
      "priceNew": "5.4",
      "priceOld": "7.4",
      "icon": "assets/images/sales/rice.png"
    },
    {
      "id": "1",
      "number": "1",
      "title": "Sausage",
      "description": "2KG",
      "priceNew": "10.4",
      "priceOld": "70.4",
      "icon": "assets/images/sales/sausage.png"
    },
  ];
  List<Map<String, dynamic>> get getSales => _sales;
}
