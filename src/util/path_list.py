# Path List Generator

# Fourth Index : 1 - arrived   2 - returned
path_447 = [[0,0,90,0],[0,2.5,90,1],[0,2.5,-90,0],[0,0,-90,0],[0,0,0,2]]
path_m_t = [[0,0,90,0],[0,7.7,90,1],[0,7.7,-90,0],[0,0,-90,0],[0,0,0,2]]
path_424 = [[0,0,90,0],[0,7.7,90,0],[0,7.7,0,0],[1.5,7.7,0,1],[1.5,7.7,-180,0],[0,7.7,-180,0],[0,7.7,-90,0],[0,0,-90,0],[0,0,0,2]]
path_moohan = [[0,0,90,0],[0,13.5,90,1],[0,13.5,-90,0],[0,0,-90,0],[0,0,0,2]]
path_445 = [[0,0,90,0],[0,22,90,1],[0,22,-90,0],[0,0,-90,0],[0,0,0,2]]

way_points = [{"room_number" : "447", "path" : path_447},
{"room_number" : "man_toilet", "path" : path_m_t},
{"room_number" : "424", "path" : path_424},
{"room_number" : "moohan", "path" : path_moohan},
{"room_number" : "445", "path" : path_445}
]

class Path_Node:
    def __init__(self):
        self.way_points = way_points

        print("*************** Path List *******************")
        print("447")
        print("man_toilet")
        print("424")
        print("moohan")
        print("445")
        print("*********************************************")


    def get_path_list(self,target_number):
        for way_point in way_points:
            if way_point["room_number"] == target_number:
                return way_point["path"]

        print("No Path : Check your Path")
        return False

pn = Path_Node()

print(pn.get_path_list("424"))
