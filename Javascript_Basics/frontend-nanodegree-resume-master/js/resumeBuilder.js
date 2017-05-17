/*
This is empty on purpose! Your code to build the resume will go here.
 */
 //var formattedName = HTMLheaderName.replace("%data%", "Yasin Razlık");
 //var formattedRole = HTMLheaderRole.replace("%data%", "Mobile Application Developer");
 //$("#header").prepend(formattedName)
 //$("#header").prepend(formattedRole)

 var bio = {
                "name": "Yasin Razlık",
                "age": 25,
                "role": "Mobile Application Developer",
                "contacts":
                {
                    "email": "yrazlik@gmail.com",
                    "mobile": "+90-554-445-0225",
                    "twitter": "@yrazlik",
                    "github": "yrazlik",
                    "location": "Istanbul"
                },
                "skills": [
                    "Java", "Android", "Android Studio"
                ],
                "bioPic": "https://scontent-frt3-1.xx.fbcdn.net/v/t1.0-1/c170.50.621.621/s320x320/253431_10151026693995592_534553444_n.jpg?oh=f6751a6b02fcf64406ea76b6543bf848&oe=5974410F",
                "welcome_message": "Welcome to My Bio"
            };

var work = {
    "jobs": [
        {
            "employer": "Open Business Software Solutions",
            "position": "Android Developer",
            "dates": "2014-present",
            "years": 3,
            "city": "Istanbul",
            "description": "Developed Android applications for clients"
        },
        {
            "employer": "Mälardalens Högskola",
            "position": "Intern",
            "dates": "2013",
            "years": 0.5,
            "city": "Västerås",
            "description": "Used CMUSphinx and participated in an ıngiong project about robots and speech recgnition"
        }
    ]
};

var projects = {
                  "projects": [
                      {
                          "title":"GittiGidiyor Android Application",
                          "dates":"2014-2017",
                          "description": "GittiGidiyor Android Application Implementation",
                          "url":"https://play.google.com/store/apps/details?id=com.gittigidiyormobil",
                          "images": [
                            "https://lh3.googleusercontent.com/iPhTMnWuGB9tto2U31kS-LUumiQlwOLWBfGXG2BkTUzmso2EhstcN9D0Ypxo5Enreg=w300"
                          ]
                      }
                  ]
              };

var education = {
                    "schools": [
                        {
                           "name": "Bornove Fen Lisesi",
                           "years": "2005-2009",
                           "degree": "High School",
                           "majors": ["Math", "Science"],
                           "city": "Izmir",
                           "url": "www.bornovakoleji.k12.tr"
                        },
                        {
                            "name": "Sabanci University",
                            "years": "2009-2014",
                            "degree": "BA",
                            "city": "Istanbul",
                            "majors": ["CS"],
                            "url": "www.sabanciuniv.edu"
                        }
                    ],
                    "onlineCourses": [
                        {
                            "title": "JavaScript Basics Course",
                            "school": "Udacity",
                            "dates": 2017,
                            "url": "https://www.udacity.com/course/javascript-basics--ud804"
                        }
                    ]
                };

function displayWork() {
    if(work["jobs"] !== null && work["jobs"] !== undefined && work["jobs"].length > 0) {
      for(job in work["jobs"]){
        $("#workExperience").append(HTMLworkStart);
        var formattedEmployer = HTMLworkEmployer.replace("%data%", work.jobs[job].employer);
        var formattedTitle = HTMLworkTitle.replace("%data%", work.jobs[job].position);
        var formattedEmployerTitle = formattedEmployer + formattedTitle;
        $(".work-entry:last").append(formattedEmployerTitle);

        var formattedDates = HTMLworkDates.replace("%data%", work.jobs[job].dates);
        $(".work-entry:last").append(formattedDates);

         var formattedDescription = HTMLworkDescription.replace("%data%", work.jobs[job].description);
        $(".work-entry:last").append(formattedDescription);
      }
  }
}

if(bio["skills"] !== null && bio["skills"] !== undefined && bio.skills.length > 0) {
      $("#header").append(HTMLskillsStart);
      var formattedSkill = HTMLskills.replace("%data%", bio.skills[0]);
      $("#skills").append(formattedSkill);
      formattedSkill = HTMLskills.replace("%data%", bio.skills[1]);
      $("#skills").append(formattedSkill);
      formattedSkill = HTMLskills.replace("%data%", bio.skills[2]);
      $("#skills").append(formattedSkill);
}

$(document).click(function(loc) {
    var x = loc.pageX;
    var y = loc.pageY;

    logClicks(x,y);
});

var inName = function(name) {
    if(name !== null && name.length > 0) {
        var splittedName = name.trim().split(" ");
        if(splittedName.length == 1) {
            return name;
        }

        var capitalizedName = "";

        for(var i = 0; i < splittedName.length; i++) {
            if(i == splittedName.length - 1) {
                splittedName[i] = splittedName[i].toUpperCase();
            }
            capitalizedName += " " + splittedName[i];
        }
        return capitalizedName.trim();
    }
}

projects.display = function() {
    for(project in projects.projects) {
        $("#projects").append(HTMLprojectStart);

        var formattedTitle = HTMLprojectTitle.replace("%data%", projects.projects[project].title);
        $(".project-entry:last").append(formattedTitle);

        var formattedDates = HTMLprojectDates.replace("%data%", projects.projects[project].dates);
        $(".project-entry:last").append(formattedDates);

        var formattedDescription = HTMLprojectDescription.replace("%data%", projects.projects[project].description);
        $(".project-entry:last").append(formattedDescription);

        if(projects.projects[project].images.length > 0) {
            for(image in projects.projects[project].images) {
                var formattedImage = HTMLprojectImage.replace("%data%", projects.projects[project].images[image]);
                $(".project-entry:last").append(formattedImage);
            }
        }
    }
}

displayWork();
projects.display();
$("#mapDiv").append(googleMap);

//$("#main").append(internationalizeButton);
//$("#main").append(inName("yasin razlik"));

//bio.name = "Yasin Razlik";
//bio.skills.push("Swift");

//$("#main").append(bio.name + "-" + bio.age);
//$("#main").append(work["position"]);
//$("#main").append(education.name);






