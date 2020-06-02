private
extractOwner: aString usingMatcher: matcher
	| project |
	project := matcher subexpression: self projectGroup.
	^ (project splitOn: '/') first