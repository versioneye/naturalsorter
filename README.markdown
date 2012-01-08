# NaturalSorter

This open source project is sorting arrays in a natural way. Assume you have an string array like this here

["init30", "init20", "init200"]

If you are sorting this in ruby with ".sort" you will get this result

["init20", "init200", "init30"]

Because the default sort method does not recognize the numbers in the string. The NaturalSorter will return this result. 

["init20", "init30", "init200"]

