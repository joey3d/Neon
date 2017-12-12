// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Terrain"
{
	Properties
	{
		[Header(SF_Dirt)]
		_DirtNormal("Dirt Normal", 2D) = "bump" {}
		_GrassDirtNormal("GrassDirt Normal", 2D) = "bump" {}
		_MudNormal("Mud Normal", 2D) = "bump" {}
		_Mud("Mud", 2D) = "white" {}
		_Dirt("Dirt", 2D) = "white" {}
		_GrassDirt("GrassDirt", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#pragma target 5.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 vertexColor : COLOR;
			float2 uv_texcoord;
		};

		uniform sampler2D _DirtNormal;
		uniform sampler2D _MudNormal;
		uniform sampler2D _GrassDirtNormal;
		uniform sampler2D _Mud;
		uniform sampler2D _Dirt;
		uniform sampler2D _GrassDirt;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 temp_cast_0 = (25.0).xx;
			float2 uv_TexCoord8_g19 = i.uv_texcoord * temp_cast_0 + float2( 0,0 );
			float layeredBlendVar51 = i.vertexColor.r;
			float3 layeredBlend51 = ( lerp( UnpackNormal( tex2D( _DirtNormal, uv_TexCoord8_g19 ) ),UnpackNormal( tex2D( _MudNormal, uv_TexCoord8_g19 ) ) , layeredBlendVar51 ) );
			float layeredBlendVar57 = i.vertexColor.b;
			float3 layeredBlend57 = ( lerp( layeredBlend51,UnpackNormal( tex2D( _GrassDirtNormal, uv_TexCoord8_g19 ) ) , layeredBlendVar57 ) );
			o.Normal = layeredBlend57;
			float layeredBlendVar50 = i.vertexColor.r;
			float4 layeredBlend50 = ( lerp( tex2D( _Mud, uv_TexCoord8_g19 ),tex2D( _Dirt, uv_TexCoord8_g19 ) , layeredBlendVar50 ) );
			float layeredBlendVar54 = i.vertexColor.b;
			float4 layeredBlend54 = ( lerp( layeredBlend50,tex2D( _GrassDirt, uv_TexCoord8_g19 ) , layeredBlendVar54 ) );
			o.Albedo = layeredBlend54.rgb;
			o.Smoothness = ( i.vertexColor.g * 0.7 );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14001
337;980;1356;657;2988.32;1507.219;1.189689;True;True
Node;AmplifyShaderEditor.FunctionNode;64;-2564.118,-1143.141;Float;True;SF_Dirt;0;;19;d7c94d906cf2ff749845754037e31460;0;6;FLOAT3;0;FLOAT3;1;FLOAT3;2;COLOR;3;COLOR;4;COLOR;5
Node;AmplifyShaderEditor.VertexColorNode;6;-2065.305,8.640305;Float;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;58;-1999.133,-1454.467;Float;False;510.4386;469.5946;Dirt and Mud;2;50;51;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;42;-1526.938,487.0939;Float;False;Constant;_Float1;Float 1;1;0;0.7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;59;-1369.516,-1449.577;Float;False;327.8551;387.256;Grassy Dirt;2;54;57;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LayeredBlendNode;50;-1943.135,-1378.35;Float;False;6;0;FLOAT;0.0;False;1;COLOR;0;False;2;COLOR;0.0,0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;COLOR;0
Node;AmplifyShaderEditor.LayeredBlendNode;51;-1935.478,-1210.69;Float;False;6;0;FLOAT;0.0;False;1;FLOAT3;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LayeredBlendNode;54;-1312.183,-1401.049;Float;False;6;0;FLOAT;0.0;False;1;COLOR;0;False;2;COLOR;0,0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;62;-1057.849,184.6168;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-1104.4,29.97388;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LayeredBlendNode;57;-1304.404,-1221.488;Float;False;6;0;FLOAT;0.0;False;1;FLOAT3;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;7;Float;ASEMaterialInspector;0;0;Standard;Terrain;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;50;0;6;1
WireConnection;50;1;64;5
WireConnection;50;2;64;4
WireConnection;51;0;6;1
WireConnection;51;1;64;0
WireConnection;51;2;64;1
WireConnection;54;0;6;3
WireConnection;54;1;50;0
WireConnection;54;2;64;3
WireConnection;41;0;6;2
WireConnection;41;1;42;0
WireConnection;57;0;6;3
WireConnection;57;1;51;0
WireConnection;57;2;64;2
WireConnection;0;0;54;0
WireConnection;0;1;57;0
WireConnection;0;4;41;0
ASEEND*/
//CHKSM=4F4127455204196272420D72F6596F28ABA68A8B