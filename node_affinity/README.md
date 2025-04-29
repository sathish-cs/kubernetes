# Node Affinity

Node Affinity is used to assign a pods into a specific nodes using serveral factors like labels, zones using multiple toplogy keys. It ensures always the pods are scheduled in a particular nodes. 

## Types of Node Affinities

 
##### RequiredDuringSchedulingIgnoredDuringExecution
The pods will be scheduled only if the nodes has the matching labels. If labels doesnt exist then the pods will on the pending state. Once the pods scheduled it wont affect even if the labels are modified/removed. 


##### PreferredDuringSchedulingIgnoredDuringExecution

This looks primarly for the pods to be scheduled on the nodes that match the lables if its doesnt exist or already overload then it might be scheduled on any other nodes based on serveral factors like resource utlization, taints and tolerations etc. 

###### Label a node

`kubectl label node nodename env=dev`
