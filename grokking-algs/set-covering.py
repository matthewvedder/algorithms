states_needed_global = set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"])

stations = {}
stations["kone"] = set(["id", "nv", "ut"])
stations["ktwo"] = set(["wa", "id", "mt"])
stations["kthree"] = set(["or", "nv", "ca"])
stations["kfour"] = set(["nv", "ut"])
stations["kfive"] = set(["ca", "az"])

def greedy_set(states_needed, stations):
    final_stations = set()
    states_needed_copy = states_needed

    while states_needed:
        best_station = None
        states_covered = set()
        for station, states in stations.items():
            covered  = states_needed & states
            if len(covered) > len(states_covered):
                best_station = station
                states_covered = covered
        states_needed -= states_covered
        final_stations.add(best_station)

    final_states = list(map(lambda station: stations[station], final_stations))
    flattened_final_states = set([val for sublist in final_states for val in sublist])

    print flattened_final_states
    print final_stations



greedy_set(states_needed_global, stations)
