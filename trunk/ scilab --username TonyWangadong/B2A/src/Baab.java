/*
 * Created on 2004-11-1
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
import java.io.*;
/**
 * @author ryan.gao
 * convert a bin file to a ascii file.
 * convert a ascii file to a bin file.
 */
public class Baab {
    private static int BUF_LEN = 1024;
 private static String infile = "";
 private static String outfile = "";
 private static byte[] binbuffer = new byte[BUF_LEN];
 private static byte[] asciibuffer = new byte[BUF_LEN * 2];
 
 public static void main(String[] args) 
     throws IOException {
        int size = -1;
        
  if ( args.length < 2 ) {
   System.out.println("Usage:\n");
   System.out.println(" java Baab -ba binfilename\n");
   System.out.println(" java Baab -ab asciifilename\n");
  } else {
   if ( args[0].equals("-ba")) {
    System.out.println("bin to ascii");
    infile = args[1];
    outfile = args[1] + ".txt";
                if ( args.length == 3 ) {
                    size = Integer.parseInt(args[2]);
                }
    b2a( size );
   } else if ( args[0].equals("-ab")) {
                System.out.println("ascii to bin");
    infile = args[1];
    outfile = args[1] + ".bin";
    a2b();
   } else {
    System.out.println("invalid parameters");
   }
  }
 } // main
 
 static private void b2a( int size )
     throws IOException {
  int len = 0;
  int total = 0;
        int count = 1;
        
  FileInputStream fis = new FileInputStream( infile );
  FileOutputStream fout = new FileOutputStream( outfile );
  
        while ( (len = fis.read( binbuffer )) > 0 ) {
            total += len;
            if ( size > 0 && size < (total + BUF_LEN) ) {
                fout.close();
                fout = new FileOutputStream( outfile+count );
                count++;
                total = 0;
            }
         for( int i = 0; i < len; i++ ) {
          
          asciibuffer[2*i] = binbuffer[i];
                asciibuffer[2*i] >>>= 4;
                asciibuffer[2*i] &= 0x0F;
          asciibuffer[2*i+1] =  (byte)(binbuffer[i] & 0x0F);
                if ( asciibuffer[2*i] <= 9 ) {
           asciibuffer[2*i] += '0';
          } else {
           asciibuffer[2*i] += 'A'-10;
          }
          if ( asciibuffer[2*i+1] <= 9 ) {
                    asciibuffer[2*i+1] &= 0x0F;
           asciibuffer[2*i+1] += '0';           
          } else {
           asciibuffer[2*i+1] += 'A'-10;
          }/*
                if ( asciibuffer[2*i] <'0' || 
                        (asciibuffer[2*i]>'9' && asciibuffer[2*i]<'A') ||
                        (asciibuffer[2*i]>'Z')) {
                    System.out.println("ATTENTION1:"+asciibuffer[2*i]+":"+binbuffer[i]);
                }
                if ( asciibuffer[2*i+1] <'0' || 
                        (asciibuffer[2*i+1]>'9' && asciibuffer[2*i+1]<'A') ||
                        (asciibuffer[2*i+1]>'Z')) {
                    System.out.println("ATTENTION2:"+asciibuffer[2*i+1]+":"+binbuffer[i]);
                }*/
            
         } // for
         fout.write( asciibuffer, 0, 2*len );
        } // while
   
  // Close output and input resources. 
  fis.close();
  fout.close();
 }
 static private void a2b()
     throws IOException {
  int len = 0;
  FileInputStream fis = new FileInputStream( infile );
  FileOutputStream fout = new FileOutputStream( outfile );
      // Loop to read and write bytes.
  while ( (len = fis.read( asciibuffer )) > 0 ) {
   for ( int i = 0; i < len/2; i++ ){
          if ( asciibuffer[2*i] <= '9' ) {
           asciibuffer[2*i] -= '0';
          } else {
           asciibuffer[2*i] -= 'A'-10;
          }
          if ( asciibuffer[2*i+1] <= '9' ) {
           asciibuffer[2*i+1] -= '0';           
          } else {
           asciibuffer[2*i+1] -= 'A'-10;
          }
    binbuffer[i] = (byte)((asciibuffer[2*i]<<4)+asciibuffer[2*i+1]);
   }
            fout.write( binbuffer, 0, len/2 );
  }
  // Close output and input resources. 
  fis.close();
  fout.close();
 }
}