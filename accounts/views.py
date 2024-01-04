from django.contrib.auth import authenticate, login, logout
from django.shortcuts import get_object_or_404, redirect, render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from .models import *
from django.core.exceptions import ObjectDoesNotExist
from django.middleware.csrf import get_token

@login_required
def edit_user(request, id, klass_instance_id=False, klass=False):
    return render(request, 'accounts/user.html', {})

@login_required
def change_password(request, email="", key=""):
    c = {'csrf_token': get_token(request)}
    cont = False
    
    if request.user.is_authenticated:
        u = request.user
        cont = True    
    elif key:
        try:
            u = User.objects.get(email=email, last_name=key)
            cont = True
        except ObjectDoesNotExist:
            pass
    
    if cont:
        error = False
        if request.method == 'POST':
            password = request.POST.get('password')
            repeat_password = request.POST.get('repeat_password')
            
            if password != repeat_password:
                error = "Las contraseñas no coinciden"
            elif not 5 <= len(password) <= 30:
                error = "La contraseña debe contener entre 5 y 30 caracteres."
            else:
                u.set_password(password)
                u.last_name = ""
                u.save()
                return redirect('/')
        
    return render(request, 'accounts/change_password.html', {'error': error})

@login_required
def logout_view(request):
    logout(request)
    next_url = request.GET.get('next', '/admin')
    return redirect('/accounts/login/?next=%s' % next_url)

def login_view(request, kind=None):
    next_url = request.GET.get('next', '/admin')
    if request.user.is_authenticated:
        return redirect('/accounts/logout/?next=%s' % next_url)
        
    title = 'Iniciar Sesión'
    if request.method == 'POST':
        user = authenticate(username=request.POST.get('username'), password=request.POST.get('password'))
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect(next_url)
        return redirect('/accounts/login/?next=%s' % next_url)
    else:
        return render(request, 'accounts/login.html', {'next': next_url, 'title': title})

def denied(request):
    next_url = request.GET.get('next', '/')
    if not request.user.is_authenticated:
        return redirect('/accounts/logout/?next=%s' % next_url)
        
    title = 'Acceso denegado'
    if request.method == 'POST':
        user = authenticate(username=request.POST.get('username'), password=request.POST.get('password'))
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect(next_url)
        return redirect('/accounts/login/?next=%s' % next_url)
    else:
        return render(request, 'accounts/denied.html', {'next': next_url, 'title': title})
