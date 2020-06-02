private
extractBranch: aString
	| matcher result |
	matcher := self urlMatcher.
	result := (matcher matches: aString)
		ifTrue: [ self extractBranch: aString usingMatcher: matcher ]
		ifFalse: [ nil ].
	^ result