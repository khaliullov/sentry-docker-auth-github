FROM library/sentry:9.0

RUN pip install https://github.com/getsentry/sentry-auth-github/archive/master.zip
