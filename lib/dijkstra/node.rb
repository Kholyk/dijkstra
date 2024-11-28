# frozen_string_literal: true

module Dijkstra
  class Node
    attr_reader :id, :neighbours

    def initialize(id)
      @id = id
      @neighbours = []
      @visited = false
      @current_weight = Float::INFINITY
    end

    def visited?
      @visited
    end

    def visit!
      @visited = true
    end

    def edge_exists?(dst_node_id)
      ! @neighbours.filter { |nghbr| nghbr[:dst_node_id] == dst_node_id }
        .empty?
    end

    def edge_to(dst_node_id, weight)
      raise Error, 'Arguments error' unless (dst_node_id && weight)

      @neighbours << { dst_node_id:, weight: } unless edge_exists?(dst_node_id)   
    end
  end
end