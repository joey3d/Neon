// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7686-OUT,alpha-9456-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31775,y:32633,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.4444444,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3538,x:32124,y:32550,varname:node_3538,prsc:2|A-7241-RGB,B-8785-OUT,C-362-R;n:type:ShaderForge.SFN_Slider,id:8785,x:31775,y:32923,ptovrint:False,ptlb:Emission Intensity,ptin:_EmissionIntensity,varname:_EmissionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.334199,max:5;n:type:ShaderForge.SFN_Tex2dAsset,id:2881,x:31832,y:33367,ptovrint:False,ptlb:Sign,ptin:_Sign,varname:_Sign,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f26881eee1c52984a9f0dc327955cc75,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:362,x:32077,y:33173,varname:_node_362,prsc:2,tex:f26881eee1c52984a9f0dc327955cc75,ntxv:0,isnm:False|TEX-2881-TEX;n:type:ShaderForge.SFN_SwitchProperty,id:7686,x:32412,y:32618,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_7686,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3538-OUT,B-7890-OUT;n:type:ShaderForge.SFN_Tex2d,id:8012,x:31643,y:32804,ptovrint:False,ptlb:NeonSigns,ptin:_NeonSigns,varname:node_8012,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7eff04d3da9051741948c20281f7aab6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:9456,x:32330,y:33069,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:_Texture_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-362-R,B-8012-A;n:type:ShaderForge.SFN_Multiply,id:7890,x:32244,y:32798,varname:node_7890,prsc:2|A-8012-RGB,B-8785-OUT;proporder:7241-8785-2881-8012-9456-7686;pass:END;sub:END;*/

Shader "Shader Forge/NeonSign" {
    Properties {
        _Color ("Color", Color) = (0,0.4444444,1,1)
        _EmissionIntensity ("Emission Intensity", Range(0, 5)) = 3.334199
        _Sign ("Sign", 2D) = "white" {}
        _NeonSigns ("NeonSigns", 2D) = "white" {}
        [MaterialToggle] _Alpha ("Alpha", Float ) = 0
        [MaterialToggle] _Texture ("Texture", Float ) = 0
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
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _EmissionIntensity;
            uniform sampler2D _Sign; uniform float4 _Sign_ST;
            uniform fixed _Texture;
            uniform sampler2D _NeonSigns; uniform float4 _NeonSigns_ST;
            uniform fixed _Alpha;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 _node_362 = tex2D(_Sign,TRANSFORM_TEX(i.uv0, _Sign));
                float4 _NeonSigns_var = tex2D(_NeonSigns,TRANSFORM_TEX(i.uv0, _NeonSigns));
                float3 emissive = lerp( (_Color.rgb*_EmissionIntensity*_node_362.r), (_NeonSigns_var.rgb*_EmissionIntensity), _Texture );
                float3 finalColor = emissive;
                return fixed4(finalColor,lerp( _node_362.r, _NeonSigns_var.a, _Alpha ));
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
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
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
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
