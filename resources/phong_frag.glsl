#version 330 core 
uniform vec3 MatAmb;
uniform vec3 MatDif;
uniform vec3 MatSpec;
uniform vec3 lightPos;
uniform float shine;
in vec3 fragNor;
in vec3 fragPos;
out vec4 color;

void main()
{
   
   vec3 lVec = normalize(lightPos - fragPos);
   vec3 lightColor = vec3(1.0, 1.0, 1.0);

   vec3 diffuse = MatDif * dot(normalize(fragNor), lVec) * lightColor;

   vec3 view = normalize(-1 * fragPos);
   vec3 refl = normalize(-lVec + (2 * dot(lVec, fragNor) * fragNor));
   vec3 specular = MatSpec * pow(max(dot(view, refl), 0), shine) * lightColor;

   vec3 ambient = MatAmb * lightColor;

	color = vec4(diffuse + specular + ambient, 1.0);
}
