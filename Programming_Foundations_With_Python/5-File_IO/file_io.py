import urllib


def read_text():
    quotes = open("/Users/yrazlik/Projects/Udacity_Fullstack_Nanodegree/Programming_Foundations_With_Python/5-File_IO/movie_quotes.txt")
    contents_of_file = quotes.read()
    # print(contents_of_file)
    quotes.close()
    check_profanity(contents_of_file)

def check_profanity(text_to_check):
    connection = urllib.urlopen("http://www.wdylike.appspot.com/?q=" + text_to_check)
    output = connection.read()

    # print(output)

    if "true" in output:
        print("Profanity Alert!!!")
    elif "false" in output:
        print("This document has no cursed words!")
    connection.close()


read_text()
