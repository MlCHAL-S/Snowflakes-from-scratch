RSRC                     Shader                                                                               local://-1 �          Shader      �_code             fragment_ofs           	   fragment    �  uniform vec3 HSV;
uniform float opacity = 1.0;

vec3 rgb2hsv(vec3 c) {
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec3 c = tex(TEXTURE, UV).rgb;
vec3 fragHSV = rgb2hsv(c);
fragHSV.x += HSV.x / 360.0;
fragHSV.y += HSV.y;
fragHSV.z += HSV.z;
fragHSV.x = mod(fragHSV.x, 1.0);
fragHSV.y = clamp(fragHSV.y, 0.0, 1.0);
fragHSV.z = clamp(fragHSV.z, 0.0, 1.0);

COLOR = vec4(hsv2rgb(fragHSV), min(tex(TEXTURE, UV).a, opacity));       vertex_ofs              vertex           
   light_ofs              light        RSRC