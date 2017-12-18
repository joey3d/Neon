// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4398789,fgcg:0.447906,fgcb:0.5294118,fgca:1,fgde:0.005,fgrn:-5000,fgrf:100000,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-3015-OUT,alpha-8825-OUT;n:type:ShaderForge.SFN_Tex2d,id:860,x:30724,y:32877,ptovrint:False,ptlb:Lines,ptin:_Lines,varname:_Lines,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1143-UVOUT;n:type:ShaderForge.SFN_Color,id:1135,x:30730,y:32437,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:1469,x:28779,y:33903,varname:_Scanline,prsc:2,ntxv:0,isnm:False|UVIN-5126-UVOUT,TEX-9504-TEX;n:type:ShaderForge.SFN_Vector1,id:3183,x:28970,y:33858,varname:node_3183,prsc:2,v1:5;n:type:ShaderForge.SFN_Add,id:1481,x:31670,y:33043,varname:node_1481,prsc:2|A-4544-OUT,B-608-OUT;n:type:ShaderForge.SFN_Multiply,id:6612,x:30818,y:33419,varname:node_6612,prsc:2|A-1140-OUT,B-1469-R;n:type:ShaderForge.SFN_Slider,id:1140,x:28986,y:33319,ptovrint:False,ptlb:Scanline_Intensity,ptin:_Scanline_Intensity,varname:_Scanline_Intensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6020962,max:5;n:type:ShaderForge.SFN_Multiply,id:3015,x:32119,y:32753,varname:node_3015,prsc:2|A-6045-OUT,B-1481-OUT,C-1135-RGB;n:type:ShaderForge.SFN_Slider,id:6045,x:30214,y:32624,ptovrint:False,ptlb:Emission Intensity,ptin:_EmissionIntensity,varname:_EmissionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:2,cur:2,max:5;n:type:ShaderForge.SFN_Tex2dAsset,id:9504,x:28469,y:33887,ptovrint:False,ptlb:Tex,ptin:_Tex,varname:_Tex,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:5544,x:29081,y:33715,varname:node_5544,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ScreenPos,id:1143,x:27877,y:33534,varname:node_1143,prsc:2,sctp:2;n:type:ShaderForge.SFN_Panner,id:5126,x:28321,y:33599,varname:node_5126,prsc:2,spu:0,spv:0.1|UVIN-1143-UVOUT;n:type:ShaderForge.SFN_Desaturate,id:8825,x:32218,y:33159,varname:node_8825,prsc:2|COL-1481-OUT;n:type:ShaderForge.SFN_Multiply,id:4544,x:31089,y:32980,varname:node_4544,prsc:2|A-860-R,B-5334-OUT,C-2267-OUT;n:type:ShaderForge.SFN_Slider,id:5334,x:30646,y:33190,ptovrint:False,ptlb:Outline_Intensity,ptin:_Outline_Intensity,varname:_Outline_Intensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Add,id:608,x:31079,y:33379,varname:node_608,prsc:2|A-6612-OUT,B-5216-OUT;n:type:ShaderForge.SFN_Slider,id:5216,x:30343,y:33701,ptovrint:False,ptlb:Additive Fill,ptin:_AdditiveFill,varname:_AdditiveFill,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Fresnel,id:2267,x:30084,y:33170,varname:node_2267,prsc:2;proporder:860-1135-1140-6045-9504-5334-5216;pass:END;sub:END;*/

Shader "Shader Forge/HexShader" {
    Properties {
        _Lines ("Lines", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Scanline_Intensity ("Scanline_Intensity", Range(0, 5)) = 0.6020962
        _EmissionIntensity ("Emission Intensity", Range(2, 5)) = 2
        _Tex ("Tex", 2D) = "white" {}
        _Outline_Intensity ("Outline_Intensity", Range(0, 2)) = 1
        _AdditiveFill ("Additive Fill", Range(0, 1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _Lines; uniform float4 _Lines_ST;
            uniform float4 _Color;
            uniform float _Scanline_Intensity;
            uniform float _EmissionIntensity;
            uniform sampler2D _Tex; uniform float4 _Tex_ST;
            uniform float _Outline_Intensity;
            uniform float _AdditiveFill;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
////// Emissive:
                float4 _Lines_var = tex2D(_Lines,TRANSFORM_TEX(sceneUVs.rg, _Lines));
                float4 node_1182 = _Time;
                float2 node_5126 = (sceneUVs.rg+node_1182.g*float2(0,0.1));
                float4 _Scanline = tex2D(_Tex,TRANSFORM_TEX(node_5126, _Tex));
                float node_1481 = ((_Lines_var.r*_Outline_Intensity*(1.0-max(0,dot(normalDirection, viewDirection))))+((_Scanline_Intensity*_Scanline.r)+_AdditiveFill));
                float3 emissive = (_EmissionIntensity*node_1481*_Color.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,dot(node_1481,float3(0.3,0.59,0.11)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
