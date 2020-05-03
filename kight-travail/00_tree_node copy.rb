
class PolyTreeNode

    attr_accessor :children
    attr_reader :value, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        return if self.parent == parent

        if self.parent != nil
            self.parent.children.delete(self)
        end
        
        @parent = parent
        self.parent.children << self unless self.parent.nil? 
        self
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise 'tried to remove node that is not a child' if !self.children.include?(child_node)
    end

    def dfs(target = nil, &prc)
        raise 'need a proc or target' if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }

        return self if prc.call(self)

        children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end
        nil
    end

    def bfs(target = nil, &prc)
        raise 'need a proc or target' if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }

        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes.concat(node.children)
        end

        nil
    end

end