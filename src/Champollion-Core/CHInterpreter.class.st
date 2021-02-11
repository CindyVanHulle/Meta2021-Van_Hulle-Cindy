Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'globalScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #running }
CHInterpreter >> currentScope [ 
	^ CHInstanceCore new 
	receiver: self receiver;
	parentScope: globalScope;
	yourself 
]

{ #category : #running }
CHInterpreter >> execute: anAST [
	^ self visitNode: anAST 
]

{ #category : #running }
CHInterpreter >> execute: anAST withReceiver: anObject [ 
	receiver := anObject .
	^ self visitNode: anAST 
]

{ #category : #running }
CHInterpreter >> globalEnvironmentAt: aSymbol put: anObject [ 
	globalScope at: aSymbol put: anObject 
]

{ #category : #running }
CHInterpreter >> initialize [
	super initialize .
	globalScope := CHGlobalScope new
]

{ #category : #running }
CHInterpreter >> receiver [ 
	^ receiver 
]

{ #category : #running }
CHInterpreter >> scopeDefining: aName [
	^ self currentScope scopeDefining: aName
]

{ #category : #running }
CHInterpreter >> visitAssignmentNode: anAssignmentNode [
	| value |
	value := self visitNode: anAssignmentNode value.
	(self scopeDefining: anAssignmentNode variable name)
		write: anAssignmentNode variable name
		withValue: value.
	^ value
]

{ #category : #running }
CHInterpreter >> visitGlobalNode: aRBGlobalNode [
	^  globalScope
		at: aRBGlobalNode name 
		ifAbsent: [ self error: aRBGlobalNode name, ' not found' ]  
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
CHInterpreter >> visitSelfNode: aNode [
	^ self receiver
]

{ #category : #running }
CHInterpreter >> visitSequenceNode: aSequenceNode [
	"Visit all but the last statement wihtout caring about the result"
	aSequenceNode statements allButLast 
	do: [ :each | self visitNode: each ].
	^ self visitNode: aSequenceNode statements last
]

{ #category : #running }
CHInterpreter >> visitSuperNode: aNode [
	^ self receiver
]

{ #category : #running }
CHInterpreter >> visitVariableNode: aVariableNode [
	^ (self scopeDefining: aVariableNode name) read: aVariableNode name
]
