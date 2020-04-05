const N: i32 = 10;
const ROW: [i32; 4] = [-1, 0, 1, 0];
const COL: [i32; 4] = [0, 1, 0, -1];
fn main() {
    let mut mat = vec![
        vec![1, 0, 1, 1, 1, 1, 0, 1, 1, 1],
        vec![1, 0, 1, 0, 1, 1, 1, 0, 1, 1],
        vec![1, 1, 1, 0, 1, 1, 0, 1, 0, 1],
        vec![0, 0, 0, 0, 1, 0, 0, 1, 0, 0],
        vec![1, 0, 0, 0, 1, 1, 1, 1, 1, 1],
        vec![1, 1, 1, 1, 1, 1, 1, 1, 1, 0],
        vec![1, 0, 0, 0, 1, 0, 0, 1, 0, 1],
        vec![1, 0, 1, 1, 1, 1, 0, 0, 1, 1],
        vec![1, 1, 0, 0, 1, 0, 0, 0, 0, 1],
        vec![1, 0, 1, 1, 1, 1, 0, 1, 0, 0],
    ];

    let mut visited = vec![vec![false; N as usize]; N as usize];
    let dist = 0;
    let mut max_dist = 0;
    let result = longest_path(&mut mat, &mut visited, 0, 0, dist, &mut max_dist);
    println!("{}", result);
}

fn is_valid(x: i32, y: i32) -> bool {
    if x < 0 || y < 0 || x >= N || y >= N {
        return false;
    }

    return true;
}

fn longest_path(
    mat: &mut Vec<Vec<i32>>,
    visited: &mut Vec<Vec<bool>>,
    x: i32,
    y: i32,
    dist: i32,
    max_dist: &mut i32,
) -> i32 {
    if x == 5 && y == 7 {
        if dist > *max_dist {
            *max_dist = dist
        }

        return *max_dist;
    }
    visited[x as usize][y as usize] = true;

    for i in 0..4 {
        let new_x = x + ROW[i as usize];
        let new_y = y + COL[i as usize];
        if is_valid(new_x, new_y)
            && visited[new_x as usize][new_y as usize] == false
            && mat[new_x as usize][new_y as usize] == 1
        {
            *max_dist = longest_path(mat, visited, new_x, new_y, dist + 1, max_dist);
        }
    }

    visited[x as usize][y as usize] = false;
    return *max_dist;
}
