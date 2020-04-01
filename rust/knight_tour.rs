const N: i32 = 5;
const ROW: [i32; 8] = [2, 1, -1, -2, -2, -1, 1, 2];
const COL: [i32; 8] = [1, 2, 2, 1, -1, -2, -2, -1];

fn main() {
    let mut visited = vec![vec![0; N as usize]; N as usize];
    knight_tour(&mut visited, 0, 0, 1);
}

fn is_valid(x: i32, y: i32) -> bool {
    if x < 0 || y < 0 || x >= N || y >= N {
        return false;
    }

    return true;
}

fn knight_tour(visited: &mut Vec<Vec<i32>>, x: i32, y: i32, steps: i32) {
    visited[x as usize][y as usize] = steps;
    if steps >= N * N {
        print_visited(visited);
        visited[x as usize][y as usize] = 0;
        return;
    }

    for i in 0..8 {
        let new_x: i32 = x + ROW[i as usize];
        let new_y: i32 = y + COL[i as usize];
        if is_valid(new_x, new_y) && visited[new_x as usize][new_y as usize] == 0 {
            knight_tour(visited, new_x, new_y, steps + 1);
        }
    }
    visited[x as usize][y as usize] = 0;
}

fn print_visited(visited: &mut Vec<Vec<i32>>) {
    let mut i = 0;
    while i < N {
        let mut j = 0;
        while j < N {
            print!("{}", visited[i as usize][j as usize]);
            j += 1;
        }
        println!();
        i += 1;
    }
    println!()
}
