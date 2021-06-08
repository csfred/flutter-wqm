class Device {
  /// 设备列表内容
  List<DeviceInfo> deviceInfo = [];
  /// 后端json中的key值
  List<String> keyList=[];
  /// 后端json内容
  List contextList=[];		
  /// 后端数据中的标题信息
  List titleList=['站点编号','设备名称','设备类型','设备控制信息','时间点','相同信息次数','开始时间','结束时间'];
  /// 统计有几行数据
  List contextNum=[];

  void initData(String requestDataJson) {
    
    for (int i = 0; i < size; i++) {
      deviceInfo.add(DeviceInfo(
          "User_$i", i % 3 == 0, '+001 9999 9999', '2019-01-01', 'N/A'));
    }
  }

  getTableInfo() async{
    await request('getCommodity').then((val){
      contextList=val;
      keyList=['number','price'];
      titleList=['操作','数量','价格'];
      count=contextList.length;     
      for(int i=0;i<count;i++){
        contextNum.add(i);
        openState.add({'symbol':'+'});
      }
    });
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    deviceInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
      int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    deviceInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('User_', '')) ?? 0;
        int bId = int.tryParse(b.name.replaceFirst('User_', '')) ?? 0;
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class DeviceInfo {
  //网关编号（站点编号）
  late String stationNo;
  //设备名称
  late String deviceName;
  //设备类型
  late String devType;
  //设备控制信息
  late String deviceVarList;
  //时间点
  late String timePoint;
  //相同信息次数
  late int receiveCount;
  //开始时间
  late String startTime;
  //结束时间
  late String endTime;

  DeviceInfo(this.stationNo, this.deviceName, this.devType, this.deviceVarList, this.timePoint,
      this.receiveCount, this.startTime, this.endTime);
}