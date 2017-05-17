#!/usr/bin/env python
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import os

import webapp2
import jinja2

template_dir = os.path.join(os.path.dirname(__file__), 'templates')
jinja_env = jinja2.Environment(loader=jinja2.FileSystemLoader(template_dir))

html = """

<form method="get">
    <h1>Add a Food</h1>
    <input type="text" name="food"></input>
    %s
    <input type="submit" value="Add"></input>
</form>

"""

item_html = """
    <li>%s</li>
"""

hidden_html = """
    <input type="hidden" name="food" value="%s"></input>
"""

shopping_list_html = """
    <br>
    <br>
    <h2>Shopping List</h2>
    <ul>
        %s
    </ul>
"""


class MainHandler(webapp2.RequestHandler):

    def get(self):
        self.response.write('Hello world!')


class MainPage(MainHandler):
    def get(self):
        output = html
        output_hidden = ""
        items = self.request.get_all("food")

        if items:
            output_items = ""
            for item in items:
                output_hidden += hidden_html % item
                output_items += item_html % item

            output_shopping = shopping_list_html % output_items
            output += output_shopping

        output = output % output_hidden
        self.response.write(output)

app = webapp2.WSGIApplication([
    ('/', MainPage)
], debug=True)
