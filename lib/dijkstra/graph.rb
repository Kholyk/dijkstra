# frozen_string_literal: true

module Dijkstra
  class Graph
    attr_reader :nodes

    def initialize
      @nodes = []
    end

    def add_node(id)
      @nodes << Node.new(id) if node_vacant?(id)
      self
    end

    def node_vacant?(id)
      get_node(id).nil?
    end

    def get_node(id)
      @nodes.filter { |node| node.id == id }.first
    end

    def edge_between(src_node_id, dst_node_id, weight, rev_weight = nil)
      src_node = get_node(src_node_id)
      dst_node = get_node(dst_node_id)

      raise NoMethodError if src_node.nil? || dst_node.nil?

      src_node.edge_to(dst_node.id, weight)
      reverse_weight = rev_weight.nil? ? weight : rev_weight
      dst_node.edge_to(src_node.id, reverse_weight)
        
      self
    end

  end
end