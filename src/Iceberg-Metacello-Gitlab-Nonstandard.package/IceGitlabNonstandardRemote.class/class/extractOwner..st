private
extractOwner: aString
	| matcher result |
	matcher := self urlMatcher.
	result := (matcher matches: aString)
		ifTrue: [ self extractOwner: aString usingMatcher: matcher ]
		ifFalse: [ nil ].
	^ result