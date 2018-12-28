#import "AlfaZulu.h"

#define kAlphabetSize 26
#define kMaxStrinLength 999

@implementation AlfaZulu

- (void) awakeFromNib
{
	NSString *umaStr=@""; // clear output NSTextField...
	[output setObjectValue: umaStr];
}

- (IBAction)Processar:(id)sender
{
		char oCar; 
		NSRange r;
		NSString *aStr=[ [input stringValue] uppercaseString]; // Lê e maiuscaliza a string
		NSString *concatenatedStr=[[NSString alloc] init];
		int i, oTamanho=[aStr length];
		NSString *aTabela[kAlphabetSize]={@"Alfa",@"Bravo",@"Charlie",@"Delta",@"Echo",@"Foxtrot",@"Golf",@"Hotel",@"India",@"Juliett",
								@"Kilo",@"Lima",@"Mike",@"November",@"Oscar",@"Papa",@"Quebec",@"Romeo",@"Sierra",@"Tango",
								@"Uniform",@"Victor",@"Whiskey",@"X-ray",@"Yankee",@"Zulu"};
				
		if ( (oTamanho > 0) & (oTamanho < kMaxStrinLength) )
		{
			for (i=0;i<oTamanho;i++)
			{
				oCar = [aStr characterAtIndex:i];
				
				if (oCar==32)
					concatenatedStr=[concatenatedStr stringByAppendingString: @"\n-----------------------\n"];
				
				if (oCar>='A' & oCar<='Z')
				{
					r.location = i;
					r.length = 1;		
					concatenatedStr=[concatenatedStr stringByAppendingString: [aStr substringWithRange: r]];
					concatenatedStr=[concatenatedStr stringByAppendingString: @" - like / como em: "];
					concatenatedStr=[concatenatedStr stringByAppendingString: (aTabela[(int) oCar - 65]) ];
					concatenatedStr=[concatenatedStr stringByAppendingString: @"\n"];
				}
			}
			[output setStringValue: concatenatedStr];
		}
		else
			NSRunAlertPanel(@"Alert(a):",@"A \"palavra\" digitada deve ter, pelo menos, 1 caracter de dimensao e nao mais de 999 caracteres.\n\nThe typed \"word\" must have, at least, a dimension of 1 character and no more than 999 characters.",nil,nil,nil);
}
@end
