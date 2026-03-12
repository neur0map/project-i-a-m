vec4 close_color(vec3 coords_geo, vec3 size_geo) {
    float progress = 1.0 - niri_clamped_progress;
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(coords_geo.xy, center);
    float max_dist = distance(vec2(0.0, 0.0), center);
    float radius = progress * max_dist * 1.1;
    float edge = smoothstep(radius, radius - 0.04, dist);
    vec3 coords_tex = niri_geo_to_tex * coords_geo;
    vec4 color = texture2D(niri_tex, coords_tex.st);
    return color * edge;
}
