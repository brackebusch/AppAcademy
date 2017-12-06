(function() {

let target = 312051;

// max and min coordinates we've reached
let max = {x: 1, y: 1};
let min = {x: 1, y: 1};

// current coordinate
let s = {x: 1, y: 1};

// direction we're heading
enum Dir {
    Up = 1,
    Down,
    Left,
    Right,
}
let dir = Dir.Right;

// distance to the center
let dist = 0;

// walk
for (let v = 1; true; v++) {
    // are we there yet?
    if (v == target) {
        // we've found the number, now computer the distance
        if (s.x > 1) {
            dist += s.x - 1
        } else {
            dist += s.x * -1 + 1
        }

        if (s.y > 1) {
            dist += s.y - 1
        } else {
            dist += s.y * -1 + 1
        }
        console.log("Distance: " + dist)
        break;
    }

    // walk in our direction. If we reached a new edge, spiral counter-clockwise.
    if (dir == Dir.Right) {
        s.x++
        if (s.x > max.x) {
            max.x = s.x
            dir = Dir.Up
        }
    }
    else if (dir == Dir.Up) {
        s.y++
        if (s.y > max.y) {
            max.y = s.y
            dir = Dir.Left
        }
    }
    else if (dir == Dir.Left) {
        s.x--
        if (s.x < min.x) {
            min.x = s.x
            dir = Dir.Down
        }
    }
    else if (dir == Dir.Down) {
        s.y--
        if (s.y < min.y) {
            min.y = s.y
            dir = Dir.Right
        }
    }

}
})()