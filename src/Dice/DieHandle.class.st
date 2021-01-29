Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #initialization }
DieHandle >> + aDicable [
	^ aDicable sumWithHandle: self
]

{ #category : #initialization }
DieHandle >> addDie: aDie [

	dice add: aDie.
]

{ #category : #initialization }
DieHandle >> diceNumber [
	^ dice size
]

{ #category : #initialization }
DieHandle >> dices [

	^ dice
]

{ #category : #initialization }
DieHandle >> initialize [
	super initialize .
	dice  := OrderedCollection new.
]

{ #category : #initialization }
DieHandle >> maxValue [ 
	| res |
	res := 0.
	dice do:[ :each | res := res + each faces ].
	^ res
]

{ #category : #initialization }
DieHandle >> roll [ 
	| res |
	res := 0.
	dice do:[ :each | res := res + each roll ].
	^ res
]

{ #category : #initialization }
DieHandle >> sumWithDie: aDie [ 
	| handle |
	handle := self class new.
	self dices do: [ :each | handle addDie: each ].
	handle addDie: aDie .
	^ handle 
]

{ #category : #initialization }
DieHandle >> sumWithHandle: aDieHandle [  
	| handle |
	handle := self class new.
	self dices do: [ :each | handle addDie: each ].
	aDieHandle dices do: [ :each | handle addDie: each ].
	^ handle 
]
