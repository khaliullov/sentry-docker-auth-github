Sentry github auth
==================

By default Sentry Docker image `library/sentry:9.0` does not contain package
`sentry-auth-github`.

Build image with sentry-auth-github
-----------------------------------

    docker build -t registry.example.com/library/sentry:9.0 .

Push image to registry
----------------------

    docker login registry.example.com
    docker push registry.example.com/library/sentry:9.0

Deploy with helm
----------------

Create `sentry-values.yaml` for chart `stable/sentry`:

    image:
      repository: registry.example.com/library/sentry:9.0
    
    service:
      type: ClusterIP
    
    user:
      email: admin@yandex.com
    
    email:
      from_address: sentry@yandex.com
      host: smtp.yandex.ru
      port: 587
      user: sentry@yandex.com
      password: <REDACTED>
      use_tls: true
    
    web:
      env:
        - name: GITHUB_APP_ID
          value: 0123456789abcdef0124
        - name: GITHUB_API_SECRET
          value: 0123456789abcdef0123456789abcdef01234567

Install sentry with `helm`:

    helm install -f sentry-values.yaml stable/sentry
