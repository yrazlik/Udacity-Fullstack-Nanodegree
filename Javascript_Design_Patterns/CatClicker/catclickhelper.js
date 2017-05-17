
var clickCount = 0;

function updateText() {
    document.getElementById("numOfCounts").innerHTML = "Count: " + clickCount;
}

function onCatImageClicked() {
    clickCount++;
    updateText();
}


