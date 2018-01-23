#tag Class
Protected Class StringStack
Implements TextAutocompleteSource
	#tag Method, Flags = &h0
		Sub addWordToDictionary(s as String)
		  if s <> "" then Collector.Append s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(source() as String)
		  Collector = source
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function returnMatch(s as String) As String
		  // Part of the TextAutocompleteSource interface.
		  
		  dim n as integer = len(s)
		  
		  for each element as String in Collector
		    
		    dim t as string = element.mid(1,n)
		    
		    if t = s then return element
		    
		  next
		  
		  Return  ""
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Collector(-1) As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
