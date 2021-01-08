Class {
	#name : #TestCounter,
	#superclass : #TestCase,
	#category : #Counter
}

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
TestCounter >> testSetterGetter [
| c |
c := Counter new.
c count: 5.
self assert: c count equals: 5
]
