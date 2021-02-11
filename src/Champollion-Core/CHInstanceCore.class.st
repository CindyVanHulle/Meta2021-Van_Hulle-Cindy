Class {
	#name : #CHInstanceCore,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'parentScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHInstanceCore >> definedVariables [
	^ receiver class allInstVarNames 
]

{ #category : #accessing }
CHInstanceCore >> parentScope [
	^ parentScope 
]

{ #category : #accessing }
CHInstanceCore >> parentScope: anObject [ 
	parentScope := anObject 
]

{ #category : #accessing }
CHInstanceCore >> read: aString [ 
	^ receiver instVarNamed: aString 
]

{ #category : #accessing }
CHInstanceCore >> receiver: anObject [ 
	receiver := anObject 
]

{ #category : #accessing }
CHInstanceCore >> scopeDefining: aString [ 
	(self definedVariables includes: aString )
	ifTrue: [ ^ self ].
	^ self parentScope scopeDefining: aString 
]

{ #category : #accessing }
CHInstanceCore >> write: aString withValue: anInteger [
	receiver instVarNamed: aString  put: anInteger  
]
