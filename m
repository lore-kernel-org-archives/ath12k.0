Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CE7C27C53
	for <ath12k@archiver.kernel.org>; Fri,  7 Jun 2024 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5XalddjrkCdOA6ZA7wNhgNMW0SftDt6t/mwb1hvlDQ=; b=SlGHdcO/PMKFexrNRUFQU04PoC
	UfK/VR6FHaYwj3MJTUIH+ZXSywBjxdYEUK6RvTMVd+3gMDs9UhKeRgweuZoKNgzG4sk8HffLrgcNw
	hD51vJ6pyh4fhY8TRhhsePLPQwRUxRnYQ9/mfmu0HdS8V1XAygB4Wc4X3dIVClkcfbuSKSb/rnQUx
	R5Q5VaXJiCWPFMumwzENgDf80cEGqK8La4yTdmgINwFfQbsBZ1jWyKSkVmkWQZhhjObpeGUsIai4H
	tiZxqxmm2btBlIqo4f3sBoXaC4ElXPn/RoftGjeIr2611TUc+7AEWa8OO1SqRmm68qHXyPR67bE3G
	Zp19Ms5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFZen-0000000E9NU-10N5
	for ath12k@archiver.kernel.org;
	Fri, 07 Jun 2024 13:29:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFZej-0000000E9MB-2Dv1
	for ath12k@lists.infradead.org;
	Fri, 07 Jun 2024 13:29:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457D9ZJt028942;
	Fri, 7 Jun 2024 13:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5XalddjrkCdOA6ZA7wNhgNMW0SftDt6t/mwb1hvlDQ=; b=CXV9/qngTtdiF987
	lsixLmWiBeTYiqYkpYGNUdd0D1wj/e3HtmoTUjCCCUSRMc57h1UGR8dtg6BLndZy
	1NBkUtkk0Zw4wMcc8cGDwyQhwMoaI1uOFwNrtHn+JCVFyXX7fUG+jgXcONDLw/97
	XTx5Xu2wNoFc9MWOh7r8poOvJH83IC+7k9gD9ezVxO5l7gIuiGm9bkqoebIx7OYe
	90p94ZWyC4Ob34UNtUaTQyhBDeiMOYaIYm/ejRbpF9T/ZbbNd8/f5cdoSdYDT/Ej
	eDFJV6QHQ4RfGMVfJQ8KA5V/IX4DTDI1HbeRAxaThsNNflqCsTlz1Wmbp4aUtBWH
	AN9k/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ykg2qjhnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 13:29:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457DTFoM030520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 13:29:15 GMT
Received: from [10.216.36.52] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 06:29:13 -0700
Message-ID: <e0ed9e43-a795-3e47-dcd1-15b43fa96ef0@quicinc.com>
Date: Fri, 7 Jun 2024 18:59:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v8 6/8] wifi: ath12k: Introduce device group abstraction
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
 <20240531180411.1149605-7-quic_hprem@quicinc.com> <87le3iqkbe.fsf@kernel.org>
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <87le3iqkbe.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aE5ulFkOaesmBjG99mPVqG5LpknUsMlg
X-Proofpoint-ORIG-GUID: aE5ulFkOaesmBjG99mPVqG5LpknUsMlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_07,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_062921_648228_0A3C6F32 
X-CRM114-Status: GOOD (  31.66  )
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



On 6/6/2024 6:50 PM, Kalle Valo wrote:
> Harshitha Prem <quic_hprem@quicinc.com> writes:
> 
>> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>
>> Currently, single device is probed and once firmware is ready, the device
>> is registered to mac80211. For multi-link operation, different bands of
>> different devices or same device would be part of a single wiphy and for
>> this, hardware device group abstraction would be helpful.
>>
>> Hardware device group abstraction - when there are multiple devices (with
>> single radio or dual radio) that are connected by any means of interface
>> for communicating between them, then these devices can be combined
>> together as a single group using a group id to form a group abstraction
>> and register to mac80211.
>>
>> The grouping information of multiple devices would be based on device tree
>> during device probe. If no such information is available then a single
>> device will be part of group abstraction and registered to mac80211 else
>> multiple devices advertised in device tree are combined and then registered
>> to mac80211.
>>
>> For device group abstraction, a base structure named ath12k_hw_group (ag)
>> and the following helpers are introduced:
>>          ath12k_core_hw_group_alloc()    : allocate ath12k_hw_group (ag)
>>                                            based on group id and number
>>                                            of devices that are going to
>>                                            be part of this group.
>>          ath12k_core_hw_group_free()     : free ag during deinit.
>>          ath12k_core_assign_hw_group()   : assign/map the details of group
>>                                            to ath12k_base (ab).
>>          ath12k_core_unassign_hw_group() : unassign/unmap the details of ag
>>                                            in ath12k_base (ab).
>>          ath12k_core_hw_group_create()   : create the devices which are part
>>                                            of group (ag).
>>          ath12k_core_hw_group_destroy()  : cleanup the devices in ag
>>
>> These helpers are used during device probe and mapping the group to the
>> devices involved.
>>
>> Please find the illustration of how multiple devices might be combined
>> together in future based on group id.
>>
>>                  Grouping of multiple devices (in future)
>>
>> +------------------------------------------------------------------------+
>> |  +-------------------------------------+       +-------------------+   |
>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
>> |  |         (Dual band device)          |       |                   |   |
>> |  +-------------------------------------+       +-------------------+   |
>> |                 ath12k_hw_group (ag) based on group id                 |
>> +------------------------------------------------------------------------+
> 
> This is a good diagram, thanks for that. But how does struct ath12k_hw
> fit into the diagram?
> 
Currently with this base device group series, ath12k_hw sits above 
ath12k_base.

