Class {
	#name : 'MASHeaderToplo',
	#superclass : 'ToPane',
	#category : 'ApplicationTinyBlogToplo-ToploBlocFeatureForPyramid',
	#package : 'ApplicationTinyBlogToplo',
	#tag : 'ToploBlocFeatureForPyramid'
}

{ #category : 'as yet unclassified' }
MASHeaderToplo >> createButtonLogin [ 

| button |

button := ToButton new label: (ToLabel new text: ('Login' asRopedText
				         fontSize: 30;
				         yourself)).

button constraintsDo: [ :c |
								c frame horizontal alignRight.
								c frame vertical alignCenter].

button whenClickedDo: [ self inform: 'loginButtonClicked' ].

^ button.
]

{ #category : 'as yet unclassified' }
MASHeaderToplo >> createHeader [

| tempHeader |
tempHeader := ToPane new hMatchParent.
tempHeader layout: BlFrameLayout new.

tempHeader border: (BlBorder paint: Color lightGray).

tempHeader height: 80.

tempHeader padding: (BlInsets left: 10 right: 20).

tempHeader addChild: self createTitle.

tempHeader addChild: self createButtonLogin.

^ tempHeader


]

{ #category : 'accessing' }
MASHeaderToplo >> createTitle [

| title |

title := ToLabel new text: 'TinyBlog'.
title fontSize: 30.

title padding: (BlInsets left: 10).

title constraintsDo: [ :c |
								c frame horizontal alignLeft.
								c frame vertical alignCenter].
							
^ title
]
