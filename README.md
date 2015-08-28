# CFWheels StructTypeExists

Get more specific than `StructKeyExists()` with new methods like `structIntegerExists()`, `structDateExists()`, etc.

We were getting tired of writing boolean logic like this:

	<!--- Ugh, another integer... --->
	<cfif StructKeyExists(arguments, "userId") and IsNumeric(arguments.userId) and IsValid("integer", arguments.userId)>
	  <!--- Do something --->
	</cfif>

	<!--- Oh bother, another date --->
	<cfif StructKeyExists(arguments, "startDate") and IsDate(arguments.startDate)>
		<!--- Do something --->
	</cfif>

	<!--- Geez, another list (inclusion of -1 means "all") --->
	<cfif StructKeyExists(arguments, "userIds") and Len(arguments.userIds) and not ListFind(arguments.userIds, -1)>
		<!--- Do something --->
	</cfif>

So we created this CFWheels plugin to add some convenience methods to avoid the repetitive calls.

## New Methods

`boolean structDateExists(struct struct, string key)`
Returns whether or not `struct[key]` exists and is a date.

`boolean structIntegerExists(struct struct, string key)`
Returns whether or not `struct[key]` exists and is an integer.

`boolean structStringExists(struct struct, string key[, boolean checkLength])`
Returns whether or not `struct[key]` exists and is a string. Pass in `true` for `checkLength` to also check that the string
has length.

`boolean structListExists(struct struct, string key[, string includeAllValue])`
An alias for `structStringExists` with the length check, with a twist. If you pass a value for `includeAllValue`, it will
return `false` if that value is included in the list. (Useful if you have a checkbox on your form that indicates that all
items are checked.)

`boolean structNumberExists(struct struct, string key)`
Returns whether or not `struct[key]` exists and is a number.

`boolean structObjectExists(struct struct, string key)`
Returns whether or not `struct[key]` exists and is an object.

Note that all of these methods work fine with object instances as the `struct` value as well.

## License

The MIT License (MIT)

Copyright (c) 2015 Liquifusion Studios

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
