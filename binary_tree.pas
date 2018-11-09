unit binary_tree;

interface

Type
  PNode = ^TNode;
  TNode = record
    data: Integer; // ключ
    count: Integer; // количество повторений ключа
    left, right: PNode;
  end;

procedure add_node(var tree: PNode; int: Integer);
procedure delete_tree(var tree: PNode);
function get_height(tree: PNode): Integer;
function get_leaves(tree: PNode): Integer;
function is_in_tree(tree: PNode; int: Integer): Boolean;
procedure print_tree(tree: PNode);
function has_duplicates(tree: PNode): Boolean;
function get_nodes(tree: PNode): Integer;
function copy_tree(tree: PNode): PNode;

implementation

procedure add_node(var tree: PNode; int: Integer);
begin
  if tree = nil then
  begin
    new(tree);
    tree^.data := int;
    tree^.count := 1;
    tree^.left := nil;
    tree^.right := nil;
  end
  else
  begin
    if int <> tree^.data then
      if int < tree^.data then
        add_node(tree^.left, int)
      else
        add_node(tree^.right, int)
    else
      tree^.count := tree^.count + 1;
  end;
end;

procedure delete_tree(var tree: PNode);
begin
  if tree <> nil then
  begin
    delete_tree(tree^.left);
    delete_tree(tree^.right);
    dispose(tree);
    tree := nil;
  end;
end;

function max(int1, int2: Integer): Integer;
begin
  if int1 > int2 then
    max := int1
  else
    max := int2;
end;

function get_height(tree: PNode): Integer;
begin
  if tree = nil then
    get_height := 0
  else
    get_height := max(get_height(tree^.left), get_height(tree^.right)) + 1;
end;

function get_leaves(tree: PNode): Integer;
begin
  if tree = nil then
    get_leaves := 0
  else
    if (tree^.left = nil) and (tree^.right = nil) then
      get_leaves := 1
    else
      get_leaves := get_leaves(tree^.left) + get_leaves(tree^.right);
end;

function is_in_tree(tree: PNode; int: Integer): Boolean;
begin
  if tree = nil then
    is_in_tree := false
  else
    if tree^.data > int then
      is_in_tree := is_in_tree(tree^.left, int)
    else if tree^.data < int then
      is_in_tree := is_in_tree(tree^.right, int)
    else
      is_in_tree := true;
end;

procedure print_tree(tree: PNode);
var
  i: Integer;
begin
  if tree <> nil then
  begin
    print_tree(tree^.left);
    for i := 1 to tree^.count do
      write(tree^.data:5);
    print_tree(tree^.right);
  end
  else
    write('');
end;

function has_duplicates(tree: PNode): Boolean;
begin
  if tree = nil then
    has_duplicates := false
  else if tree^.count > 1 then
    has_duplicates := true
  else
    has_duplicates := has_duplicates(tree^.right) or has_duplicates(tree^.right)
end;

function get_nodes(tree: PNode): Integer;
begin
  if tree = nil then
    get_nodes := 1
  else
    get_nodes := get_nodes(tree^.left) + get_nodes(tree^.right)
end;

function copy_tree(tree: PNode): PNode;
begin
  if tree <> nil then
  begin
    new(copy_tree);
    copy_tree^.data := tree^.data;
    copy_tree^.count := tree^.count;
    copy_tree^.left := copy_tree(tree^.left);
    copy_tree^.right := copy_tree(tree^.right);
  end
  else
      copy_tree := nil;
end;

end.
