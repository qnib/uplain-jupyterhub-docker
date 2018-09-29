import os
#c.ConfigurableHTTPProxy.api_url = 'http://127.0.0.1:8000'
c.JupyterHub.hub_bind_url = 'http://0.0.0.0:8000'
c.JupyterHub.hub_port=8000
c.JupyterHub.hub_connect_url= 'http://tasks.jupyterhub_hub:8000'
c.JupyterHub.spawner_class = 'dockerspawner.SwarmSpawner'
#notebook_dir = os.environ.get('DOCKER_NOTEBOOK_DIR')
#c.SwarmSpawner.notebook_dir = notebook_dir
#c.SwarmSpawner.volumes = { 'jupyter-notebooks': notebook_dir }
c.SwarmSpawner.image = 'qnib/uplain-jupyter-base-notebook:local'
network_name = os.environ['DOCKER_NETWORK_NAME']
c.DockerSpawner.network_name = network_name
c.DockerSpawner.extra_host_config = {'network_mode': network_name}
