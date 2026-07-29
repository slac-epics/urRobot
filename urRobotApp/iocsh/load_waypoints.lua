-- Loads N waypoints for prefix P.
-- Optional TYPE selects which waypoint types to load:
--   "J"    - joint-space waypoints only (waypointJ.db)
--   "L"    - Cartesian/linear waypoints only (waypointL.db)
--   "BOTH" - both (default; also used when TYPE is unset for back-compat)
local wtype = TYPE or "BOTH"
local load_j = (wtype == "J" or wtype == "BOTH")
local load_l = (wtype == "L" or wtype == "BOTH")
for n = 1, tonumber(N) do
    local macros = string.format("P=%s,N=%d", P, n)
    if load_j then dbLoadRecords("$(URROBOT)/urRobotApp/Db/waypointJ.db", macros) end
    if load_l then dbLoadRecords("$(URROBOT)/urRobotApp/Db/waypointL.db", macros) end
end
dbLoadRecords("$(URROBOT)/urRobotApp/Db/waypoint_reached.db", "P="..P)
