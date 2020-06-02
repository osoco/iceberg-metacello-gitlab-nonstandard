private
parseUrl: aString
	| matcher result |
	matcher := self class urlMatcher.
	result := matcher matches: aString.
	result
		ifTrue: [ | project |
			self host: 'gitlab.com'.
			project := matcher subexpression: self class projectGroup.
			self owner: (project splitOn: '/') first.
			self projectName: project.
			self branch: (matcher subexpression: self class branchGroup).
			self path: (matcher subexpression: self class pathGroup) ].
	^ result