actions
createRepository
	| backend locationToUse |
	self validate.
	locationToUse := self locationToUse.
	backend := IceGitlabNonstandardLocalRepository
		wrap:
			(self storageClass
				newRepositoryAt: locationToUse
				subdirectory: self subdirectory).
	locationToUse exists
		ifFalse: [ backend
				cloneRepositoryFrom: self remoteToUse
				branch: self branchName ].
	^ IceRepository backend: backend