Class {
	#name : 'MASPost',
	#superclass : 'Object',
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : 'ApplicationTinyBlogToplo',
	#package : 'ApplicationTinyBlogToplo'
}

{ #category : 'testing' }
MASPost class >> isVoyageRoot [
"Indique que cette instance est en top level de document dans le no sql database"
	^ true
]

{ #category : 'as yet unclassified' }
MASPost class >> title: aTitle text: aText [
	^ self new
		title: aTitle;
		text: aText;
		yourself
]

{ #category : 'as yet unclassified' }
MASPost class >> title: aTitle text: aText category: aCategory [
	^ (self title: aTitle text: aText)
			category: aCategory; 
			yourself
]

{ #category : 'as yet unclassified' }
MASPost class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : 'action' }
MASPost >> beVisible [
	self visible: true
]

{ #category : 'accessing' }
MASPost >> category [
	^ category
]

{ #category : 'accessing' }
MASPost >> category: anObject [
	category := anObject
]

{ #category : 'accessing' }
MASPost >> date [
	^ date
]

{ #category : 'accessing' }
MASPost >> date: anObject [
	date := anObject
]

{ #category : 'initialization' }
MASPost >> initialize [
	super initialize.
	self category: MASPost unclassifiedTag.
	self date: Date today.
	self notVisible
]

{ #category : 'testing' }
MASPost >> isUnclassified [
	^ self category = MASPost unclassifiedTag 
]

{ #category : 'testing' }
MASPost >> isVisible [ 
	^ self visible
]

{ #category : 'action' }
MASPost >> notVisible [
	self visible: false
]

{ #category : 'accessing' }
MASPost >> text [
	^ text
]

{ #category : 'accessing' }
MASPost >> text: anObject [
	text := anObject
]

{ #category : 'accessing' }
MASPost >> title [
	^ title
]

{ #category : 'accessing' }
MASPost >> title: anObject [
	title := anObject
]

{ #category : 'accessing' }
MASPost >> visible [
	^ visible
]

{ #category : 'accessing' }
MASPost >> visible: anObject [
	visible := anObject
]
