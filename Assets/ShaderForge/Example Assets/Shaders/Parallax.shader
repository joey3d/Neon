// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:0,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:True,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:False,igpj:True,qofs:0,qpre:4,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:-20,fgrf:500,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:0,x:34193,y:32561,varname:node_0,prsc:2|diff-6899-RGB,spec-5608-OUT,gloss-46-OUT,normal-2339-OUT,emission-6247-OUT,alpha-2845-OUT;n:type:ShaderForge.SFN_Multiply,id:35,x:30321,y:31737,varname:node_35,prsc:2|A-37-UVOUT,B-36-OUT;n:type:ShaderForge.SFN_Vector1,id:36,x:29597,y:31692,varname:node_36,prsc:2,v1:8;n:type:ShaderForge.SFN_TexCoord,id:37,x:29860,y:31684,varname:node_37,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:46,x:33348,y:32920,varname:node_46,prsc:2,v1:1;n:type:ShaderForge.SFN_Parallax,id:110,x:30282,y:32161,varname:node_110,prsc:2|UVIN-35-OUT,HEI-111-A,DEP-245-OUT,REF-9449-OUT;n:type:ShaderForge.SFN_Tex2d,id:111,x:29696,y:32023,varname:node_574,prsc:2,tex:45cbd32194b6fdf4a83026e555de4b89,ntxv:0,isnm:False|UVIN-35-OUT,TEX-113-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:113,x:29394,y:32092,ptovrint:False,ptlb:AO (RGB) Height (A),ptin:_AORGBHeightA,varname:_AORGBHeightA,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:45cbd32194b6fdf4a83026e555de4b89,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:123,x:31788,y:32266,varname:node_577,prsc:2,tex:73faead56eeccd64b84c8696895b58e2,ntxv:0,isnm:False|UVIN-4020-UVOUT,TEX-2402-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:2402,x:31005,y:32064,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:73faead56eeccd64b84c8696895b58e2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_DepthBlend,id:4489,x:33285,y:34541,varname:node_4489,prsc:2|DIST-1997-OUT;n:type:ShaderForge.SFN_Color,id:6899,x:33415,y:32197,ptovrint:False,ptlb:WaterColor,ptin:_WaterColor,varname:_WaterColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1470588,c2:0.1369765,c3:0.1189447,c4:1;n:type:ShaderForge.SFN_Slider,id:245,x:29805,y:32367,ptovrint:False,ptlb:Depth,ptin:_Depth,varname:_Depth,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Fresnel,id:5254,x:32021,y:33129,varname:node_5254,prsc:2|NRM-7243-OUT,EXP-1400-OUT;n:type:ShaderForge.SFN_NormalVector,id:7243,x:31312,y:32835,prsc:2,pt:True;n:type:ShaderForge.SFN_Add,id:5608,x:32255,y:33280,varname:node_5608,prsc:2|A-5254-OUT,B-1027-OUT;n:type:ShaderForge.SFN_Slider,id:1027,x:31707,y:33488,ptovrint:False,ptlb:FresnelBias,ptin:_FresnelBias,varname:_FresnelBias,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Panner,id:4020,x:31395,y:32058,varname:node_4020,prsc:2,spu:0.05,spv:-0.04|UVIN-110-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3594,x:31820,y:32505,varname:_node_6092,prsc:2,tex:73faead56eeccd64b84c8696895b58e2,ntxv:0,isnm:False|UVIN-3486-UVOUT,TEX-2402-TEX;n:type:ShaderForge.SFN_Panner,id:3486,x:31050,y:32393,varname:node_3486,prsc:2,spu:0.047,spv:0.06|UVIN-3288-OUT;n:type:ShaderForge.SFN_NormalBlend,id:2339,x:32441,y:32439,varname:node_2339,prsc:2|BSE-123-RGB,DTL-3594-RGB;n:type:ShaderForge.SFN_Multiply,id:3288,x:30833,y:32418,varname:node_3288,prsc:2|A-110-UVOUT,B-2719-OUT;n:type:ShaderForge.SFN_Vector1,id:2719,x:30613,y:32481,varname:node_2719,prsc:2,v1:0.75;n:type:ShaderForge.SFN_LightPosition,id:4612,x:31689,y:33958,varname:node_4612,prsc:2;n:type:ShaderForge.SFN_Dot,id:6006,x:31891,y:34011,varname:node_6006,prsc:2,dt:1|A-4612-XYZ,B-5836-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:5836,x:31689,y:34150,varname:node_5836,prsc:2;n:type:ShaderForge.SFN_Power,id:2322,x:32918,y:33826,varname:node_2322,prsc:2|VAL-6071-OUT,EXP-161-OUT;n:type:ShaderForge.SFN_LightColor,id:1051,x:31988,y:34225,varname:node_1051,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6247,x:33055,y:33768,varname:node_6247,prsc:2|A-3954-OUT,B-2322-OUT;n:type:ShaderForge.SFN_Slider,id:3652,x:32639,y:34146,ptovrint:False,ptlb:ReflectionBias,ptin:_ReflectionBias,varname:_ReflectionBias,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:1400,x:31562,y:33240,ptovrint:False,ptlb:FresnelPower,ptin:_FresnelPower,varname:_FresnelPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:3954,x:32442,y:33740,ptovrint:False,ptlb:Reflection Intensity,ptin:_ReflectionIntensity,varname:_ReflectionIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Multiply,id:2845,x:33675,y:34606,varname:node_2845,prsc:2|A-4489-OUT,B-7127-OUT;n:type:ShaderForge.SFN_Slider,id:7127,x:33005,y:34857,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:_Opacity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:1997,x:32977,y:34633,ptovrint:False,ptlb:Blend Distance,ptin:_BlendDistance,varname:_BlendDistance,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_RemapRange,id:161,x:32998,y:34057,varname:node_161,prsc:2,frmn:0,frmx:1,tomn:10,tomx:1000|IN-3652-OUT;n:type:ShaderForge.SFN_Vector1,id:9449,x:30139,y:32342,varname:node_9449,prsc:2,v1:0.04;n:type:ShaderForge.SFN_Tex2dAsset,id:8635,x:30123,y:32698,ptovrint:False,ptlb:AO (RGB) Height (A)_copy,ptin:_AORGBHeightA_copy,varname:_AORGBHeightA_copy,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:45cbd32194b6fdf4a83026e555de4b89,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9210,x:30761,y:32591,varname:_node_5765,prsc:2,tex:45cbd32194b6fdf4a83026e555de4b89,ntxv:0,isnm:False|UVIN-9707-UVOUT,TEX-8635-TEX;n:type:ShaderForge.SFN_Tex2d,id:3273,x:30772,y:32861,varname:_node_7654,prsc:2,tex:45cbd32194b6fdf4a83026e555de4b89,ntxv:0,isnm:False|UVIN-8803-UVOUT,TEX-8635-TEX;n:type:ShaderForge.SFN_Blend,id:1071,x:30936,y:32724,varname:node_1071,prsc:2,blmd:10,clmp:True|SRC-9210-R,DST-3273-R;n:type:ShaderForge.SFN_Panner,id:9707,x:30190,y:32311,varname:node_9707,prsc:2,spu:0.05,spv:-0.04|UVIN-8982-OUT;n:type:ShaderForge.SFN_Panner,id:8803,x:29989,y:32493,varname:node_8803,prsc:2,spu:0.047,spv:0.06|UVIN-8982-OUT;n:type:ShaderForge.SFN_TexCoord,id:843,x:29228,y:32442,varname:node_843,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:8982,x:29468,y:32536,varname:node_8982,prsc:2|A-843-UVOUT,B-36-OUT;n:type:ShaderForge.SFN_Blend,id:6071,x:32289,y:33979,varname:node_6071,prsc:2,blmd:19,clmp:True|SRC-6006-OUT,DST-1051-RGB;proporder:113-2402-6899-245-1027-3652-1400-3954-7127-1997-8635;pass:END;sub:END;*/

