Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTest >> testAddTwoDice [
	| hd |
	hd := (Die withFaces: 6) + (Die withFaces: 6).
	self assert: hd dices size = 2. 
]

{ #category : #tests }
DieTest >> testAddingADieAndHandle [
	| hd |
	hd := (Die withFaces: 6)
		sumWithDie: 
		(DieHandle new 
			addDie: 6;
			yourself).
	self assert: hd dices size equals: 2
]

{ #category : #tests }
DieTest >> testCreationIsOK [

	self assert: (Die withFaces: 20) faces equals: 20
]

{ #category : #tests }
DieTest >> testInitializeIsOk [
	
	self assert: Die new faces equals: 6
]

{ #category : #tests }
DieTest >> testRolling [

	| d |
	d := Die new.
	10 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
]
