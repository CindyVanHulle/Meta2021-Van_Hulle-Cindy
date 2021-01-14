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

{ #category : #'as yet unclassified' }
Counter >> count: anInteger [ 
	count := anInteger
]

{ #category : #'as yet unclassified' }
Counter >> decrement [
	^ self count: (self count) - 1.
]

{ #category : #'as yet unclassified' }
Counter >> increment [
	^ self count: (self count) + 1.
]

{ #category : #'as yet unclassified' }
Counter >> increment2 [
	^ self count: (self count) + 2.
]

{ #category : #'as yet unclassified' }
Counter >> initialize [
	super initialize .
	count := 0.	
]

{ #category : #'as yet unclassified' }
Counter >> printOn: asStream [

	super printOn: asStream.
	asStream nextPutAll: ' with value: ', count printString.
	asStream cr
]
