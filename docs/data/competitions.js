const competitions = [
{
    id: "cnc-speed-challenge",
    title: "CNC Speed Challenge",
    category: "Manufacturing",
    level: "Intermediate",
    age_group: "Youth / Adult",

    description: "Machine a precision aluminum part within tolerance under time constraints.",

    specs: {
        material: "6061 Aluminum",
        tolerance: "+/- 0.005 inch",
        max_dimensions: "4 x 4 x 4 inches",
        machine_type: "3-axis CNC"
    },

    rules: [
        "No pre-programmed G-code allowed",
        "All setups must be completed onsite",
        "Safety glasses required at all times"
    ],

    judging: {
        accuracy: 40,
        surface_finish: 20,
        speed: 30,
        safety: 10
    },

    awards: {
        first: "$500",
        second: "$250",
        third: "$100"
    },

    schedule: {
        entry_deadline: "2026-05-01",
        event_date: "2026-06-15"
    },

    location: "MakerHub Lab Floor",
    status: "Active"
},

{
    id: "robotics-assembly",
    title: "Robotics Assembly Challenge",
    category: "Robotics",
    level: "Advanced",
    age_group: "Youth / Adult",

    description: "Teams assemble and program a robotic system to complete a timed task.",

    specs: {
        platform: "Arduino / Raspberry Pi",
        components: "Provided kit",
        task: "Autonomous object movement"
    },

    rules: [
        "Teams of 2–4 allowed",
        "No external code libraries",
        "All work must be done during event"
    ],

    judging: {
        functionality: 40,
        efficiency: 25,
        build_quality: 20,
        teamwork: 15
    },

    awards: {
        first: "$750",
        second: "$400",
        third: "$150"
    },

    schedule: {
        entry_deadline: "2026-05-10",
        event_date: "2026-06-20"
    },

    location: "MakerHub Robotics Lab",
    status: "Active"
}
];