Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'globalScope',
		'stack'
	],
	#category : #'Champollion-Core'
}

{ #category : #running }
CHInterpreter >> currentScope [
	^ CHInstanceScope new 
	receiver: self receiver ;
	parentScope: globalScope ;
	yourself 
]

{ #category : #running }
CHInterpreter >> execute: anAST [
	^ self visitNode: anAST 
]

{ #category : #running }
CHInterpreter >> execute: anAST withReceiver: anObject [ 
	self pushNewFrame.
	self topFrame receiver: anObject .
	^ self visitNode: anAST 
]

{ #category : #running }
CHInterpreter >> executeMethod: anAST withReceiver: anObject [ 
	| result |
	self pushNewFrame.
	self topFrame receiver: anObject .
	result := self visitNode: anAST.
	self popFrame.
	^ result
]

{ #category : #running }
CHInterpreter >> globalEnvironmentAt: aSymbol  put: anObject [ 
	globalScope at: aSymbol put: anObject  
]

{ #category : #running }
CHInterpreter >> initialize [
	super initialize.
	globalScope := CHGlobalScope new.
	stack := CTStack new.
]

{ #category : #running }
CHInterpreter >> popFrame [ 
	stack pop
]

{ #category : #running }
CHInterpreter >> pushNewFrame [ 
	| newTop |
	newTop := CHMethodScope new.
	stack push: newTop.
	^ newTop 
]

{ #category : #running }
CHInterpreter >> receiver [ 
	^ self topFrame receiver
]

{ #category : #running }
CHInterpreter >> scopeDefining: aName [
	^ self currentScope scopeDefining: aName 
]

{ #category : #running }
CHInterpreter >> topFrame [ 
	^ stack top
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
	^ globalScope at: aRBGlobalNode name 
	ifAbsent: [ self error: aRBGlobalNode name, ' not found' ]
]

{ #category : #running }
CHInterpreter >> visitInstanceVariableNode: aRBVariableNode [ 
	^ self receiver instVarNamed: aRBVariableNode name
]

{ #category : #running }
CHInterpreter >> visitLiteralArrayNode: aLiteralArrayNode [
	^ aLiteralArrayNode  contents 
		collect: [ :literalNode  | self visitNode: literalNode ] as: Array 
]

{ #category : #running }
CHInterpreter >> visitLiteralValueNode: aLiteralValueNode [
	^ aLiteralValueNode value
]

{ #category : #running }
CHInterpreter >> visitMessageNode: aMessageNode [
	| newReceiver method |
	newReceiver := self visitNode: aMessageNode receiver.
	method := (newReceiver class compiledMethodAt: aMessageNode selector) ast.
	^ self execute: method withReceiver: newReceiver
]

{ #category : #running }
CHInterpreter >> visitMethodNode: aMethodNode [
	^ self visitNode: aMethodNode body
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
	aSequenceNode statements allButLast do: [ :each | self visitNode: each ].
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
