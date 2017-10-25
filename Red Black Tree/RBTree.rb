#!/usr/bin/env ruby

require_relative 'Node'
require_relative 'Tree'

RED = false
BLACK = true

def new_tree
  t = Tree.new
  t.nill = Node.new
  t.nill.color = BLACK
  t.root = t.nill
  t
end

def rotate_left( t, node_x)
  node_y = Node.new
  node_y = node_x.right

  node_x.right = node_y.left

  if(node_y.left != t.nill)
    node_y.left.parent = node_x
  end

  node_y.parent = node_x.parent

  if node_x.parent == t.nill
    t.root = node_y
  elsif node_x == node_x.parent.left
    node_x.parent.left = node_y
  else
    node_x.parent.right = node_y
  end

  node_y.left = node_x
  node_x.parent = node_y
end

def rotate_right( t, node_x)
  node_y = node_x.left

  node_x.left = node_y.right

  if node_y.right != t.nill
    node_y.right.parent = node_x
  end

  node_y.parent = node_x.ṕarent

  if node_x.parent == t.nill
    t.root = node_y
  elsif node_x == node_x.parent.left
    node_x.parent.left = node_y
  else
    node_x.parent.right = node_y
  end

  node_y.right = node_x
  node_x.parent = node_y
end

def Fixup(t, k)
  while (k != t.root) && (k.parent.color == RED)
    #caso avô seja filho a esquerda
    if k.parent == k.parent.parent.left
      l = k.parent.parent.right #tio
      #caso 1 -- tio vermelho
      if l.color == RED
        l.color = BLACK
        k.parent.color = BLACK
        k.parent.parent.color = RED
        k = k.parent.parent
      else
        #caso 2 -- o tio é preto e k é filho à direita: transforma no caso 3
        if k == k.parent.right
          k = k.parent
          rotate_left(t, k)
        end

        #caso 3 -- o tio é preto e k é filho a esquerda: rotaciona e termina
        k.parent.color = BLACK
        k.parent.parent.color = RED
        rotate_right(t, k.parent.parent)
      end
    else
      #caso avô seja filho à direita
      l = k.parent.parent.left #tio

      #caso 1 -- o tio é vermelho
      if l.color == RED
        l.color = BLACK
        k.parent.color = BLACK
        k.parent.parent.color = RED
        k = k.parent.parent #sobe o problema para o avô de k
      else
        #caso 2 -- o tio é preto e k é filho à direita: transforma no caso 3
        if k == k.parent.left
          k = k.parent
          rotate_right(t, k)
        end
        #caso 3 -- o tio é preto e k é filho à esquerda: rotaciona e termina
        k.parent.color = BLACK
        k.parent.parent.color = RED
        rotate_left(t, k.parent.parent)
      end
    end
  end

  t.root.color = BLACK
end

def insert( t, k)
  n = Node.new
  n.parent = n.left = n.right = t.nill
  n.key = k
  n.color = RED

  ant = t.nill
  x = Node.new
  x = t.root

  while x != t.nill
    ant = x
    if (k < x.key)
      x = x.left
    else
      x = x.right
    end
  end

  n.parent = ant

  if ant == t.nill
    t.root = n
  elsif k < ant.key
    ant.left = n
  else
    ant.right = n
  end

  Fixup(t, n)
end

def drawTree(t, n, h)
  if n.left != t.nill
    drawTree(t, n.left, h + 1)
  end
  i = 0
  while i < h
    print("    ")
    i = i + 1
  end

  if n.color == RED
    puts "R-#{n.key}"
  else
    puts "B-#{n.key}"
  end

  if n.right != t.nill
    drawTree(t, n.right, h + 1)
  end
end

def minValueNode(tree)
  currentNode = tree

  while currentNode.left != nil
    currentNode = currentNode.left
  end

  return currentNode
end

def preorder(tree)
  if tree
    puts tree.key
    preorder tree.left
    preorder tree.right
  end
end

def inorder(tree)
  if tree
    inorder tree.left
    puts tree.key
    inorder tree.right
  end
end

def postorder(tree)
  if tree
    postorder tree.left
    postorder tree.right
    puts tree.key
  end
end

def main
  t = new_tree
  d = 0
  print "Quantidades de nodos: "
  d = gets.to_i
  i = 0
  while i < d
    print "key: "
    key = gets.to_i
    insert(t, key)
    i = i + 1
  end

  drawTree(t, t.root, 0)
end

main
