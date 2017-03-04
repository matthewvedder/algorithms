from collections import deque

def uniform_cost_search(graph, goal, initial_state):
    node = { 'state': initial_state , 'cost': 0, 'path': [] }
    frontier = deque()
    frontier.append(node)
    explored = []

    if goal == node['state']: return node

    while frontier:
        node = frontier.popleft()
        explored.append(node)
        for child in graph[node['state']]:
            child_node = {
                'state': child[1],
                'cost': node['cost'] + child[0],
                'path': node['path'] + [node['state']]
            }

            if not child_node in explored or frontier:
                if goal == child_node['state']:
                    return child_node
                else:
                    frontier.append(child_node)
                    explored.append(child_node)


cities = {}
cities['sibiu'] = ((99, 'fagaras'), (80, 'rimnicu vilcea'))
cities['fagaras'] = ((99, 'sibiu'), (211, 'bucharest'))
cities['rimnicu vilcea'] = ((80, 'sibiu'), (97, 'pitesti'))
cities['pitesti'] = ((97, 'rimnicu vilcea'), (101, 'bucharest'))
cities['bucharest'] = ((211, 'fagaras'), (101, 'pitesti'))

print uniform_cost_search(social_graph, "peggy", "ayla")
