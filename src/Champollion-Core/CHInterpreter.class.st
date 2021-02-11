Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#category : #'Champollion-Core'
}

{ #category : #running }
CHInterpreter >> execute: anAST [
	^ self visitNode: anAST 
]

{ #category : #visiting }
CHInterpreter >> visitLiteralArrayNode: aLiteralArrayNode [ 
	^ aLiteralArrayNode contents
		collect: [ :literalNode | self visitNode: literalNode ]
		as: Array 
]

{ #category : #running }
CHInterpreter >> visitLiteralValueNode: aLiteralValueNode [
	^ aLiteralValueNode value
]

{ #category : #running }
CHInterpreter >> visitMethodNode: aMethodeNode [
	^ self visitNode: aMethodeNode body
]

{ #category : #running }
CHInterpreter >> visitNode: aNode [
	^ aNode acceptVisitor: self
]

{ #category : #running }
CHInterpreter >> visitReturnNode: aReturnNode [
	^ self visitNode: aReturnNode value
]

{ #category : #running }
CHInterpreter >> visitSequenceNode: aSequenceNode [
	"Visit all but the last statement wihtout caring about the result"
	aSequenceNode statements allButLast 
	do: [ :each | self visitNode: each ].
	^ self visitNode: aSequenceNode statements last
]
