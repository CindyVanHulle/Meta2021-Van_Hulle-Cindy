Class {
	#name : #CountingManualInterpreterInstanceVariableTest,
	#superclass : #TestCase,
	#category : #VisitorAST
}

{ #category : #tests }
CountingManualInterpreterInstanceVariableTest >> testInstanceVariableCount [ 
	"Point >> sideOf: otherPoint
	| side |
	side := (self crossProduct: otherPoint) sign.
	^ { #right . #center . #left } at: side + 2 "
	| ast counting |   
	ast := RBParser parseMethod: (Point >> #sideOf:) sourceCode.  
	counting := CountingManualInterpreterInstanceVariable new.  
	ast acceptVisitor: counting.  
	self assert: counting numberOfInstanceVariable equals: 1
]
