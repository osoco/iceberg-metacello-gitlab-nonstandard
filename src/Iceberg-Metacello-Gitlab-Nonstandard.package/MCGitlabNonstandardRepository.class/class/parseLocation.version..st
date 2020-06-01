parsing
parseLocation: locationUrl version: versionString
	"self 
	parseLocation: 'github://dalehenrich/MetacelloRepository:master/monticello/repos/itory/path'
	version: nil
     "

	| matcher projectPath owner projectName branch |
	matcher := IceGitlabNonstandardRemote urlMatcher.
	(matcher matches: locationUrl)
		ifTrue: [ owner := matcher subexpression: IceGitlabNonstandardRemote ownerGroup.
			projectName := matcher subexpression: IceGitlabNonstandardRemote projectGroup.
			projectPath := matcher subexpression: IceGitlabNonstandardRemote pathGroup.
			branch := versionString ifNil: [ matcher subexpression: IceGitlabNonstandardRemote branchGroup ] ]
		ifFalse: [ IceWrongUrl signal: 'Could not parse URL: ' , locationUrl ].
	^ self new
		projectPath: owner , projectName;
		projectVersion: branch;
		repoPath: projectPath;
		yourself