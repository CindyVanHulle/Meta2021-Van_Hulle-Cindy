Class {
	#name : #CHInterpretable,
	#superclass : #Object,
	#instVars : [
		'x',
		'collaborator'
	],
	#category : #'Champollion-Core'
}

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorX [ 
	collaborator store100IntoX 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> collaborator [ 
	^ collaborator 
]

{ #category : #'as yet unclassified' }
CHInterpretable >> collaborator: anObject [ 
	collaborator := anObject  
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnBoolean [
	^ false
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEmptyArray [ 
	^ #()
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEmptyLiteralArray [ 
	^ #()
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnFloat [
	^ 3.14
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnGlobal [ 
	^ Global
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnInteger [ 
	^ 5
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnLiteralArray [ 
	^ #(true 1 'ahah')
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnRecursiveLiteralArray [ 
	^ #(true 1 #('ahah'))
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSelf [
	^ self
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSuper [
	^ super
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnX [
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> sendMessageReturnX [ 
	^ self returnX
]

{ #category : #'as yet unclassified' }
CHInterpretable >> setXanMessage [
	x := 1000.
	collaborator returnX.
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> store100IntoX [ 
	^ x := 100
]

{ #category : #'as yet unclassified' }
CHInterpretable >> x [
	^ x
]

{ #category : #'as yet unclassified' }
CHInterpretable >> x: anInteger [ 
	x := anInteger 
]
