<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>	
<Gesture_set>
			
	<Gesture id="drag-x" type="drag">
		<comment></comment>
		<match>
			<action>
				<initial>
					<cluster point_number="0" point_number_min="1" point_number_max="10"/>
				</initial>
			</action>
		</match>	
		<analysis>
			<algorithm class="kinemetric" type="continuous">
				<library module="drag"/>
				<returns>
					<property id="drag_dx" result="dx"/>
				</returns>
			</algorithm>
		</analysis>						
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="drag">
					<property ref="drag_dx" target="x"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
		
</Gesture_set>					
</GestureMarkupLanguage>