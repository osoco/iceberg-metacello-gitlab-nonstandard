private accessing
remoteToUse
	self remote ifNotNil: [ ^ self remote ].
	self url ifNotNil: [ ^ IceGitlabNonstandardRemote url: self url ]. 
	^ nil