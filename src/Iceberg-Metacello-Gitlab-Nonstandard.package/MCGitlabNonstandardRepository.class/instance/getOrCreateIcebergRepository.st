private - patches
getOrCreateIcebergRepository
	| remoteUrl remote |
	remoteUrl := self perform: Iceberg remoteTypeSelector.
	remote := IceGitlabNonstandardRemote new
		url: remoteUrl;
		yourself.
	^ IceRepository registry
		detect: [ :repo | repo origin referencesSameRemoteLocationAs: remote ]
		ifNone: [ | urlToUse |
			urlToUse := remote url.
			[ (MCGitlabNonstandardRepositoryCreator new
				remote: remote;
				url: urlToUse;
				subdirectory: repoPath;
				branchName: self projectVersion;
				createRepository) register ]
				on: IceAuthenticationError
				do: [ :e | 
					self
						crLog:
							('I got an error while cloning: {1}. I will try to clone the HTTPS variant.'
								format: {e messageText}).
					urlToUse := remote httpsUrl.
					e retry ] ]