fn main() {
    for i in 1..10 {
        println!("{}",fib(i));
    }
}

fn fib(k: i32) -> i32 {
    match k {
        1 => 1,
        2 => 1,
        _ => fib(k-1)+fib(k-2),
    }
}
