Class {
	#name : #EEAdditionTest,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #tests }
EEAdditionTest >> testNegated [ 
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	self assert: (EAddition new right: ep1; left: ep2) negated evaluate equals: -8
]
