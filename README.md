# RUN PROJECT
<h5> With Docker </h5>
- With DB Docker Container: <br>
Step 1: Run command `docker-compose up`. <br>
Step 2: Run command `docker exec -it [container] bash`. <br>
Step 3: In docker container environment, run command `rake db:migrate`. <br>
- With DB on device: <br>
Step 1: In docker-compose.yml, edit information of database. <br>
Step 2: Run command `docker-compose up`. <br>
Step 3: Run command `docker exec -it [container] bash`. <br>
Step 4: In docker container environment, run command `rake db:migrate`. <br>

<p><b>Note:</b> Creating network traefik when running step 1 error.</p>

<h5> With Device </h5>
- Step 1: In database.yml, edit information of database.<br>
- Step 2: Run `bundle install`. <br>
- Step 3: Run command `rake db:migrate`. <br>

# POSTMAN COLLECTION
<p><b>Docs:</b> https://documenter.getpostman.com/view/6229909/TVRd8W8v#e15deeff-0c66-4743-b20d-4ffccfaded3d</p>
<p><b>Collection:</b> https://www.getpostman.com/collections/f08685669d1e6d6fa392</p>