parsing
parseLocation: locationUrl version: versionString
	"self 
	parseLocation: 'github://dalehenrich/MetacelloRepository:master/monticello/repos/itory/path'
	version: nil
     "

	| matcher projectPath owner projectName branch urlHelper |
	urlHelper := IceGitlabNonstandardRemote.
	matcher := urlHelper urlMatcher.
	(matcher matches: locationUrl)
		ifTrue: [ owner := urlHelper extractOwner: locationUrl usingMatcher: matcher.
			projectName := urlHelper extractProjectName: locationUrl usingMatcher: matcher.
			branch := versionString
				ifNil: [ urlHelper extractBranch: locationUrl usingMatcher: matcher ].
					projectPath := urlHelper extractPath: locationUrl usingMatcher: matcher ]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ' , locationUrl ].
	^ self new
		projectPath: owner , projectName;
		projectVersion: branch;
		repoPath: projectPath;
		yourself