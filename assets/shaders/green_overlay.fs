extern number green_count;

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    vec4 pixel = Texel(texture, texture_coords);
    vec3 green = vec3(0.0, 1.0, 0.0);
    float strength = min(green_count * 0.25, 0.85);
    vec3 blended = mix(pixel.rgb, green, strength);
    return vec4(blended, pixel.a) * colour;
}