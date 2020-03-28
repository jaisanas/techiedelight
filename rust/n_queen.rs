fn main() {
    let n: i32 = 4;
    let mut mat = vec![vec!['-'; n as usize]; n as usize];
    let r: i32 = 0;
    n_queen(&mut mat, r, n);
}

fn is_safe(mat: &mut Vec<Vec<char>>, r: i32, c: i32, n: i32) -> bool {
    let mut i = r;
    while i >= 0 {
        if mat[i as usize][c as usize] == 'Q' {
            return false;
        }
        i -= 1; 
    }

    let mut i = r;
    let mut j = c;
    while i >= 0 && j >= 0 {
        if mat[i as usize][j as usize] == 'Q' {
            return false;
        }
        
        i -= 1;
        j -= 1;
    }

    let mut i = r;
    let mut j = c;
    while i >= 0 && j < n {
        if mat[i as usize][j as usize] == 'Q' {
            return false;
        }

        i -= 1;
        j += 1;
    }

    true
}

fn n_queen(mat: &mut Vec<Vec<char>>, r: i32, n: i32) {
    if r == n {
        println!("{:?}",mat);
        return;
    }

    for i in 0..n {
        if is_safe(mat,r,i, n) {
            mat[r as usize][i as usize] = 'Q';
            n_queen(mat, r+1, n);
            mat[r as usize][i as usize] = '-';
        }
    }
    return;
}