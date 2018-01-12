// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.2980392,fgcg:0.1960784,fgcb:0.1490196,fgca:1,fgde:0.005,fgrn:-5000,fgrf:20000,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32986,y:32690,varname:node_3138,prsc:2|emission-23-OUT,clip-4510-OUT;n:type:ShaderForge.SFN_Tex2d,id:2960,x:31568,y:32720,varname:node_2960,prsc:2,tex:525f7bb19c9f43245b2acda36bd113f1,ntxv:0,isnm:False|UVIN-8951-UVOUT,TEX-2151-TEX;n:type:ShaderForge.SFN_ScreenPos,id:1866,x:31195,y:33000,varname:node_1866,prsc:2,sctp:0;n:type:ShaderForge.SFN_Multiply,id:8580,x:32183,y:32688,varname:node_8580,prsc:2|A-1488-RGB,B-2095-OUT;n:type:ShaderForge.SFN_Color,id:1488,x:31778,y:32514,ptovrint:False,ptlb:TextColor,ptin:_TextColor,varname:node_1488,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.5618661,c3:0.007352948,c4:1;n:type:ShaderForge.SFN_Slider,id:3780,x:31951,y:32387,ptovrint:False,ptlb:TextEmiss,ptin:_TextEmiss,varname:node_3780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5.741192,max:50;n:type:ShaderForge.SFN_Tex2dAsset,id:2151,x:30887,y:32680,ptovrint:False,ptlb:Scrollsign,ptin:_Scrollsign,varname:node_2151,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:525f7bb19c9f43245b2acda36bd113f1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:4718,x:31778,y:32982,ptovrint:False,ptlb:SFSUCKS,ptin:_SFSUCKS,varname:node_4718,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:525f7bb19c9f43245b2acda36bd113f1,ntxv:0,isnm:False|UVIN-9810-UVOUT;n:type:ShaderForge.SFN_Panner,id:9810,x:31440,y:33052,varname:node_9810,prsc:2,spu:0.1,spv:0|UVIN-1866-UVOUT;n:type:ShaderForge.SFN_Panner,id:8951,x:31370,y:32483,varname:node_8951,prsc:2,spu:0.1,spv:0|UVIN-6939-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6939,x:30466,y:32889,varname:node_6939,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:7681,x:30702,y:32966,varname:node_7681,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:4510,x:32220,y:33198,varname:node_4510,prsc:2|A-4718-R,B-889-OUT;n:type:ShaderForge.SFN_Slider,id:889,x:31796,y:33302,ptovrint:False,ptlb:Clip,ptin:_Clip,varname:node_889,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:20;n:type:ShaderForge.SFN_Multiply,id:3062,x:32341,y:33004,varname:node_3062,prsc:2|A-8309-RGB,B-4510-OUT;n:type:ShaderForge.SFN_Color,id:8309,x:31980,y:32868,ptovrint:False,ptlb:Color2,ptin:_Color2,varname:_TextColor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.007352948,c2:0.5070996,c3:1,c4:1;n:type:ShaderForge.SFN_Blend,id:5428,x:32658,y:32770,varname:node_5428,prsc:2,blmd:18,clmp:True|SRC-8580-OUT,DST-3062-OUT;n:type:ShaderForge.SFN_Multiply,id:23,x:32638,y:32528,varname:node_23,prsc:2|A-3780-OUT,B-5428-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:2095,x:31888,y:32719,ptovrint:False,ptlb:Text>,ptin:_Text,varname:node_2095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2960-G,B-2960-R;proporder:1488-3780-2151-4718-889-8309-2095;pass:END;sub:END;*/

Shader "Shader Forge/ScrollSign" {
    Properties {
        _TextColor ("TextColor", Color) = (1,0.5618661,0.007352948,1)
        _TextEmiss ("TextEmiss", Range(0, 50)) = 5.741192
        _Scrollsign ("Scrollsign", 2D) = "white" {}
        _SFSUCKS ("SFSUCKS", 2D) = "white" {}
        _Clip ("Clip", Range(0, 20)) = 1
        _Color2 ("Color2", Color) = (0.007352948,0.5070996,1,1)
        [MaterialToggle] _Text ("Text>", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TextColor;
            uniform float _TextEmiss;
            uniform sampler2D _Scrollsign; uniform float4 _Scrollsign_ST;
            uniform sampler2D _SFSUCKS; uniform float4 _SFSUCKS_ST;
            uniform float _Clip;
            uniform float4 _Color2;
            uniform fixed _Text;
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
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 node_5062 = _Time;
                float2 node_9810 = ((sceneUVs * 2 - 1).rg+node_5062.g*float2(0.1,0));
                float4 _SFSUCKS_var = tex2D(_SFSUCKS,TRANSFORM_TEX(node_9810, _SFSUCKS));
                float node_4510 = (_SFSUCKS_var.r*_Clip);
                clip(node_4510 - 0.5);
////// Lighting:
////// Emissive:
                float2 node_8951 = (i.uv0+node_5062.g*float2(0.1,0));
                float4 node_2960 = tex2D(_Scrollsign,TRANSFORM_TEX(node_8951, _Scrollsign));
                float3 emissive = (_TextEmiss*saturate((0.5 - 2.0*((_TextColor.rgb*lerp( node_2960.g, node_2960.r, _Text ))-0.5)*((_Color2.rgb*node_4510)-0.5))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
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
            uniform sampler2D _SFSUCKS; uniform float4 _SFSUCKS_ST;
            uniform float _Clip;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 projPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float4 node_855 = _Time;
                float2 node_9810 = ((sceneUVs * 2 - 1).rg+node_855.g*float2(0.1,0));
                float4 _SFSUCKS_var = tex2D(_SFSUCKS,TRANSFORM_TEX(node_9810, _SFSUCKS));
                float node_4510 = (_SFSUCKS_var.r*_Clip);
                clip(node_4510 - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
