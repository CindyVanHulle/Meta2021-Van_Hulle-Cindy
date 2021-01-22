Class {
	#name : #EMultiplication,
	#superclass : #Object,
	#instVars : [
		'left',
		'right'
	],
	#category : #Expressions
}

{ #category : #accessing }
EMultiplication >> evaluate [
	^ left evaluate * right evaluate 
]

{ #category : #accessing }
EMultiplication >> left:  anInteger [ 
	left:= anInteger 
]

{ #category : #accessing }
EMultiplication >> negated [
	^ ENegation new expression: self
]

{ #category : #accessing }
EMultiplication >> right:  anInteger [ 
	right:= anInteger 
]
