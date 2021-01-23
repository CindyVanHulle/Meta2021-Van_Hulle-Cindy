Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EMultiplication class >> fiveTimesThree [
	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	^ self new left: ep1; right: ep2
]

{ #category : #'as yet unclassified' }
EMultiplication class >> left: anExp right: anExp2 [ 
	^ self new left: anExp ; right: anExp2 
]

{ #category : #accessing }
EMultiplication >> evaluate [
	^ left evaluate * right evaluate 
]

{ #category : #accessing }
EMultiplication >> operatorString [
	^ ' * '
]
