# NaturalSorter

## The Mission

This open source project is sorting arrays in a natural way. Assume you have an string array like this here

`["init30", "init20", "init200"]`

If you are sorting this in ruby with ".sort" you will get this result

`["init20", "init200", "init30"]`

Because the default sort method does not recognize the numbers in the string. The NaturalSorter will return this result. 

`["init20", "init30", "init200"]`

## API

This GEM has 8 methods

`Naturalsorter::Sorter.sort(array, caseinsesitive)`
`Naturalsorter::Sorter.sort_desc(array, caseinsesitive)`

And this here for more advanced sorting. Where you can put in a array of objects and the method which should called on every object for comparison. 

`Naturalsorter::Sorter.sort_by_method(array, method, caseinsesitive)`
`Naturalsorter::Sorter.sort_by_method_desc(array, method, caseinsesitive)`

This methods are based on a different algo. spezially optimizied for sorting version strings. 

`Naturalsorter::Sorter.sort_version(array)`
`Naturalsorter::Sorter.sort_version_desc(array)`

This here is again for an array with objects. 

`Naturalsorter::Sorter.sort_version_by_method(array, method)`
`Naturalsorter::Sorter.sort_version_by_method_desc(array)`

Get newest.

`Naturalsorter::Sorter.get_newest_version(first, second)` 


## Installation 

You should add this line to your Gemfile

`gem 'naturalsorter', '0.2.0'`

and run this command in your app root directory

`bundle install`

## How To Use - Examples

After the installation you can use it like this: 

`Naturalsorter::Sorter.sort(["a400", "a5", "a1"], true)`

it will return the array ["a1", "a5", "a400"]. 

If you have more advanced objects you want to sort, you should use the second method. Assume you have a Class User with 3 attributes: "firstname", "lastname", "age" and you want to sort an array of class Users by "firstname". 

`Naturalsorter::Sorter.sort_by_method(users, "firstname", true)`

Isn't that awesome?

The next methods are based on my own implementation, optimized for sorting version strings like "1.1, 1.4, 1.10"

`Naturalsorter::Sorter.sort_version(["1.10", "1.1", "1.2"])`

will return the array ["1.1", "1.2", "1.10"]


## Alan Davies

The first 4 methods in this librarie are internal based on the natcmp implementation from Alan Davies. All glorry to him for his awesome work. 

