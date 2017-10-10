'''
Fabfile for getting django apps from code repository
'''
import os
import platform

from fabric.operations import local

SCM_ROOT_PATH = ''


def get_app(app_name):
    if not os.path.exists(app_name):
        local('git clone {}/{}'.format(SCM_ROOT_PATH, app_name))
        remove_git('{}/.git'.format(app_name))
    else:
        print('There is an app with the same name. You might want to update that one.')


def remove_git(path):
    system = platform.system()
    if system == 'Linux':
        local('rm -fR {}'.format(path))
    elif system == 'Windows':
        local('rd /s /q {}'.format(path))
    else:
        print('Unidentified operating system: Please delete .git folder manually.')

