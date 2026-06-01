//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

/// Strips the special syntax from [fieldType].
String stripSpecialSyntaxFromFieldType(String fieldType) {
  // Step 0: Remove all spaces from the input String.
  String $step0(String input) {
    return input.replaceAll(' ', '');
  }

  // Step 1: Remove the '@let' and '@enum' substrings from the input String.
  // `@enum` is the sentinel injected by the extractor when analyzer detects an
  // enum-typed field — the marker survives long enough for the type mappers to
  // pick the enum codegen path, then gets stripped here for the declaration.
  String $step1(String input) {
    return input.replaceAll('@let', '').replaceAll('@enum', '');
  }

  // Step 2: Simplify expressions by retaining only the last word in sequences
  // that may include hyphen-separated prefixes.
  // Example: "LowerCase-String" becomes "String".
  // Prefix tokens may also carry a parenthesised parameter or array marker
  // (e.g. "PG_varchar(255)-String", "PG_text[]-List<String>", "PG_numeric(10,2)-String") —
  // the optional (...) or [] section is consumed before the hyphen.
  String $step2(String input) {
    return input.replaceAllMapped(
      RegExp(r'(\b\w+(?:\([^)]*\))?(?:\[\])?-)*(\w+)\b'),
      (m) => m.group(2)!,
    );
  }

  // Step 3: Transform a specialized 'clean' format into a bracketed list format.
  // This changes annotations such as "Type@clean<SubType, AnotherType>" to
  // "Type[SubType, AnotherType]" for standardization.
  String $step3(String input) {
    final x = RegExp(r'\w+\@clean\<([\w\[\]\+]+\??)(,[\w\[\]\+]+\??)*\>');
    var output = input;
    var previousOutput = '';
    while (previousOutput != output) {
      previousOutput = output;
      final group0 = x.firstMatch(output)?.group(0);
      if (group0 == null) break;
      final replacement = group0
          .replaceAll('@clean', '')
          .replaceAll('?', '')
          .replaceAll('<', '[')
          .replaceAll('>', ']')
          .replaceAll(',', '+');
      output = output.replaceAll(group0, replacement);
    }
    return output;
  }

  // Step 4: Reverse some transformations made in Step 3, converting
  // brackets back to angle brackets and pluses back to commas.
  // This is likely to restore generic type syntax closer to standard Dart or TypeScript formats.
  String step4(String input) {
    return input
        .replaceAll('[', '<')
        .replaceAll(']', '>')
        .replaceAll('+', ', ');
  }

  // Apply all transformations sequentially to the input String.
  var output = fieldType;
  output = $step0(fieldType);
  output = $step1(output);
  output = $step2(output);
  output = $step3(output);
  output = step4(output);
  return output;
}
