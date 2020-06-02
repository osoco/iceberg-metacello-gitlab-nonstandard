url handling
extractPath: aString usingMatcher: matcher
	^ matcher subexpression: self pathGroup
