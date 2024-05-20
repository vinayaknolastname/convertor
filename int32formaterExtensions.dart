String toShortScaleFormat() {
    String string = toString();
    String defaultValue = "0";

    if (string.isNotEmpty) {
      try {
        String inputString = string.replaceAll(",", "");
        RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
        mathFunc(Match match) => '${match[1]},';
        double stringInDouble = double.parse(inputString);
        String output = stringInDouble
            .toStringAsFixed(
                stringInDouble.truncateToDouble() == stringInDouble ? 0 : 2)
            .replaceAllMapped(regex, mathFunc);
        return output;
      } catch (e) {
        return defaultValue;
      }
    } else {
      return defaultValue;
    }
  }

  /// It will convert the 1000000 to 10,00,000
  /// Thousands, lakhs, crores, arabs
  String toLongScaleFormat() {
    String string = toString();
    String defaultValue = "0";

    if (string.isNotEmpty) {
      try {
        double stringInDouble = double.parse(string);
        final format = NumberFormat('#,##,###.##', 'en_IN');
        return format.format(stringInDouble);
      } catch (e) {
        return defaultValue;
      }
    } else {
      return defaultValue;
    }
  }
