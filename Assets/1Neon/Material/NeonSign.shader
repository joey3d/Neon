// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7686-OUT,alpha-9456-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31775,y:32633,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.4444444,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3538,x:32124,y:32550,varname:node_3538,prsc:2|A-7241-RGB,B-8785-OUT,C-362-R;n:type:ShaderForge.SFN_Slider,id:8785,x:31415,y:33088,ptovrint:False,ptlb:Emission Intensity,ptin:_EmissionIntensity,varname:_EmissionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Tex2dAsset,id:2881,x:31538,y:33363,ptovrint:False,ptlb:Sign,ptin:_Sign,varname:_Sign,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f26881eee1c52984a9f0dc327955cc75,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:362,x:31936,y:33231,varname:_node_362,prsc:2,tex:f26881eee1c52984a9f0dc327955cc75,ntxv:0,isnm:False|TEX-2881-TEX;n:type:ShaderForge.SFN_SwitchProperty,id:7686,x:32412,y:32618,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_7686,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3538-OUT,B-7890-OUT;n:type:ShaderForge.SFN_Tex2d,id:8012,x:31376,y:32770,ptovrint:False,ptlb:NeonSigns,ptin:_NeonSigns,varname:node_8012,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:9456,x:32344,y:33259,ptovrint:False,ptlb:Alpha,ptin:_Alpha,varname:_Texture_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-362-R,B-1864-OUT;n:type:ShaderForge.SFN_Multiply,id:7890,x:32244,y:32798,varname:node_7890,prsc:2|A-8012-RGB,B-8785-OUT;n:type:ShaderForge.SFN_Multiply,id:1864,x:31799,y:32894,varname:node_1864,prsc:2|A-8012-A,B-3347-R;n:type:ShaderForge.SFN_Tex2d,id:3347,x:31129,y:32934,ptovrint:False,ptlb:Scanline,ptin:_Scanline,varname:_NeonSigns_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:525f7bb19c9f43245b2acda36bd113f1,ntxv:0,isnm:False|UVIN-4180-UVOUT;n:type:ShaderForge.SFN_ScreenPos,id:7396,x:30627,y:32878,varname:node_7396,prsc:2,sctp:0;n:type:ShaderForge.SFN_Panner,id:4180,x:30713,y:33084,varname:node_4180,prsc:2,spu:0.1,spv:0.1|UVIN-7396-UVOUT;proporder:7241-8785-2881-8012-9456-7686-3347;pass:END;sub:END;*/

Shader "Shader Forge/NeonSign" {
    Properties {
        _Color ("Color", Color) = (0,0.4444444,1,1)
        _EmissionIntensity ("Emission Intensity", Range(0, 10)) = 1
        _Sign ("Sign", 2D) = "white" {}
        _NeonSigns ("NeonSigns", 2D) = "white" {}
        [MaterialToggle] _Alpha ("Alpha", Float ) = 0
        [MaterialToggle] _Texture ("Texture", Float ) = 0
        _Scanline ("Scanline", 2D) = "white" {}
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
            uniform sampler2D _Scanline; uniform float4 _Scanline_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
////// Lighting:
////// Emissive:
                float4 _node_362 = tex2D(_Sign,TRANSFORM_TEX(i.uv0, _Sign));
                float4 _NeonSigns_var = tex2D(_NeonSigns,TRANSFORM_TEX(i.uv0, _NeonSigns));
                float3 emissive = lerp( (_Color.rgb*_EmissionIntensity*_node_362.r), (_NeonSigns_var.rgb*_EmissionIntensity), _Texture );
                float3 finalColor = emissive;
                float4 node_7759 = _Time;
                float2 node_4180 = ((sceneUVs * 2 - 1).rg+node_7759.g*float2(0.1,0.1));
                float4 _Scanline_var = tex2D(_Scanline,TRANSFORM_TEX(node_4180, _Scanline));
                return fixed4(finalColor,lerp( _node_362.r, (_NeonSigns_var.a*_Scanline_var.r), _Alpha ));
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
