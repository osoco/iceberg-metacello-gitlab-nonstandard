actions
remoteToUse
	self remote ifNotNil: [ ^ self remote ].
	self url ifNotNil: [ ^ MCGitlabNonstandardIceScpRemote new url: self url; yourself ]. 
	^ nil