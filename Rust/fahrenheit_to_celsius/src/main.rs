use std::io;

fn main() { 
    loop {
        println!("What in the Fahrenheit do you want to convert?");

        let mut fahr = String::new();
        io::stdin().read_line(&mut fahr)
            .expect("Failed to read line");
        
        let fahr: f32 = fahr.trim().parse()
            .expect("Not a number!");
        
        let cel = fahrenheit_to_celsius(fahr) as i32;

        println!("{}° F is {}° C", fahr, cel);
    }
}

fn fahrenheit_to_celsius(fahr: f32) -> f32 {
    let a: f32 = 5.0/9.0;
    (fahr-32.0) * a
}
