private
extractBranch: aString usingMatcher: matcher
	^ matcher subexpression: self branchGroup
