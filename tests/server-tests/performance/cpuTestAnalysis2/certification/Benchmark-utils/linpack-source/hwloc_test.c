/*
gcc -Wall -Wextra -Wshadow -o hwloc_test hwloc_test.c -lhwloc
See also
hwloc-calc -p --hierarchical socket.core.PU pu:3
*/

#include <hwloc.h>
#include <stdio.h>

int main(void)
{
    unsigned i;
    int ret;
    hwloc_topology_t topology;
    hwloc_obj_t obj[4];

    /* Allocate and initialize topology object. */
    ret = hwloc_topology_init(&topology);
    if ( ret ) return 1;

    /* ... Optionally, put detection configuration here to ignore
       some objects types, define a synthetic topology, etc....  

       The default is to detect all the objects of the machine that
       the caller is allowed to access.  See Configure Topology
       Detection. */

    /* Perform the topology detection. */
    ret = hwloc_topology_load(topology);
    if ( ret ) return 1;

for (i=0; i<1024; ++i) {
    obj[0] = hwloc_get_pu_obj_by_os_index(topology, i);
    if (obj[0]) {
            printf ("PU: %d\t", obj[0]->os_index);
	    if ( ( obj[1] = hwloc_get_ancestor_obj_by_type(topology, HWLOC_OBJ_CORE, obj[0]) ) ) 
              printf ("CORE: %d\t", obj[1]->os_index);
            else 
              printf ("CORE: %d\t", -1);
	    if ( ( obj[2] = hwloc_get_ancestor_obj_by_type(topology, HWLOC_OBJ_SOCKET, obj[0]) ) )
              printf ("SOCKET: %d\t", obj[2]->os_index);
            else 
              printf ("SOCKET: %d\t", -1);
	    if ( ( obj[3] = hwloc_get_ancestor_obj_by_type(topology, HWLOC_OBJ_NODE, obj[0]) ) )
              printf ("NUMA node: %d\t", obj[3]->os_index);
            else 
              printf ("NUMA node: %d\t", -1);
            printf("\n");

    }
 }

 obj[0] = hwloc_get_pu_obj_by_os_index(topology, 0);
 if (obj[0]) 
  return 0;
 else
  return 1;

}

