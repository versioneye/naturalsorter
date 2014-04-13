# NaturalSorter

[![Gem Version](https://badge.fury.io/rb/naturalsorter.png)](http://badge.fury.io/rb/naturalsorter)
[![Dependency Status](http://www.versioneye.com/package/naturalsorter/badge.png)](http://www.versioneye.com/package/naturalsorter)
[![Build Status](https://travis-ci.org/versioneye/naturalsorter.png)](https://travis-ci.org/versioneye/naturalsorter)
[![Code Climate](https://codeclimate.com/github/versioneye/naturalsorter.png)](https://codeclimate.com/github/versioneye/naturalsorter)


## The Mission

This open source project is sorting arrays in a natural way. Assume you have an string array like this here

`["init30", "init20", "init200"]`

If you are sorting this in ruby with ".sort" you will get this result

`["init20", "init200", "init30"]`

Because the default sort method does not recognize the numbers in the string. The NaturalSorter will return this result.

`["init20", "init30", "init200"]`


## Installation

You should add this line to your Gemfile

`gem 'naturalsorter', '2.0.10'`

and run this command in your app root directory

`bundle install`


## Version Sorting
This fork contains some special algorithms to sort version numbers in a natural order. This project is used at <https://www.versioneye.com> to show versions of selected open source projects.


## API

These 2 methods are sorting a simple array of Strings. The name of the methods and the parameters are self explained.

`Naturalsorter::Sorter.sort(array, caseinsensitive = false, asc = true)`

And this here is for more advanced sorting. Where you can put in a array of objects and the method which should called on every object for comparison.

`Naturalsorter::Sorter.sort_by_method(array, method, caseinsensitive = false, asc = true)`

These methods are based on a different algorithm. Especially optimized for sorting version strings.

`Naturalsorter::Sorter.sort_version(array, asc = true)`

This here is again for an array with objects. Especially optimized for sorting version strings.

`Naturalsorter::Sorter.sort_version_by_method(array, method, asc = true )`

Get the newest version from the both given.

`Naturalsorter::Sorter.get_newest_version(first, second)`

Is a bigger than b?

`Naturalsorter::Sorter.bigger?(a, b)`

Is a bigger than b or equal?

`Naturalsorter::Sorter.bigger_or_equal?(a, b)`

Is a smaller than b?

`Naturalsorter::Sorter.smaller?(a, b)`

Is a smaller than b or equal?

`Naturalsorter::Sorter.smaller_or_equal?(a, b)`

This is for the Ruby GEM notation '~>'. For example '~>1.1' fits '1.2' and '1.9' and '1.14'. But not 2.0.
The parameter version would be for example '~>1.1' and the parameter newest_version would be the
current newest version of the GEM, for example "2.0". The method will return false in this case
because '~>1.1' doesn't fit anymore the newest version.

`Naturalsorter::Sorter.is_version_current?(version, newest_version)`


## How To Use - Examples

After the installation you can use it like this:

`Naturalsorter::Sorter.sort(["a400", "a5", "a1"], true)`

it will return the array ["a1", "a5", "a400"]. The second parameter is for "caseinsensitive".

If you have more advanced objects you want to sort, you should use the second method. Assume you have a Class User with 3 attributes: "firstname", "lastname", "age" and you want to sort an array of class Users by "firstname".

`Naturalsorter::Sorter.sort_by_method(users, "firstname", true)`

Isn't that awesome?

The next methods are based on my own implementation, optimized for sorting version strings like "1.1, 1.4, 1.10"

`Naturalsorter::Sorter.sort_version(["1.10", "1.1", "1.2"])`

will return the array ["1.1", "1.2", "1.10"]


## Alan Davies

The first 4 methods in this library are internal based on the natcmp implementation from Alan Davies. All glory to him for his awesome work.
