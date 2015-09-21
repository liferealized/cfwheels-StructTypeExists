# CFWheels StructTypeExists Plugin

Get more specific than `StructKeyExists()` with new methods like `structIntegerExists()`, `structDateExists()`, etc.

We were getting tired of writing boolean logic like this:

```coldfusion
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
```

So we created this CFWheels plugin to add some convenience methods to avoid these repetitive calls.

## New Methods

Note that all of these methods also work fine with object instances passed into the `struct` value.

`boolean structArrayExists(struct struct, string key)`<br />
Returns whether or not `struct[key]` exists and is an array. Pass in `true` for `checkLength` to also check that the array
has at least 1 item.

`boolean structBooleanExists(struct struct, string key[, boolean checkTruthiness])`<br />
Returns whether or not `struct[key]` exists and is boolean. Pass in `true` for `checkTruthiness` to also check that the value
evaluates to a boolean `true`.

`boolean structDateExists(struct struct, string key)`<br />
Returns whether or not `struct[key]` exists and is a date.

`boolean structIntegerExists(struct struct, string key)`<br />
Returns whether or not `struct[key]` exists and is an integer.

`boolean structStringExists(struct struct, string key[, boolean checkLength])`<br />
Returns whether or not `struct[key]` exists and is a string. Pass in `true` for `checkLength` to also check that the string
has length.

`boolean structListExists(struct struct, string key[, string includeAllValue])`<br />
An alias for `structStringExists` with the length check, with a twist. If you pass a value for `includeAllValue`, it will
return `false` if that value is included in the list. (Useful if you have a checkbox on your form that indicates that all
items are checked.)

`boolean structNumberExists(struct struct, string key)`<br />
Returns whether or not `struct[key]` exists and is a number.

`boolean structObjectExists(struct struct, string key)`<br />
Returns whether or not `struct[key]` exists and is an object.

## License

The MIT License (MIT)

Copyright (c) 2015 Liquifusion Studios
