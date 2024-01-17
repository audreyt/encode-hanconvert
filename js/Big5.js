const fetchOrLoad = async (fn) => {
  if (globalThis.Deno) {
    return await Deno.readTextFile(fn);
  }
  return await (await fetch(fn)).text();
};

const fetchMap = async (fn, reverse, map = {}) => {
  const txt = await fetchOrLoad(fn);
  const ss = txt.split("\n");
  for (let i = 2; i < ss.length; i++) {
    const s = ss[i];
    if (reverse) {
      map[s[2]] = s[0];
    } else {
      map[s[0]] = s[2];
    }
  }
  return map;

};

// big5_to_gb
// 簡体字中国語（Simplified Chinese） charset=GB2312
// 繁体字中国語（Big5）用のフォント charset=big5

const fetchG2BMap = async () => {
  const map = {};
  await fetchMap("../map/g2b_map.utf8", false, map);
  await fetchMap("../map/b2g_map.utf8", true, map);
  return map;
};

const g2b = await fetchG2BMap();

export const gb_to_big5 = (s) => {
  const ss = [];
  for (const c of s) {
    const c2 = g2b[c];
    ss.push(c2 || c);
  }
  return ss.join("");
};

export const Big5 = {
  encode: gb_to_big5,
};
