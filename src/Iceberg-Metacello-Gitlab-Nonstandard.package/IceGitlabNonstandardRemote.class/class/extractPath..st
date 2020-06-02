url handling
extractPath: aString
	| matcher result |
	matcher := self urlMatcher.
	result := (matcher matches: aString)
		ifTrue: [ self extractPath: aString usingMatcher: matcher ]
		ifFalse: [ nil ].
	^ result