Please find the representation below:

+-----------------------------------------------+
|  +-------------------+  +-------------------+ |
|  |   +---------+     |  |   +---------+     | |
|  |   |         |     |  |   |         |     | |
|  |   | mac80211|     |  |   | mac80211|     | |
|  |   | hw->priv|     |  |   | hw->priv|     | |
|  |   |         |     |  |   |         |     | |
|  |   +---------+     |  |   +---------+     | |
|  |   +---------+     |  |   +---------+     | |
|  |   |         |     |  |   |         |     | |
|  |   |ath12k_hw|     |  |   |ath12k_hw|     | |
|  |   |   (ah)  |     |  |   |   (ah)  |     | |
|  |   |         |     |  |   |         |     | |
|  |   +---------+     |  |   +---------+     | |
|  |        ^          |  |        ^          | |
|  | +------|--------+ |  | +------|--------+ | |
|  | |      |        | |  | |      |        | | |
|  | | +----------+  | |  | | +----------+  | | |
|  | | |    ar    |  | |  | | |    ar    |  | | |
|  | | |   5 GHz  |  | |  | | |   6 GHz  |  | | |
|  | | |          |  | |  | | |          |  | | |
|  | | +----------+  | |  | | +----------+  | | |
|  | |  ath12k_base  | |  | |  ath12k_base  | | |
|  | |       (ab)    | |  | |       (ab)    | | |
|  | +---------------+ |  | +---------------+ | |
|  |   ath12k_hw_group |  |  ath12k_hw_group  | |
|  +-------------------+  +-------------------+ |
+-----------------------------------------------+

As multiple device grouping is not yet brought in with this patch, this 
is how it might look like.


>> In the above representation, two devices are combined into single group
>> based on group id.
>>
>> Add base code changes where single device would be part of a group with an
>> invalid group id forming an group abstraction. Multi device grouping will
>> be introduced in future.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Co-developed-by: Harshitha Prem <quic_hprem@quicinc.com>
>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> Like I have said before, for adding any new locks there needs to be a
> proper analysis for the locking and good justifications why new locks
> are needed. I don't see any of that above.
>
Sure, Kalle. Will add the details for new locks. As grouping has to be 
done in synchronous manner lock was introduced.

> BTW I will from now on require proper analysis also for additions to
> enum ath12k_dev_flags.
Sure, Will update the details.

There are few racy conditions with mutiple device grouping which needed 
these flags.
One such instance is, if a reboot is triggered between core_init and 
core_start, some of the devices in ath12k_hw_group would have already 
started and completed till FW ready but some would not even reached QMI 
firmware ready event. But, during reboot as part of pci shutdown group 
clean up would try to do core stop for all devices in group. This will 
lead to crashes as for some devices core start is yet to do but we tried 
to invoked core stop.

> 
>> --- a/drivers/net/wireless/ath/ath12k/core.c
>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>> @@ -21,6 +21,9 @@ unsigned int ath12k_debug_mask;
>>   module_param_named(debug_mask, ath12k_debug_mask, uint, 0644);
>>   MODULE_PARM_DESC(debug_mask, "Debugging mask");
>>   
>> +static DEFINE_MUTEX(ath12k_hw_lock);
>> +static struct list_head ath12k_hw_groups = LIST_HEAD_INIT(ath12k_hw_groups);
> 
> I can somehow understand/guess why this mutex is needed (even though
> there's no documentation) but the naming is not really clear as we
> already have struct ath12k_hw::hw_mutex.
> 
This lock is for device group list handling. Will modify the name 
accordingly and update the documentation. Thanks.

>> +/* Holds info on the group of devices that are registered as a single wiphy */
>> +struct ath12k_hw_group {
>> +	struct list_head list;
>> +	u8 id;
>> +	u8 num_devices;
>> +	u8 num_probed;
>> +	struct ath12k_base *ab[ATH12K_MAX_SOCS];
>> +	/* To synchronize group create, assign, start, stop */
>> +	struct mutex mutex_lock;
>> +};
> 
> But why we really need this mutex? And does it really justify the extra
> complexity it creates?
>
This lock is necessary because for some QMI handling and WMI MLO 
handling should happen only after all the devices in group are probed 
and devices are started. In those WMI & QMI MLO handshake, it requires 
the partner details.
QMI firmware ready can come from any device in a group and may not be 
synchronous but the group has to be registered only after all the 
devices have received QMI firmware ready. Similarly, core stop, firmware 
recovery scenarios. To handle this the ag lock is needed. Will update 
the details.


Thanks,
Harshitha




