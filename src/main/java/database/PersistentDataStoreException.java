package database;

/** Exception indicating that something went wrong with data storage. */
public class PersistentDataStoreException extends Exception {
/**
* Constructs a new PersistentDataStoreException.
*
* @param cause the cause of this PersistentDataStoreException
*/
public PersistentDataStoreException(Exception cause) {
	super(cause);
}
}

