control 'FS_check' do
    title 'ファイルシステムに関するテスト' 
  describe filesystem('/') do
    its('percent_free') { should be >= 20 } #ディスク全体の使用率が80%以上でNG
  end
end

control 'PS_check' do
  describe processes('sshd') do #sshdのプロセスをチェック
    its('entries.length') { should eq 1 } 
  end
end

control 'service' do
  title 'サービスに関するテスト'

  describe systemd_service('docker.service') do
    it { should be_running }
  end
end

  describe systemd_service('sshd.service') do
    it { should be_running }
  end
end

control 'http' do
  title 'http接続に関するテスト'

  describe http('https://www.google.com') do
    its('status') { should cmp 200 }
  end
end

#db接続確認のリファレンス
#https://docs.chef.io/inspec/resources/mysql_session/

#マウント確認のリファレンス
#https://docs.chef.io/inspec/resources/mount/

#NTP同期確認のリファレンス
#https://docs.chef.io/inspec/resources/ntp_conf/

#CPU,MEM,PING疎通あたりも確認したい
