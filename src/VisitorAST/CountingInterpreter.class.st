Class {
	#name : #CountingInterpreter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'count'
	],
	#category : #VisitorAST
}

{ #category : #'as yet unclassified' }
CountingInterpreter >> initialize [ 
	super initialize.
	count := 0
]

{ #category : #'as yet unclassified' }
CountingInterpreter >> numberOfMessages [
	^ count
]

{ #category : #'as yet unclassified' }
CountingInterpreter >> visitMessageNode: aMessageNode [   
	super visitMessageNode: aMessageNode.
	count := count + 1
]
