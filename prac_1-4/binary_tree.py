class Node:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data

    def insert(self, data):
        if self.data:
            if data < self.data:
                if self.left is None:
                    self.left = Node(data)
                else:
                    self.left.insert(data)
            elif data > self.data:
                if self.right is None:
                    self.right = Node(data)
                else:
                    self.right.insert(data)
        else:
            self.data = data

    def inorderTraversal(self):
        res = []
        if self.left:
            res = self.left.inorderTraversal()
        res.append(self.data)
        if self.right:
            res = res + self.right.inorderTraversal()
        return res

    def preorderTraversal(self):
        res = []
        res.append(self.data)
        if self.left:
            res = res + self.left.preorderTraversal()
        if self.right:
            res = res + self.right.preorderTraversal()
        return res

    def postorderTraversal(self):
        res = []
        if self.left:
            res = res + self.left.postorderTraversal()
        if self.right:
            res = res + self.right.postorderTraversal()
        res.append(self.data)
        return res

    def PrintTree(self):
        if self.left:
            self.left.PrintTree()
        print(self.data)
        if self.right:
            self.right.PrintTree()

root = Node(27)
root.insert(14)
root.insert(35)
root.insert(10)
root.insert(19)
root.insert(31)
root.insert(42)
print("Inorder Traversal:", root.inorderTraversal())
print("Preorder Traversal:", root.preorderTraversal())
print("Postorder Traversal:", root.postorderTraversal())
