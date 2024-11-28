# frozen_string_literal: true

require_relative "dijkstra/version"

module Dijkstra
  class Error < StandardError; end
  
  autoload :Node, 'dijkstra/node'
  autoload :Graph, 'dijkstra/graph'

end
