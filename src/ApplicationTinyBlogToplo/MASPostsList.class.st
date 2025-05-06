Class {
	#name : 'MASPostsList',
	#superclass : 'Object',
	#instVars : [
		'postsListPaneMain',
		'postsList'
	],
	#category : 'ApplicationTinyBlogToplo',
	#package : 'ApplicationTinyBlogToplo'
}

{ #category : 'as yet unclassified' }
MASPostsList >> createPostContent: aPost [

| panePost panePostContent postTitleLabel postContentText postDateContent |

panePost := ToPane new hMatchParent;
								vFitContent.			
panePost padding: (BlInsets top: 0 left: 10 bottom: 10 right: 10).

panePost layout: BlLinearLayout vertical.
panePost layout horizontalAlignment: BlElementAlignment horizontal start.
panePost layout cellSpacing: 3.

"panePost border: (BlBorder paint: Color blue)."

"======================================================================================================="
"Panel of main text of a post"
panePostContent := ToPane new hMatchParent;
							vFitContent.
panePostContent  layout: BlFlowLayout horizontal.
panePostContent layout horizontalAlignment: BlElementAlignment horizontal start.

"panePostContent border: (BlBorder paint: Color red)."

"======================================================================================================="
"Title of the post"
postTitleLabel := ToLabel new text: (aPost title asString); bold.
postTitleLabel fontSize: 30.

panePost addChild: postTitleLabel.
"======================================================================================================="
"Date of the post"
postDateContent := ToLabel new text: aPost date asString.
postDateContent fontSize: 15.

panePost addChild: postDateContent.
"======================================================================================================="
"Text of the post"
postContentText := ToTextField new.
"postContentText text: aPost text asString."

panePostContent addChild: postContentText.

panePost addChild: panePostContent.
"======================================================================================================="


^ panePost
]

{ #category : 'as yet unclassified' }
MASPostsList >> createPostsBody [

	| pane postsLabel allPosts postsPane |
	pane := ToPane new
		        vMatchParent;
		        hMatchParent.

	pane padding: (BlInsets
			 top: 10
			 left: 10
			 bottom: 10
			 right: 10).

	pane layout: BlLinearLayout vertical.
	pane layout horizontalAlignment: BlElementAlignment horizontal center.
	pane layout cellSpacing: 5.

	"pane border: (BlBorder paint: Color black)."
	
	postsPane := ToPane new hMatchParent; vFitContent.
	postsPane layout: BlLinearLayout vertical.
	postsPane layout horizontalAlignment: BlElementAlignment horizontal center.
	postsPane layout cellSpacing: 5.

	postsLabel := self createPostsLabel.

	pane addChild: postsLabel.
	
	pane addChild: postsPane.

	allPosts := postsList allBlogPosts.

	allPosts do: [ :each | postsPane addChild: (self createPostContent: each) ].

	self postsListPaneMain: pane.

	^ pane
]

{ #category : 'as yet unclassified' }
MASPostsList >> createPostsLabel [

| panePostsPane postLabel |

panePostsPane := ToPane new hMatchParent;
									vMatchParent.
panePostsPane height: 60.
panePostsPane padding: (BlInsets left: 40).

panePostsPane layout: BlLinearLayout horizontal.
panePostsPane layout horizontalAlignment: BlElementAlignment horizontal start.

"panePostsPane border: (BlBorder paint: Color blue)."

postLabel := ToLabel new text: 'Posts'.
postLabel fontSize: 30.

panePostsPane addChild: postLabel.

^ panePostsPane
]

{ #category : 'accessing' }
MASPostsList >> postsList [
	^ postsList
]

{ #category : 'accessing' }
MASPostsList >> postsList: aPostsList [
	postsList := aPostsList 
]

{ #category : 'accessing' }
MASPostsList >> postsListPaneMain [
	^ postsListPaneMain
]

{ #category : 'accessing' }
MASPostsList >> postsListPaneMain: aPostsListPaneMain [
	postsListPaneMain := aPostsListPaneMain 
]

{ #category : 'as yet unclassified' }
MASPostsList >> tabPostsFromCategory: aCategory [
	^ postsList allBlogPostsFromCategory: aCategory.


]
