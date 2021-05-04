/*
 * @author: Leonardo Pereira - TOPi
 */
public with sharing class EmailTemplateHelper {
    
    public static String format( String htmlBody, List<SObject> objectsToMapFrom ) {

        Map<String, String> valuesByObjectFields = new Map<String, String>();

        getObjectValues( objectsToMapFrom, valuesByObjectFields );

        return replaceHtmlBodyWithValues( htmlBody, valuesByObjectFields );
    }

    private static String replaceHtmlBodyWithValues( String htmlBody, Map<String, String> valuesByObjectFields ) {
        
        for( String fieldName : valuesByObjectFields.keySet() ) {

            htmlBody = htmlBody.replaceAll( fieldName, valuesByObjectFields.get( fieldName ) );
        }

        return htmlBody;
    }

    private static void getObjectValues( List<SObject> objectsToMapFrom, Map<String, String> valuesByObjectFields ) {

        for( Sobject sobj : objectsToMapFrom ) {
            
            String objectName = convertSObjectTypeToString( sobj.getSObjectType() );

            Map<String, Object> valuesByFieldName = sobj.getPopulatedFieldsAsMap();

            setValueByObjectFields( objectName, valuesByFieldName, valuesByObjectFields );
        }
    }
    
    private static void setValueByObjectFields( String objectName, Map<String, Object> valuesByFieldName, Map<String, String> valuesByObjectFields ) {

        for ( String fieldName : valuesByFieldName.keySet() ){

            valuesByObjectFields.put( formatToReplaceText( objectName, fieldName ), 
                                        convertObjectToString( valuesByFieldName.get(fieldName) ) );
        }
    }

    private static String formatToReplaceText( String objectName, String fieldName ) {
        return '\\{!' + objectName + '.' + fieldName + '\\}';
    }

    private static String convertSObjectTypeToString( Schema.SObjectType SObjectType ) {
        return '' + SObjectType;
    }

    private static String convertObjectToString( Object obj ) { 
        return '' + obj;
    }
}
