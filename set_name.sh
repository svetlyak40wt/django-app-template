#!/bin/bash

PROJECT=$1
LOWER_PROJECT=${PROJECT//-/_}

find . \
    \( -not \( -path './parts/*' -or -path './bin/*' -or -path './develop-eggs/*' \) \) -and \
    \( -name '*.py' -or -name '*.rst' -or -name Makefile -or -name *.cfg -or -name *.in -or -name LICENSE -or -name .gitignore \) \
    -print0 | \
    xargs -0 sed -i \
                -e "s/django-app-template/${PROJECT}/g" \
                -e "s/django_app_template/${LOWER_PROJECT}/g"

if [ -e .git ]; then
    git mv django_app_template ${LOWER_PROJECT}
else
    mv django_app_template ${LOWER_PROJECT}
fi
