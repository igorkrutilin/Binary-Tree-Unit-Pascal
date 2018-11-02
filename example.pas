uses binary_tree; // importing unit

var
  tree: PNode; // this will be our tree
begin
  tree := nil; // creating an empty tree

  writeln(get_height(tree)); // printing height of tree
  // output: 0

  //adding some nodes with numbers in a tree
  add_node(tree, 65);
  add_node(tree, 45);
  add_node(tree, 71);
  add_node(tree, 71);
  add_node(tree, 75);

  writeln(get_height(tree)); // printing height of tree
  // output: 3
  writeln(get_leaves(tree)); // printing number of leaves in a tree
  // output: 2

  delete_tree(tree); // deleting tree

  writeln(get_height(tree)); //printing height of tree (which does not exist)
  //output: 0
end.
