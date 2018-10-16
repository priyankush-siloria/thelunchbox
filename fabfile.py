from fabric.api import *
import os
import socket

EXCEPTIONS = []

PAU_KEY = '/home/kelf/amazon-keys/la-fiambrera.pem'
WAILING_KEY = '/Users/DAE/Downloads/la-fiambrera.pem'
PAU_HOST_NAME = 'kelf-P5K'
WAILING_HOST_NAME = 'DAEs-iMac.local'

keys_dict = {
    PAU_HOST_NAME: PAU_KEY,
    WAILING_HOST_NAME: WAILING_KEY
}


class FabricException(Exception):
    pass


def unittest_pass():
    local('./manage.py test')


def upload_tar_from_git(branch):
    "Create an archive from the current Git master branch and upload it"
    run('rm -rf /tmp/deploy_tar')
    run('mkdir /tmp/deploy_tar')
    deploy_path = "/tmp/deploy_tar"
    local('git archive --format=tar %s | gzip > deploy.tar.gz' % branch)
    put('deploy.tar.gz', '%s' % deploy_path)
    run('rm -rf %s' % env.path)
    run('mkdir %s' % env.path)
    run('tar zxf /tmp/deploy_tar/deploy.tar.gz -C %s' % env.path)


def collect_static():

   with settings(abort_exception=FabricException):
       with prefix("source /opt/lafiambrera/bin/activate"):
           try:
               run('cd %s; python3.5 manage.py collectstatic' % env.path)

           except:
               EXCEPTIONS.append("Error on collectstatic %s" % env.path)


def migrate():
    "Update the database"
    with settings(abort_exception=FabricException):
        with prefix("source /opt/lafiambrera/bin/activate"):
            try:
                run('cd %s; python3 manage.py migrate' % env.path)

            except:
                EXCEPTIONS.append("Error migrating %s" % env.path)


def python_requirements():
    with prefix("source /opt/lafiambrera/bin/activate"):
        run("pip install -r %s" % (os.path.join(env.path, "requirements.txt")))


def restart_webserver():
    "Restart the web server"
    env.always_use_pty = False
    run('sudo killall -KILL gunicorn')


def production():
    env.hosts = ['52.59.237.138']
    env.key_filename = keys_dict[socket.gethostname()]
    env.user = "ubuntu"
    env.path = "/opt/lafiambrera/lafiambrera"


def development():
    env.hosts = ['52.59.237.138']
    env.key_filename = keys_dict[socket.gethostname()]
    env.user = "ubuntu"
    env.path = "/opt/lafiambrera/lafiambrera"


def deploy(branch="master"):
    """Deploy the latest version of the site to the servers, install any
    required third party modules, install the virtual host and
    then restart the webserver.

    Enchancement: Now it's possible to deploy the branch you desire, not only
    the master. So you can do -> fab devel deploy:second_branch

    """
    print "Unit test pass.."
    print "not implemented"
    # unittest_pass()
    print "Install python and os requirements"
    print "not implemented"

    print "STARTING DEPLOY"
    print "Uploading tar file from current master branch"
    upload_tar_from_git(branch)
    print "Uploaded!"

    print "Install python requirements"
    # python_requirements()

    print "Collecting static files"
    collect_static()

    print "Migrating bd"
    migrate()
    print "Migrated!"

    print "Restarting server"
    restart_webserver()
    if EXCEPTIONS:
        print "Deploy finished with %s errors:" % len(EXCEPTIONS)
        for e in EXCEPTIONS:
            print e
    else:
        print "Deploy succeeded without errors!"
