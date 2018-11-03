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

  writeln(is_in_tree(tree, 71)); // printing if integer 71 is in tree
  // output: TRUE
  writeln(is_in_tree(tree, 22)); // printing if integer 22 is in tree
  // output: FALSE

  writeln(get_height(tree)); // printing height of tree
  // output: 3
  writeln(get_leaves(tree)); // printing number of leaves in a tree
  // output: 2

  delete_tree(tree); // deleting tree

  writeln(get_height(tree)); //printing height of tree (which does not exist)
  //output: 0
end.
