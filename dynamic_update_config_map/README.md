# Update config dynamicly using Config Map

Config Map is used to create and store non confidential data that allows to manage the app configuration seperately from the code. By decoupling the configurations from the code it allows to change the config without building the images.  

We used config map to store the html content of nginx page and injected to the pod using mount volume. We there is an update to the config map its automatcally updates to the pod. 

##### Deploy Config Map

`kubectl create -f config-map.yaml`

##### Deploy nginx pod with custom index using config map.

`kubectl create -f nginx.yaml`

###### Note: subPath should be avoided as it copies the file only once during the pod starts. To fetch the updates from the CM pod should be restarted in this case. 

`kubectl edit cm nginx-data` to update the index file under the data and save. 

Now it should server the page with latest content. 

`curl localhost:nodeport`
