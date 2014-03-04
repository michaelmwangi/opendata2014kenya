from packagekit import filter

__author__ = 'micheal'

from database import *


class Control:
    def __init__(self):
        self.db = Database()

    def get_selected_schools(self):
        res = self.db.fetch_schools()
        schools = list()
        for schooltuple in res:
            schools.append(schooltuple[0])
        return schools

    def get_public_private_ratio(self, schoolname):
        publictotal = self.db.fetch_category_school(schoolname, 'Public')
        privatetotal = self.db.fetch_category_school(schoolname, 'Private')
        if publictotal == 0 and privatetotal == 0:
            return 0, 0
        else:
            totalstudents = publictotal+privatetotal
            publicpercent = (float(publictotal)/totalstudents)*100
            privatepercent = (float(privatetotal)/totalstudents)*100
            return publicpercent, privatepercent


    def get_category_all_total(self, filter):
        res = self.db.fetch_category_all(filter)
        return len(res)

if __name__ == '__main__':
   pass