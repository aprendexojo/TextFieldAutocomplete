# TextFieldAutocomplete
This is a TextField custom class that offers Auto Complete capabilities for Xojo Desktop projects

+ Activate or deactivate auto completion at your will using the `Autocomplete` boolean property (see accompanying example project).
+ This class offers auto completion from any source that implements the `TextAutocompleteSource` Class interface, so you can use in combination with any class: from database, text input stream or your own!
+ Exclude words from autocompletion passing an Array containing them to the `addSpecialCharacters` method of the `TextFieldAutocomplete` class.
