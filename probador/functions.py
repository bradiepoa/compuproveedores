# -*- coding: utf-8 -*-
from models import *
from annoying.functions import *
# from twill.commands import go as twill_go
# from twill.commands import code as twill_code
# from twill.commands import show as twill_show
# from twill.commands import fv as twill_fv
# from twill.commands import submit as twill_submit

from django.conf import settings


fnum = "1"
user = "fer"
ps = "123456"


def go(url):
    twill_go(settings.TEST_URL + url)
    twill_code("200")


def auth(user=user, ps=ps):
    twill_go(settings.TEST_URL + "/accounts/logout/")
    twill_code("200")
    twill_go(settings.TEST_URL + "/")
    twill_fv("1", "username", user)
    twill_fv("1", "password", ps)
    twill_submit()
