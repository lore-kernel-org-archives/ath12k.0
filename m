Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A929DF327A5
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 05:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2MujxfBQqzgiiXQDSt6oAK7PDUCOtwHcqJ4Zb7jY+Q=; b=l8tKUY5hQIr8YswT+fjY8+JEFy
	ieuP3Mn1bb9/j/BNBhECT/kRWDWvmxdkjMozsS/eDOuHpTBjxnU7A0KDndmJ9+3LCKzuowcVX/ONn
	4uDD+Ex4XSDPjRW3O6YjznunN+AZFZLUT+3ZfDA9wLQtOFSPG7biTlzR1rNQrIZoO50KYOqde9GkC
	pqK+W2FXbFGj726MHNnDHMUBkQWOajO8Os6mRS/SdD5j2Ut8YVf90BAOevV4k4R17pMy48UcE/QNv
	88nbh2WI7T/YbDiIKt8BS8q6+HsNT6FukeQOLACR6hTc7jw9f/AIXw8Xfg5pG1HjySE11FepCDVy3
	ims0oFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF3w5-000000083YS-0KEo;
	Tue, 21 Apr 2026 05:46:13 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF3w1-000000083Xi-3jHV
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 05:46:11 +0000
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id F2HMwHNNR4RkpF3vnwGE87; Tue, 21 Apr 2026 05:45:55 +0000
Received: from gator4166.hostgator.com ([108.167.190.91])
	by cmsmtp with ESMTPS
	id F3vmwp0qlQLXzF3vmwfJw6; Tue, 21 Apr 2026 05:45:54 +0000
X-Authority-Analysis: v=2.4 cv=DodW+H/+ c=1 sm=1 tr=0 ts=69e70f12
 a=vY9Mjuda9oMEc2E4Cx1x2A==:117 a=vY9Mjuda9oMEc2E4Cx1x2A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=_Wotqz80AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BW2cartU-NgVh40cIl0A:9
 a=QEXdDO2ut3YA:10 a=buJP51TR1BpY-zbLSsyS:22 a=2aFnImwKRvkU0tJ3nQRT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k2MujxfBQqzgiiXQDSt6oAK7PDUCOtwHcqJ4Zb7jY+Q=; b=lNx6Fzxa2OtxX8oxQ8tkG0Jm6I
	BDArh2UzLFuoRAH0cFfrRqN61RBcnXDH/4cBIziLdh7CHgDgqnTUB8QRmdX42kEGovwUMoWv1W3eM
	NraZM1HrIbBJ05Avu/DGymTgIHKu4FxW5nmgrthwdrFwqgLE6zcvtajuyBtjs9FSq1aUpc0CvRY3i
	Zxg1e8tmTlwL8uS02gvSNre/rpXy/3+VMvLZW4kwnT480tc1R+S371sXfVRAoI64+NSG9lvB6KHtV
	J06RT/9IlW9N/V5rE3DIITJfm4Jd7nus/2BCyEL450r7k8stqQQSupbzaOZBs/dK5PJVRYp2cXpxa
	o5XkBoJA==;
Received: from [177.238.16.218] (port=36590 helo=[192.168.0.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.99.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1wF3vl-00000003Qw0-0Sff;
	Tue, 21 Apr 2026 00:45:53 -0500
Message-ID: <2650bb0e-804d-4858-a07f-c4190fb41038@embeddedor.com>
Date: Mon, 20 Apr 2026 23:44:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use kzalloc_flex
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:QUALCOMM ATH12K WIRELESS DRIVER" <ath12k@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260313001434.118010-1-rosenp@gmail.com>
 <a92cb332-b525-47f4-a529-a59080cb33dd@oss.qualcomm.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <a92cb332-b525-47f4-a529-a59080cb33dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 177.238.16.218
X-Source-L: No
X-Exim-ID: 1wF3vl-00000003Qw0-0Sff
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.104]) [177.238.16.218]:36590
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDMqYwOXKavKOpPLR2jIcyAVgrfw3h8D/22GT0qcKSve+h1bZHmVRnPnjnTF0zAKGm52PborJ5fr3r9C7nupunFWSqRGabeEyeeHsW6XJlDnmOr/JaM4
 HhdehZuo6MkN6iRZb9pjxkZkJymTpDAPhUciwhAjgrjCogccaVvKWC5AOEJd5n0Q0VxNUzZSLd9tlBQfuuHhgZJgsh1fq3JCpHX8SKWJr6IPLRuzWbC4qZHx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_224610_066175_A63BAEDC 
