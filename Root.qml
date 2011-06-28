import QtQuick 1.0

Rectangle {
	id:root
	width: 360
	height: 640
	
	function fun() { console.log("oh it's so fun!")}
	
	CompletingComponent {
	id:inner
	}

	Component.onCompleted: inner.fun2()
}
	