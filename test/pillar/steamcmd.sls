{{cookiecutter.service_name}}:
  config:
    api_key: aaaaaaaabbbbbbbbccccccccdddddddd
    site: thing.com
    python_version: 2

  checks:
    directory:
      config:
        instances:
          - directory: "/srv/pillar"
            name: "pillars"

  install_settings:
    agent_version: latest
