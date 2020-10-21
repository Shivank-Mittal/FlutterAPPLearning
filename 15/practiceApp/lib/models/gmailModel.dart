class Gmail {
  int _id;
  String _message;
  String _senderEmailID;

  Gmail(this._id, this._message, this._senderEmailID);
  set id(int id) {
    this._id = id;
  }

  set message(String message) {
    this._message = message;
  }

  set senderEmailID(String senderEmailId) {
    this._senderEmailID = senderEmailId;
  }

  get id => this._id;
  get message => this._message;
  get senderEmailId => this._senderEmailID;
}
