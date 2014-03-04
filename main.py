__author__ = 'michealmwangi'
from lib.bottle import run, route, post, request, view, static_file
from lib.control import *

#handle school submit
@post('/submitschool')
@view('index')
def handle_submit():
    school = request.forms.get('school')
    contr = Control()
    schools = contr.get_selected_schools()
    publictotal = contr.get_category_all_total('Public')
    privatetotal = contr.get_category_all_total('Private')
    pubpercent, prvpercent = contr.get_public_private_ratio(school)
    return {'schools': schools, 'publictotal': publictotal, 'privatetotal': privatetotal, 'pubpercent': pubpercent,
            'prvpercent': prvpercent}

#render home page
@route('/')
@view('index')
def show_home():
    contr = Control()
    schools = contr.get_selected_schools()
    publictotal = contr.get_category_all_total('Public')
    privatetotal = contr.get_category_all_total('Private')
    return {'schools': schools, 'publictotal': publictotal, 'privatetotal': privatetotal, 'pubpercent': 0,
            'prvpercent': 0}


#render static files i.e js,css
@route('/staticfiles/<filepath:path>')
def static_serve(filepath):
    return static_file(filepath, root='staticfiles')

if __name__ == '__main__':
    run()