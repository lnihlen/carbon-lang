library "foo";

//@dump-sem-ir-begin
fn F(a: i32 = 0, (b: i32 = 0, c: i32 = 0));
//@dump-sem-ir-end

