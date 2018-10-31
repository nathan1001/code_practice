public static class Graph {
    //List of list of integers to record the nodes
    List <List<Integer>> adjacents;
    int size;

    public Graph(int size) {
        //initializing everything here in the constractor.
        this.size= size;
        adjacents = new ArrayList<>();
        while(size-- >0){
            adjacents.add(new ArrayList<Integer>());
        }
    }

    public void addEdge(int first, int second) {
        adjacents.get(first).add(second);
        adjacents.get(second).add(first);
    }

    public int[] shortestReach(int startId) { // 0 indexed

        int[] distances = new int[size];
        Arrays.fill(distances, -1);
        Queue<Integer> queue = new LinkedList<>();

        queue.add(startId);
        distances[startId] = 0;
        HashSet<Integer> visited = new HashSet<>();

        visited.add(startId);
        while(!queue.isEmpty()) {
            Integer curr = queue.poll();
            for(int node : adjacents.get(curr)) {
                if(!visited.contains(node)) {
                    queuw.offer(node);
        // Right place to add the visited set.
                    visited.add(node);
        // keep on increasing distance level by level.
                    distances[node] = distances[curr] + 6;
                }
            }
        }
        return distances;
    }
}
