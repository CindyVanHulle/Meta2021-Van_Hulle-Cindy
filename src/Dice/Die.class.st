Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: aNumber [
	"Create and initialize a new die with aNumber faces."
	| instance |
	instance := self new.
	instance faces: aNumber.
	^ instance 
]

{ #category : #accessing }
Die >> + aDicable [
	^ aDicable sumWithDie: self
]

{ #category : #accessing }
Die >> faces [

	^ faces
]

{ #category : #accessing }
Die >> faces: aNumber [
	faces := aNumber 
]

{ #category : #accessing }
Die >> initialize [
	super initialize .
	faces  := 6.	
]

{ #category : #accessing }
Die >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' ('.
	aStream print: faces.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
Die >> roll [
	
	^ (1 to: self faces) atRandom.
]

{ #category : #accessing }
Die >> sumWithDie: aDie [
	^ DieHandle new 
		addDie: self;
		addDie: aDie;
		yourself
]

{ #category : #accessing }
Die >> sumWithHandle: aDieHandle [ 
	| handle |
	handle := DieHandle new.
	aDieHandle dices do: [ :each | handle addDie: each ].
	handle addDie: self.
	^ handle 
]
