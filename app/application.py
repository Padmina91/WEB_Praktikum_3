# coding: utf-8

import cherrypy
import datetime

from .database import Database
from .view import View
from .validator import Validator

class Application:

   exposed = True

   def __init__(self):
      self.database = Database()
      self.view = View()
      self.validator = Validator()

   @cherrypy.tools.accept(media='text/plain')
   def GET(self, id=None):
      return_value = ''
      if id == None:
         return_value = self.get_list()
      else:
         return_value = self.get_detail(id)
      return return_value

   def get_list(self):
      return ''

   def get_detail(self, id=None):
      return ''