Shader "Shader Forge/Examples/Parallax" {
    Properties {
        _AORGBHeightA ("AO (RGB) Height (A)", 2D) = "white" {}
        _Normal ("Normal", 2D) = "bump" {}
        _WaterColor ("WaterColor", Color) = (0.1470588,0.1369765,0.1189447,1)
        _Depth ("Depth", Range(0, 1)) = 0
        _FresnelBias ("FresnelBias", Range(0, 1)) = 1
        _ReflectionBias ("ReflectionBias", Range(0, 1)) = 1
        _FresnelPower ("FresnelPower", Range(0, 10)) = 1
        _ReflectionIntensity ("Reflection Intensity", Range(0, 5)) = 1
        _Opacity ("Opacity", Range(0, 1)) = 1
        _BlendDistance ("Blend Distance", Range(0, 10)) = 1
        _AORGBHeightA_copy ("AO (RGB) Height (A)_copy", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Overlay"
            "RenderType"="Transparent"
        }
        LOD 128
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _AORGBHeightA; uniform float4 _AORGBHeightA_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float4 _WaterColor;
            uniform float _Depth;
            uniform float _FresnelBias;
            uniform float _ReflectionBias;
            uniform float _FresnelPower;
            uniform float _ReflectionIntensity;
            uniform float _Opacity;
            uniform float _BlendDistance;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 projPos : TEXCOORD7;
                UNITY_FOG_COORDS(8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1015 = _Time;
                float node_36 = 8.0;
                float2 node_35 = (i.uv0*node_36);
                float4 node_574 = tex2D(_AORGBHeightA,TRANSFORM_TEX(node_35, _AORGBHeightA));
                float2 node_110 = (_Depth*(node_574.a - 0.04)*mul(tangentTransform, viewDirection).xy + node_35);
                float2 node_4020 = (node_110.rg+node_1015.g*float2(0.05,-0.04));
                float3 node_577 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_4020, _Normal)));
                float2 node_3486 = ((node_110.rg*0.75)+node_1015.g*float2(0.047,0.06));
                float3 _node_6092 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_3486, _Normal)));
                float3 node_2339_nrm_base = node_577.rgb + float3(0,0,1);
                float3 node_2339_nrm_detail = _node_6092.rgb * float3(-1,-1,1);
                float3 node_2339_nrm_combined = node_2339_nrm_base*dot(node_2339_nrm_base, node_2339_nrm_detail)/node_2339_nrm_base.z - node_2339_nrm_detail;
                float3 node_2339 = node_2339_nrm_combined;
                float3 normalLocal = node_2339;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 1.0;
                float perceptualRoughness = 1.0 - 1.0;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float node_5608 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower)+_FresnelBias);
                float3 specularColor = float3(node_5608,node_5608,node_5608);
                float specularMonochrome;
                float3 diffuseColor = _WaterColor.rgb; // Need this for specular when using metallic
                diffuseColor = EnergyConservationBetweenDiffuseAndSpecular(diffuseColor, specularColor, specularMonochrome);
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float node_6006 = max(0,dot(_WorldSpaceLightPos0.rgb,viewReflectDirection));
                float3 emissive = (_ReflectionIntensity*pow(saturate((_LightColor0.rgb-node_6006)),(_ReflectionBias*990.0+10.0)));
