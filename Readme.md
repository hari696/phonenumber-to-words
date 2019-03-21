# Phone Number to Words

## Problem Description
Given a 10 digit phone number, must return all possible words or combination of words from  dictionary, that can be mapped back as a whole to the phone number.

Note: Dictionary file is attached to the folder.

## Conversion Example
Phone Number `1-800-6686787825` can be converted as `1-800-motortruck`.

The phone number mapping to letters is as follows:

    2 = a b c
    3 = d e f
    4 = g h i
    5 = j k l
    6 = m n o
    7 = p q r s
    8 = t u v
    9 = w x y z

The phone numbers will never contain a 0 or 1. Words have to be at least 3 characters.

## Usage
```sh
git clone https://github.com/hari696/phonenumber-to-words.git
cd phonenumber-to-words
ruby solution.rb
```

## Sample IO
    user@machine:phonenumber-to-words ❯❯❯ ruby solution.rb
    Enter 10 digit phone number:
    6686787825
    [["noun", "struck"], ["onto", "struck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]
    user@machine:phonenumber-to-words ❯❯❯ ruby solution.rb
    Enter 10 digit phone number:
    2282668687
    [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], ["acta", "mounts"], "catamounts"]
    user@machine:phonenumber-to-words ❯❯❯
