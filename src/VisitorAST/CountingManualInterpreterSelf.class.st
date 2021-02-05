Class {
	#name : #CountingManualInterpreterSelf,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #VisitorAST
}

{ #category : #initialization }
CountingManualInterpreterSelf >> initialize [ 
	super initialize .
	count := 0
]

{ #category : #initialization }
CountingManualInterpreterSelf >> numberOfSelf [
	^ count
]

{ #category : #visiting }
CountingManualInterpreterSelf >> visitAssignmentNode: aRBAssignmentNode [ 
	aRBAssignmentNode value acceptVisitor: self
]

{ #category : #visiting }
CountingManualInterpreterSelf >> visitMessageNode: aRBMessageNode [ 
	aRBMessageNode receiver acceptVisitor: self.
	aRBMessageNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
CountingManualInterpreterSelf >> visitMethodNode: aRBMethodNode [ 
	aRBMethodNode statements do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
CountingManualInterpreterSelf >> visitReturnNode: aRBReturnNode [ 
	^ self
]

{ #category : #visiting }
CountingManualInterpreterSelf >> visitSelfNode: aRBSelfNode [ 
	count := count + 1.
	^ self
]
