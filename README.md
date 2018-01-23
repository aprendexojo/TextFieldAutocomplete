# TextFieldAutocomplete
This is a TextField custom class that offers Auto Complete capabilities for Xojo Desktop projects

+ Activate or deactivate auto completion at your will using the `Autocomplete` boolean property (see accompanying example project).
+ This class offers auto completion from any source that implements the `TextAutocompleteSource` Class interface, so you can use in combination with any class: from database, text input stream or your own!
+ Exclude words from autocompletion passing an Array containing them to the `addSpecialCharacters` method of the `TextFieldAutocomplete` class.

Find additional information about the class in [this post on the Xojo Blog](https://blog.xojo.com/2016/08/10/textfield-with-autocomplete/), or in Spanish in [this entry from my blog](https://www.aprendexojo.com/2015/09/subclases-e-interfaces-de-clase-en-xojo/).