/// Final Color:
                float3 finalColor = diffuse * (saturate((sceneZ-partZ)/_BlendDistance)*_Opacity) + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,(saturate((sceneZ-partZ)/_BlendDistance)*_Opacity));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform sampler2D _AORGBHeightA; uniform float4 _AORGBHeightA_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float4 _WaterColor;
            uniform float _Depth;
            uniform float _FresnelBias;
            uniform float _ReflectionBias;
            uniform float _FresnelPower;
            uniform float _ReflectionIntensity;
            uniform float _Opacity;
            uniform float _BlendDistance;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 projPos : TEXCOORD7;
                LIGHTING_COORDS(8,9)
                UNITY_FOG_COORDS(10)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_6020 = _Time;
                float node_36 = 8.0;
                float2 node_35 = (i.uv0*node_36);
                float4 node_574 = tex2D(_AORGBHeightA,TRANSFORM_TEX(node_35, _AORGBHeightA));
                float2 node_110 = (_Depth*(node_574.a - 0.04)*mul(tangentTransform, viewDirection).xy + node_35);
                float2 node_4020 = (node_110.rg+node_6020.g*float2(0.05,-0.04));
                float3 node_577 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_4020, _Normal)));
                float2 node_3486 = ((node_110.rg*0.75)+node_6020.g*float2(0.047,0.06));
                float3 _node_6092 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_3486, _Normal)));
                float3 node_2339_nrm_base = node_577.rgb + float3(0,0,1);
                float3 node_2339_nrm_detail = _node_6092.rgb * float3(-1,-1,1);
                float3 node_2339_nrm_combined = node_2339_nrm_base*dot(node_2339_nrm_base, node_2339_nrm_detail)/node_2339_nrm_base.z - node_2339_nrm_detail;
                float3 node_2339 = node_2339_nrm_combined;
                float3 normalLocal = node_2339;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = 1.0;
                float perceptualRoughness = 1.0 - 1.0;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float node_5608 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower)+_FresnelBias);
                float3 specularColor = float3(node_5608,node_5608,node_5608);
                float specularMonochrome;
                float3 diffuseColor = _WaterColor.rgb; // Need this for specular when using metallic
                diffuseColor = EnergyConservationBetweenDiffuseAndSpecular(diffuseColor, specularColor, specularMonochrome);
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse * (saturate((sceneZ-partZ)/_BlendDistance)*_Opacity) + specular;
                fixed4 finalRGBA = fixed4(finalColor,0);
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 psp2 n3ds wiiu 
            #pragma target 3.0
            uniform float4 _WaterColor;
            uniform float _FresnelBias;
            uniform float _ReflectionBias;
            uniform float _FresnelPower;
            uniform float _ReflectionIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightColor = _LightColor0.rgb;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float node_6006 = max(0,dot(_WorldSpaceLightPos0.rgb,viewReflectDirection));
                o.Emission = (_ReflectionIntensity*pow(saturate((_LightColor0.rgb-node_6006)),(_ReflectionBias*990.0+10.0)));
                
                float3 diffColor = _WaterColor.rgb;
                float node_5608 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPower)+_FresnelBias);
                float3 specColor = float3(node_5608,node_5608,node_5608);
                float specularMonochrome = max(max(specColor.r, specColor.g),specColor.b);
                diffColor *= (1.0-specularMonochrome);
                float roughness = 1.0 - 1.0;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
