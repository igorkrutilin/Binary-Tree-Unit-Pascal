unit binary_tree;

interface

uses math;

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

end.
