#tag Class
Protected Class TextFieldAutocomplete
Inherits textfield
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if autocomplete = false then return raiseevent KeyDown(Key)
		  
		  if specialCharacter(key) = true then Return False
		  
		  if asc(key) = 9 and TabKeyAutocompletes = true and me.SelLength > 0 then
		    
		    me.SelStart = me.Text.Len
		    me.SelLength = 0
		    
		    Return true
		    
		  end
		  
		  dim tempText as String = me.Text.Left(me.SelStart) + Key
		  
		  dim matchingText as String = ""
		  
		  if autocompleteSource <> nil then
		    
		    matchingText = autocompleteSource.returnMatch(tempText)
		    
		  elseif globalAutocompleteSource <> nil then
		    
		    matchingText = globalAutocompleteSource.returnMatch(tempText)
		    
		  end
		  
		  if matchingText <> "" then
		    
		    me.Text = matchingText
		    
		    dim startOffset as integer = len(tempText)
		    
		    me.SelStart = startOffset
		    
		    me.SelLength = len(matchingText) - startOffset
		    
		    Return true
		    
		  end
		  
		  return false
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addSpecialCharacters(s() as String)
		  specialCharacters = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function specialCharacter(key as string) As Boolean
		  if specialCharacters.Ubound > 0 then
		    
		    for each item as string in specialCharacters
		      
		      if item = key then Return true
		      
		    next
		    
		  end
		  
		  return False
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
	#tag EndHook


	#tag Note, Name = About TextField Autocomplete
		This code was created as part of the Spanish Tutorial created by:
		
		Javier Rodríguez
		Spanish Xojo Evangelist
		Xojo
		www.xojo.com
		www.twitter.com/xojoes
		
		Author of GuancheMOS plugin, Markdown Parser for Xojo, Snippery and other resources for Xojo developers!
		
		Visit: www.aprendexojo.com
		
		You can also watch the tutorial video at Xojo's YouTube Channel:
		
		https://www.youtube.com/user/goxojo
		
		Have Fun!! (and a long and prosper coding! ;-D)
	#tag EndNote


	#tag Property, Flags = &h0
		Autocomplete As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		autocompleteSource As TextAutocompleteSource
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared globalAutocompleteSource As TextAutocompleteSource
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared specialCharacters() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TabKeyAutocompletes As Boolean = true
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Autocomplete"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CueText"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabKeyAutocompletes"
			Visible=true
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="80"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
