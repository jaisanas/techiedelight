fn main() {
    let n: i32 = 3;
    let fact_result = fact(n);
    println!("{}", fact_result);
}

fn fact(n: i32) -> i32 {
    if n < 1 {
        return 1;
    }
    return n * fact(n-1);
}