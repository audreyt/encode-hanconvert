import * as t from "https://deno.land/std/testing/asserts.ts";
import { gb_to_big5 } from "./Big5.js";

Deno.test("simple", () => {
  t.assertEquals(gb_to_big5("気"), "氣");
  t.assertEquals(gb_to_big5("气"), "氣");
});
Deno.test("sentense", () => {
  t.assertEquals(gb_to_big5("日本的参与！"), "日本的葠與！");
});
