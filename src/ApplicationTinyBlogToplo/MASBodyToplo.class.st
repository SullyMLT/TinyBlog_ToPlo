Class {
	#name : 'MASBodyToplo',
	#superclass : 'Object',
	#instVars : [
		'blog'
	],
	#category : 'ApplicationTinyBlogToplo-ToploBlocFeatureForPyramid',
	#package : 'ApplicationTinyBlogToplo',
	#tag : 'ToploBlocFeatureForPyramid'
}

{ #category : 'accessing' }
MASBodyToplo >> blog [
	^ blog
]

{ #category : 'accessing' }
MASBodyToplo >> blog: aPosts [
	 blog := aPosts
]

{ #category : 'action' }
MASBodyToplo >> createBodyContent [

| pane category posts |

pane := ToPane new hMatchParent;
						vMatchParent .
						
pane padding: (BlInsets top: 10 left: 5 bottom: 20 right: 5).

pane layout: BlLinearLayout horizontal.
pane layout horizontalAlignment: BlElementAlignment vertical center.
pane layout cellSpacing: 15.

self blog: MASBlog new createDemoPosts.

category := MASCategory new.
category categories: self blog.
pane addChild: (category createCategoryBody).

posts := MASPostsList new.
posts postsList: self blog.
pane addChild: (posts createPostsBody).

"Mise en variable d'instance posts dans category"
category postsList: posts.

^ pane

]
