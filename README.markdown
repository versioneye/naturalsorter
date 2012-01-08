# NaturalSorter

## The Mission

This open source project is sorting arrays in a natural way. Assume you have an string array like this here

`["init30", "init20", "init200"]`

If you are sorting this in ruby with ".sort" you will get this result

`["init20", "init200", "init30"]`

Because the default sort method does not recognize the numbers in the string. The NaturalSorter will return this result. 

`["init20", "init30", "init200"]`

## API

This GEM has just 2 methods

`Naturalsorter::Sorter.sort(array, caseinsesitive)`

And this here for more advanced sorting

`Naturalsorter::Sorter.sort_by_method(array, method, caseinsesitive)`

## Installation 

You should add this line to your Gemfile

`gem 'naturalsorter', '0.0.1'`

and run this command in your app root directory

`bundle install`

## How To Use - Examples

After the installation you can use it like this: 

`Naturalsorter::Sorter.sort(["a400", "a5", "a1"], true)`

it will return the array ["a1", "a5", "a400"]. 

If you have more advanced objects you want to sort, you should use the second method. Assume you have a Class User with 3 attributes: "firstname", "lastname", "age" and you want to sort an array of class Users by "firstname". 

`Naturalsorter::Sorter.sort_by_method(users, "firstname", true)`

that's it!

