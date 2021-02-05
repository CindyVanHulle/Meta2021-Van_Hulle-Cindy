Class {
	#name : #DepthCalculatorVisitor,
	#superclass : #BaseASTVisitor,
	#category : #VisitorExample
}

{ #category : #visiting }
DepthCalculatorVisitor >> visitLeafNode: aSelfNode [
	^ 1
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitLitteralValueNode: aRBLiteralValueNode [
	^	self visitNode: aRBLiteralValueNode 
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitMessageNode: aRBMessageNode [
	^ self visitNode: aRBMessageNode 
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitMethodeNode: aRBMethodeNode [
	^ self visitNode: aRBMethodeNode 
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitNode: aNode [
	^ 1 + (aNode children 
		inject: 0
	 	into: [ :max :node | max max: (node acceptVisitor: self) ]) 
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitNodeWithChildren: aNode [
	^ 1 + (aNode children 
		inject: 0
		into: [:max :node | max max: (node acceptVisitor: self) ])
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitSelfNode: aSelfNode [
	^ self visitNode: aSelfNode 
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitSequenceNode: aRBSequenceNode [
	^ self visitNode: aRBSequenceNode 
]
