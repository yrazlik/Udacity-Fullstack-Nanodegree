

var HTMLCatRow = '<li id="cat_image"> <img style="vertical-align:middle" width="77" height="54" src="%image_path%"> <label id="cat_name">%cat_name%</label> </li>';

var catJSON = {
        "cats": [{
                "name": "Cat 1",
                "image": "../img/cat_1.jpg"
            },
            {
                "name": "Cat 2",
                "image": "../img/cat_2.jpg"
            },
            {
                "name": "Cat 3",
                "image": "../img/cat_3.jpg"
            },
            {
                "name": "Cat 4",
                "image": "../img/cat_4.jpg"
            },
            {
                "name": "Cat 5",
                "image": "../img/cat_5.jpg"
            }
        ]
}

var clickCount = 0;

function updateText() {
//    document.getElementById("numOfCounts").innerHTML = "Count: " + clickCount;
}

function onCatImageClicked() {
  //  clickCount++;
  //  updateText();
}

function createCatList() {
    var catList = document.getElementById("cat_list");

    var catsData = catJSON["cats"];
    if(catsData !== null && catsData.length > 0) {
        for(var i = 0; i < catsData.length; i++) {
            var catName = catsData[i].name;
            var catImage = catsData[i].image;
            var catHTML = HTMLCatRow.replace("%image_path%", catImage).replace("%cat_name%", catName);
            var catRow = document.createElement('div');
            catRow.innerHTML = catHTML;

            catRow.addEventListener('click', (function(imagePath) {
                return function() {
                    document.getElementById("cat_big_image").src = imagePath;
                }
            })(catImage));
            catList.append(catRow);
        }
    }
}

createCatList();


