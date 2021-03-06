package database;

import java.util.List;
import data.User;

/**
 * This class is the interface between the application and PersistentDataStore, which handles
 * interactions with Google App Engine's Datastore service. Currently this class simply passes
 * function calls through to PersistentDataStore, but this could be modified to make asynchronous
 * calls or to point to a different backend storage system.
 *
 */
public class PersistentStorageAgent {

  private static PersistentStorageAgent instance;

  private final PersistentDataStore persistentDataStore;

  /**
   * Access the persistent storage agent, in order to perform object-level loads and/or stores. Do
   * not call this function from a test; use getTestInstance() instead.
   */
  public static PersistentStorageAgent getInstance() {
    if (instance == null) {
      instance = new PersistentStorageAgent(new PersistentDataStore());
    }
    return instance;
  }

  /**
   * Instance getter function used for testing. Supply a mock for PersistentDataStore.
   *
   * @param mockPersistentDataStore a mock used for testing
   */
  static PersistentStorageAgent getTestInstance(PersistentDataStore mockPersistentDataStore) {
    return new PersistentStorageAgent(mockPersistentDataStore);
  }

  // Private constructor, accessible only through singleton interface
  private PersistentStorageAgent(PersistentDataStore persistentDataStore) {
    this.persistentDataStore = persistentDataStore;
  }

  /**
   * Retrieve all User objects from the Datastore service. The returned list may be empty.
   *
   * @throws PersistentDataStoreException if an error was detected during the load from the
   *     Datastore service
   */
  public List<User> loadUsers() throws PersistentDataStoreException {
    return persistentDataStore.loadUsers();
  }

  
  /** Write a User object to the Datastore service. */
  public void writeThrough(User user) {
    persistentDataStore.writeThrough(user);
  }

}
