// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4398789,fgcg:0.447906,fgcb:0.5294118,fgca:1,fgde:0.005,fgrn:-5000,fgrf:100000,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|emission-6511-OUT,alpha-2440-OUT;n:type:ShaderForge.SFN_Tex2d,id:6156,x:31138,y:33501,ptovrint:False,ptlb:E1,ptin:_E1,varname:_E1,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94410b7253e18394b84a4772e6c61381,ntxv:0,isnm:False|UVIN-1805-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2152,x:30366,y:33237,varname:node_2152,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:2905,x:31136,y:33170,ptovrint:False,ptlb:E2,ptin:_E2,varname:_E2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94410b7253e18394b84a4772e6c61381,ntxv:0,isnm:False|UVIN-5122-UVOUT;n:type:ShaderForge.SFN_Panner,id:5122,x:30981,y:33170,varname:node_5122,prsc:2,spu:0,spv:-0.1|UVIN-2152-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2440,x:31833,y:32985,varname:node_2440,prsc:2|A-8626-B,B-3602-OUT;n:type:ShaderForge.SFN_Tex2d,id:8626,x:31333,y:32895,ptovrint:False,ptlb:E3,ptin:_E3,varname:_E3,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:94410b7253e18394b84a4772e6c61381,ntxv:0,isnm:False|UVIN-4656-UVOUT;n:type:ShaderForge.SFN_Panner,id:4656,x:30998,y:32902,varname:node_4656,prsc:2,spu:0,spv:0.1|UVIN-2152-UVOUT;n:type:ShaderForge.SFN_Panner,id:1805,x:30963,y:33501,varname:node_1805,prsc:2,spu:0.1,spv:0|UVIN-2152-UVOUT;n:type:ShaderForge.SFN_Multiply,id:959,x:32328,y:32729,varname:node_959,prsc:2|A-3602-OUT,B-1091-OUT;n:type:ShaderForge.SFN_Slider,id:1091,x:32129,y:32909,ptovrint:False,ptlb:Emissive,ptin:_Emissive,varname:_Emissive,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:100;n:type:ShaderForge.SFN_Multiply,id:3602,x:31757,y:33228,varname:node_3602,prsc:2|A-2905-G,B-6156-R;n:type:ShaderForge.SFN_Color,id:921,x:32328,y:32569,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1172414,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:6511,x:32524,y:32729,varname:node_6511,prsc:2|A-921-RGB,B-959-OUT;proporder:6156-2905-8626-1091-921;pass:END;sub:END;*/

Shader "Shader Forge/Neon_Disk_01" {
    Properties {
        _E1 ("E1", 2D) = "white" {}
        _E2 ("E2", 2D) = "white" {}
        _E3 ("E3", 2D) = "white" {}
        _Emissive ("Emissive", Range(0, 100)) = 0
        _Color ("Color", Color) = (0.1172414,1,0,1)
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
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _E1; uniform float4 _E1_ST;
            uniform sampler2D _E2; uniform float4 _E2_ST;
            uniform sampler2D _E3; uniform float4 _E3_ST;
            uniform float _Emissive;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_4888 = _Time;
                float2 node_5122 = (i.uv0+node_4888.g*float2(0,-0.1));
                float4 _E2_var = tex2D(_E2,TRANSFORM_TEX(node_5122, _E2));
                float2 node_1805 = (i.uv0+node_4888.g*float2(0.1,0));
                float4 _E1_var = tex2D(_E1,TRANSFORM_TEX(node_1805, _E1));
                float node_3602 = (_E2_var.g*_E1_var.r);
                float3 emissive = (_Color.rgb*(node_3602*_Emissive));
                float3 finalColor = emissive;
                float2 node_4656 = (i.uv0+node_4888.g*float2(0,0.1));
                float4 _E3_var = tex2D(_E3,TRANSFORM_TEX(node_4656, _E3));
                fixed4 finalRGBA = fixed4(finalColor,(_E3_var.b*node_3602));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _E1; uniform float4 _E1_ST;
            uniform sampler2D _E2; uniform float4 _E2_ST;
            uniform float _Emissive;
            uniform float4 _Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 node_8427 = _Time;
                float2 node_5122 = (i.uv0+node_8427.g*float2(0,-0.1));
                float4 _E2_var = tex2D(_E2,TRANSFORM_TEX(node_5122, _E2));
                float2 node_1805 = (i.uv0+node_8427.g*float2(0.1,0));
                float4 _E1_var = tex2D(_E1,TRANSFORM_TEX(node_1805, _E1));
                float node_3602 = (_E2_var.g*_E1_var.r);
                o.Emission = (_Color.rgb*(node_3602*_Emissive));
                
                float3 diffColor = float3(0,0,0);
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