X-CRM114-Status: GOOD (  10.00  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 4/20/26 20:53, Baochen Qiang wrote:
> 
> 
> On 3/13/2026 8:14 AM, Rosen Penev wrote:
>> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
>>
>> Add __counted_by to get extra runtime analysis. 

>> Move counting variable
>> assignment immediately after allocation as required by __counted_by.

Not true. This should be phrased differently[1]

-Gustavo

[1] https://lore.kernel.org/linux-hardening/37378f49-437f-438b-ad6c-d60480feb306@embeddedor.com/

>>
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 29 +++++++--------------------
>>   drivers/net/wireless/ath/ath12k/wmi.h |  2 +-
>>   2 files changed, 8 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 553ec28b6aaa..b7c43a64e37b 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -5611,12 +5611,14 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>>   	if (ret)
>>   		goto exit;
>>
>> -	arg = kzalloc_obj(*arg);
>> +	arg = kzalloc_flex(*arg, chan_list, n_channels);
>>   	if (!arg) {
>>   		ret = -ENOMEM;
>>   		goto exit;
>>   	}
>>
>> +	arg->num_chan = n_channels;
>> +
>>   	ath12k_wmi_start_scan_init(ar, arg);
>>   	arg->vdev_id = arvif->vdev_id;
>>   	arg->scan_id = ATH12K_SCAN_ID;
>> @@ -5638,18 +5640,8 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>>   		arg->scan_f_passive = 1;
>>   	}
>>
>> -	if (n_channels) {
>> -		arg->num_chan = n_channels;
>> -		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
>> -					 GFP_KERNEL);
>> -		if (!arg->chan_list) {
>> -			ret = -ENOMEM;
>> -			goto exit;
>> -		}
>> -
>> -		for (i = 0; i < arg->num_chan; i++)
>> -			arg->chan_list[i] = chan_list[i]->center_freq;
>> -	}
>> +	for (i = 0; i < arg->num_chan; i++)
>> +		arg->chan_list[i] = chan_list[i]->center_freq;
>>
>>   	ret = ath12k_start_scan(ar, arg);
>>   	if (ret) {
>> @@ -5674,7 +5666,6 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
>>
>>   exit:
>>   	if (arg) {
>> -		kfree(arg->chan_list);
>>   		kfree(arg->extraie.ptr);
>>   		kfree(arg);
>>   	}
>> @@ -13735,19 +13726,13 @@ int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>>   	scan_time_msec = hw->wiphy->max_remain_on_channel_duration * 2;
>>
>>   	struct ath12k_wmi_scan_req_arg *arg __free(kfree) =
>> -					kzalloc_obj(*arg);
>> +					kzalloc_flex(*arg, chan_list, 1);
>>   	if (!arg)
>>   		return -ENOMEM;
>>
>> -	ath12k_wmi_start_scan_init(ar, arg);
>>   	arg->num_chan = 1;
>> +	ath12k_wmi_start_scan_init(ar, arg);
>>
>> -	u32 *chan_list __free(kfree) = kcalloc(arg->num_chan, sizeof(*chan_list),
>> -					       GFP_KERNEL);
>> -	if (!chan_list)
>> -		return -ENOMEM;
>> -
>> -	arg->chan_list = chan_list;
>>   	arg->vdev_id = arvif->vdev_id;
>>   	arg->scan_id = ATH12K_SCAN_ID;
>>   	arg->chan_list[0] = chan->center_freq;
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
>> index 0bf0a7941cd3..190e7a4a92d0 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
>> @@ -3586,7 +3586,6 @@ struct ath12k_wmi_scan_req_arg {
>>   	u32 num_bssid;
>>   	u32 num_ssids;
>>   	u32 n_probes;
>> -	u32 *chan_list;
>>   	u32 notify_scan_events;
>>   	struct cfg80211_ssid ssid[WLAN_SCAN_MAX_NUM_SSID];
>>   	struct ath12k_wmi_mac_addr_params bssid_list[WLAN_SCAN_MAX_NUM_BSSID];
>> @@ -3595,6 +3594,7 @@ struct ath12k_wmi_scan_req_arg {
>>   	u32 num_hint_bssid;
>>   	struct ath12k_wmi_hint_short_ssid_arg hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
>>   	struct ath12k_wmi_hint_bssid_arg hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
>> +	u32 chan_list[] __counted_by(num_chan);
>>   };
>>
>>   struct wmi_ssid_arg {
>> --
>> 2.53.0
>>
>>
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> 
> 


