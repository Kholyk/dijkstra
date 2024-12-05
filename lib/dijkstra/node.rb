# frozen_string_literal: true

module Dijkstra
  class Node
    include AASM

    attr_reader :id, :neighbours

    aasm do
      state :unvisited, initial: true
      state :visited

      event :visit do
        transitions from: :unvisited, to: :visited
      end
    end

    def initialize(id)
      @id = id
      @neighbours = []
      @current_weight = Float::INFINITY
    end

    def edge_exists?(dst_node_id)
      !@neighbours.filter { |nghbr| nghbr[:dst_node_id] == dst_node_id }.empty?
    end

    def edge_to(dst_node_id, weight)
      raise Error, 'Arguments error' unless dst_node_id && weight

      @neighbours << { dst_node_id:, weight: } unless edge_exists?(dst_node_id)
    end
  end
end
