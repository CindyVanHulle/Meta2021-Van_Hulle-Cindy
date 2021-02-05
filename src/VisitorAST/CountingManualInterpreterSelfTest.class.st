Class {
	#name : #CountingManualInterpreterSelfTest,
	#superclass : #TestCase,
	#category : #VisitorAST
}

{ #category : #tests }
CountingManualInterpreterSelfTest >> testMessageCount [ 
	"Point >> sideOf: otherPoint
	| side |
	side := (self crossProduct: otherPoint) sign.
	^ { #right . #center . #left } at: side + 2 "
	| ast counting |   
	ast := RBParser parseMethod: (Point >> #sideOf:) sourceCode.  
	counting := CountingManualInterpreterSelf new.  
	ast acceptVisitor: counting.  
	self assert: counting numberOfSelf equals: 1
]
