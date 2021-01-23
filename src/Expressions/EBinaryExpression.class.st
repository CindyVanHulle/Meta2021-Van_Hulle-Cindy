Class {
	#name : #EBinaryExpression,
	#superclass : #EExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #accessing }
EBinaryExpression >> left [
	^ self left
]

{ #category : #accessing }
EBinaryExpression >> left:  anInteger [ 
	left:= anInteger 
]

{ #category : #accessing }
EBinaryExpression >> operatorString [
	^ self subclassResponsibility 
]

{ #category : #accessing }
EBinaryExpression >> printOn: aStream [ 
	aStream nextPutAll: '( '.
	left printOn: aStream.
	aStream nextPutAll: self operatorString.
	right printOn: aStream.
	aStream nextPutAll: ' )'
]

{ #category : #accessing }
EBinaryExpression >> right [
	^ self right
]

{ #category : #accessing }
EBinaryExpression >> right:  anInteger [ 
	right:= anInteger 
]
