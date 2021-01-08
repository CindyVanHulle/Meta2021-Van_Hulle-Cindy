Class {
	#name : #TestCounter,
	#superclass : #TestCase,
	#category : #Counter
}

{ #category : #tests }
TestCounter >> testAllMethods [

| c |
c := Counter startingAt: 5.
self assert: (c increment ; count )equals: 6.
]

{ #category : #tests }
TestCounter >> testDecrement [
| c |
c := Counter new.
c count: 5.
c decrement.
self assert: c count equals: 4
]

{ #category : #tests }
TestCounter >> testIncrement [
| c |
c := Counter new.
c count: 1.
c increment.
self assert: c count equals: 2
]

{ #category : #tests }
TestCounter >> testInitialize [
| c |
c := Counter new.
self assert: c count equals: 0
]

{ #category : #tests }
TestCounter >> testSetterGetter [
| c |
c := Counter new.
c count: 5.
self assert: c count equals: 5
]

{ #category : #tests }
TestCounter >> testStartingAtFive [

| c |
c := Counter startingAt: 5.
self assert: c count equals:5.
]
