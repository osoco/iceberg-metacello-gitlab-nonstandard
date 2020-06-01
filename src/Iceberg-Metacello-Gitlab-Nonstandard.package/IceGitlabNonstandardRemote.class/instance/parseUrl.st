private
parseUrl
	| matcher |
	matcher := self class urlMatcher.
	(matcher matches: url)
		ifTrue: [ self host: 'gitlab.com'.
			self port: (matcher subexpression: self class portGroup).
			self owner: (matcher subexpression: self class ownerGroup).
			self projectName: (matcher subexpression: self class projectGroup).
			self branch: (matcher subexpression: self class branchGroup).
			self path: (matcher subexpression: self class pathGroup) ]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ' , url ]