url handling
extractProjectName: aString
	| matcher result |
	matcher := self urlMatcher.
	result := (matcher matches: aString)
		ifTrue: [ self extractProjectName: aString usingMatcher: matcher ]
		ifFalse: [ nil ].
	^ result