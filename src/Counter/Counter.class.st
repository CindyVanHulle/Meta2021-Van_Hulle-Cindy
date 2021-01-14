Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #Counter
}

{ #category : #accessing }
Counter class >> startingAt: anInteger [

	^ self new count: anInteger
]

{ #category : #accessing }
Counter >> count [
	^ count
]

{ #category : #accesing }
Counter >> count: anInteger [ 
	count := anInteger
]

{ #category : #acccessing }
Counter >> decrement [
	^ self count: (self count) - 1.
]

{ #category : #accesing }
Counter >> increment [
	^ self count: (self count) + 1.
]

{ #category : #accesing }
Counter >> increment2 [
	^ self count: (self count) + 2.
]

{ #category : #'as yet unclassified' }
Counter >> initialize [
	super initialize .
	count := 0.	
]

{ #category : #'as yet unclassified' }
Counter >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' withValue: ' , count printString.
	aStream cr
]
