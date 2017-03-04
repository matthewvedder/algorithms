from collections import deque

def breadth_first_search(graph, goal, initial_state):
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
                'state': child,
                'cost': node['cost'] + 1,
                'path': node['path'] + [node['state']]
            }

            if not child_node in explored or frontier:
                if goal == child_node['state']:
                    return child_node
                else:
                    frontier.append(child_node)
                    explored.append(child_node)


social_graph = {}
social_graph["ayla"] = ["alice", "bob", "claire"]
social_graph["bob"]  = ["anuj", "peggy"]
social_graph["alice"] = ["peggy"]
social_graph["claire"] = ["thom", "johnny"]
social_graph["anuj"] = []
social_graph["peggy"] = []
social_graph["thom"] = []
social_graph["johnny"] = []

print breadth_first_search(social_graph, "peggy", "ayla")
