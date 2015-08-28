<cfcomponent output="false">
	<cffunction name="init" output="false">
		<cfset this.version = "1.1.8">
		<cfreturn this>
	</cffunction>

	<cffunction name="structDateExists" returntype="boolean" hint="Returns whether or not a given `key` exists within `struct` and its valid is a date." output="false">
		<cfargument name="struct" type="struct" required="true" hint="Struct to examine.">
		<cfargument name="key" type="string" required="true" hint="Struct key to examine.">

		<cfreturn
			StructKeyExists(arguments.struct, arguments.key)
			and IsDate(arguments.struct[arguments.key])
		>
	</cffunction>

	<cffunction name="structIntegerExists" returntype="boolean" hint="Returns whether or not a given `key` exists within `struct` and its value is an integer." output="false">
		<cfargument name="struct" type="struct" required="true" hint="Struct to examine.">
		<cfargument name="key" type="string" required="true" hint="Struct key to examine.">

		<cfreturn
			structNumberExists(argumentCollection=arguments)
			and IsValid("integer", arguments.struct[arguments.key])
		>
	</cffunction>

	<cffunction name="structStringExists" returntype="boolean" hint="Returns whether or not a given `key` exists within `struct` and if it is a string. Optionally, check if the string has length." output="false">
		<cfargument name="struct" type="struct" required="true" hint="Struct to examine.">
		<cfargument name="key" type="string" required="true" hint="Struct key to examine.">
		<cfargument name="checkLength" type="boolean" required="false" default="false" hint="Whether or not to check that the string has legnth.">
		<cfscript>
			var loc = {};

			loc.exists = StructKeyExists(arguments.struct, arguments.key) && IsSimpleValue(arguments.struct[arguments.key]);

			if (arguments.checkLength) {
				loc.exists = loc.exists && Len(arguments.struct[arguments.key]);
			}
		</cfscript>
		<cfreturn loc.exists>
	</cffunction>

	<cffunction name="structListExists" returntype="boolean" hint="Returns whether or not a given `key` exists within `struct` and if it has any length. Optionally, alias any given value in the list to mean 'all' (helpful if you want to include a check box with a value of `-1` to denote 'all items' and thus ignore the filter in a SQL `WHERE`." output="false">
		<cfargument name="struct" type="struct" required="true" hint="Struct to examine.">
		<cfargument name="key" type="string" required="true" hint="Struct key to examine.">
		<cfargument name="includeAllValue" type="string" required="false" default="" hint="Causes this function to return `false` if a given item is included in the list.">
		<cfscript>
			var loc = {};

			loc.exists = structStringExists(arguments.struct, arguments.key, true);

			if (Len(arguments.includeAllValue)) {
				loc.exists = loc.exists && !ListFindNoCase(arguments.struct[arguments.key], arguments.includeAllValue);
			}
		</cfscript>
		<cfreturn loc.exists>
	</cffunction>

	<cffunction name="structNumberExists" returntype="boolean" hint="Returns whether or not a given `key` exists within `struct` and its value is numeric." output="false">
		<cfargument name="struct" type="struct" required="true" hint="Struct to examine.">
		<cfargument name="key" type="string" required="true" hint="Struct key to examine.">

		<cfreturn
			StructKeyExists(arguments.struct, arguments.key)
			and IsNumeric(arguments.struct[arguments.key])
		>
	</cffunction>

	<cffunction name="structObjectExists" returntype="boolean" hint="Returns whether or not a given `key` exists within `struct` and its value is an object." output="false">
		<cfargument name="struct" type="struct" required="true" hint="Struct to examine.">
		<cfargument name="key" type="string" required="true" hint="Struct key to examine.">

		<cfreturn
			StructKeyExists(arguments.struct, arguments.key)
			and IsObject(arguments.struct[arguments.key])
		>
	</cffunction>
</cfcomponent>