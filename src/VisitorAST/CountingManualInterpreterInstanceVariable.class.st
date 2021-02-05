Class {
	#name : #CountingManualInterpreterInstanceVariable,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #VisitorAST
}

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> initialize [ 
	super initialize. 
	count := 0
]

{ #category : #initialization }
CountingManualInterpreterInstanceVariable >> numberOfInstanceVariable [
	^ count
]

{ #category : #visiting }
CountingManualInterpreterInstanceVariable >> visitAssignmentNode: aRBAssignmentNode [ 
	aRBAssignmentNode value acceptVisitor: self
]

{ #category : #visiting }
CountingManualInterpreterInstanceVariable >> visitMessageNode: aRBMessageNode [ 
	aRBMessageNode receiver acceptVisitor: self.
	aRBMessageNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
CountingManualInterpreterInstanceVariable >> visitMethodNode: aRBMethodNode [ 
	aRBMethodNode statements do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
CountingManualInterpreterInstanceVariable >> visitReturnNode: aRBReturnNode [ 
	^ self
]

{ #category : #visiting }
CountingManualInterpreterInstanceVariable >> visitSelfNode: aRBSelfNode [ 
	^ self
]

{ #category : #visiting }
CountingManualInterpreterInstanceVariable >> visitVariableNode: aRBVariableNode [ 
	count := count + 1.
	^ self
]
