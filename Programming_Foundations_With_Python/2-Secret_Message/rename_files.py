#!/usr/bin/python
import os
def rename_files():
    #(1) get file names from a folder
    file_list = os.listdir(r"/Users/yrazlik/Projects/Udacity_Fullstack_Nanodegree/Programming_Foundations_With_Python/2-Secret_Message/files_to_be_renamed/prank")
    print(file_list)
    saved_path = os.getcwd();
    print("Current working directory is " + saved_path)
    os.chdir(r"/Users/yrazlik/Projects/Udacity_Fullstack_Nanodegree/Programming_Foundations_With_Python/2-Secret_Message/files_to_be_renamed/prank")

                           
    #(2) for each file, rename filename
    for file_name in file_list:
         os.rename(file_name, file_name.translate(None, "0123456789"))
    os.chdir(saved_path)

rename_files()
