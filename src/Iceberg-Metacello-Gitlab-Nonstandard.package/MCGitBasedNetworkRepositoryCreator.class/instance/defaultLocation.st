private accessing
defaultLocation
	| remoteToUse result |
	remoteToUse := self remoteToUse.
	result := IceRepository repositoriesLocation 
		/ remoteToUse organizer.
	remoteToUse projectName splitOn: '/' do: [ :fld | result := result / fld ].
	^ result