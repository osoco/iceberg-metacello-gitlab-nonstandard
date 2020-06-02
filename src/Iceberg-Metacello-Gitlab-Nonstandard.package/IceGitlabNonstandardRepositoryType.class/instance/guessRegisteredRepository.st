accessing
guessRegisteredRepository
	"I get the project name and try to find it into the already registered projects. 
	 If I find it, I will use this instead cloning a new one."

	| projectName |
	projectName := 'nexplore-platform/contestia/core'.
	"^ IceRepository registry detect: [ :each | each name = projectName ] ifNone: [ nil ]"
	^ nil