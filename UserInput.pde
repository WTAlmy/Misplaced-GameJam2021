int value;
void keyPressed() {

  // Destroy Palmtree
  if (key == 'f') {
    for (Island island : islands) {
      if (player.touching(island)) {
        for (int i = island.palmtrees.size()-1; i >= 0; i--) { // reverse loop to remove palmtree while iterating
          if (player.touching(island.palmtrees.get(i))) {
            WoodInstance woodPiece = new WoodInstance(island.palmtrees.get(i).getPosition(), 5);
            island.palmtrees.remove(i);
            println("player destroyed a palmtree");
            break;
          }
        }
      }
    }
  }

  // Collect wood log
  if (key == 'e') {
    for (int i = wood.instances.size() - 1; i >= 0; i--) {
      if (player.touching(wood.instances.get(i))) {
        wood.collect(1);
        wood.instances.remove(i);
        println("total wood count: ", wood.count);
      }
    }
  }
}
