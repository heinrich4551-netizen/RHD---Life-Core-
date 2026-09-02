player addAction ["Gather at nearby RHD location", {[] call RHD_fnc_requestGather}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Refine at nearby RHD refinery", {[] call RHD_fnc_requestRefine}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Open RHD Shop", {[] call RHD_fnc_shopOpen}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Bank: Deposit $100", {[] call RHD_fnc_requestDeposit}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Bank: Withdraw $100", {[] call RHD_fnc_requestWithdraw}, nil, 1.5, true, true, "", "true", 5, false, ""];
player addAction ["Stop current job", {[] call RHD_fnc_stopWork}, nil, 1.5, true, true, "", "player getVariable ['RHD_WORKING',false]", 5, false, ""];
player addAction ["Police: Ticket nearest", {[] call RHD_fnc_requestTicket}, nil, 1.5, true, true, "", "player getVariable ['RHD_JOB','civ'] isEqualTo 'police'", 5, false, ""];
player addAction ["EMS: Treat nearest", {[] call RHD_fnc_requestHeal}, nil, 1.5, true, true, "", "player getVariable ['RHD_JOB','civ'] isEqualTo 'medic'", 5, false, ""];
