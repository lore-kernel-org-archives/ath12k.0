Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7346C3601E
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ONQCFMae/pApUf3GZW+r3qJt0YKMEaQZxHza69xaxQ=; b=RhT4ahChfDuKD1AXvGvUSdkZHq
	Ypg6G3nNlWZXlTUyKcG+8XcZkfE3ETrGe/EHFH/zVYcGCBkH7D4YyyG35rcGZA7ADJQN8XGIOVeCD
	5LGiUFZDDwCKNq5CBQRXyDIVISW+GPxjy40Tvptk5CyYSPgTIU1xm0hHLjjpe0PQ3FGRqMf4pDiT6
	2mhfUgKzjdMxSpwTBp9zQA0Sa13JQsnUj+JIBd6uvaTypJ31/ZU2NWGVjTHVPESAlZ0raDiGuWRGC
	1+3/qNurxyGLLIrkLYKBZzEnpT6Yg+qhLWeithQtNRaJqjQd1hxhzW8M9vGd1RAmu/uY3JmGyOXc6
	/3UHTHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4AUJ-00000000Y9M-2oiw
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 03:27:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4AUG-00000000Y8s-0baL
	for ath12k@lists.infradead.org;
	Mon, 14 Apr 2025 03:27:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DMj1ti001012;
	Mon, 14 Apr 2025 03:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ONQCFMae/pApUf3GZW+r3qJt0YKMEaQZxHza69xaxQ=; b=lt+hCrCatHJdl/Sf
	tepCpkQwKAUnU0agjvnpk874Blng57dCidpEunsqLE+2u+Y/Y7fz+vt5a/GoYkT+
	Ec7rPtngGCRVfgpyluU6OE8cQg24p+gI8Us10hqXwgrSvPpcSh8FKuo3UwtULKe1
	PuQj3Q0yxQOooU6UsNH6H+ufem0zpiiylNx8h3ULkpO4pa2CcYPpM6yV1TD9E3ER
	zkpf5g1gUVLi9XA+oQLLlFzgcAbbxeI23l6v1VU+AQO4vx7drnwjMSvyqTZuI/Rc
	LDTN+BA+dHFzJx2NSP5F2PiWlokpxZKLGIew001ThcHHmXpxWbqSXiGv8cRoCsgF
	1h6gQQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjb6m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 03:27:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E3RqsT009181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 03:27:52 GMT
Received: from [10.253.34.219] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Apr
 2025 20:27:50 -0700
Message-ID: <21ef1321-b079-4749-a675-dcc814f9373d@quicinc.com>
Date: Mon, 14 Apr 2025 11:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Abort scan before removing link
 interface to prevent duplicate deletion
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Oleksandr
 Natalenko" <oleksandr@natalenko.name>,
        Lingbo Kong <quic_lingbok@quicinc.com>
References: <20250226113118.7626-1-quic_lingbok@quicinc.com>
 <46030c46-a2ca-4d02-ab51-3581f7f3ddfe@lucifer.local>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <46030c46-a2ca-4d02-ab51-3581f7f3ddfe@lucifer.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X1WARF3bSuo10ZZRdNX6240nqpyDpOmd
X-Proofpoint-ORIG-GUID: X1WARF3bSuo10ZZRdNX6240nqpyDpOmd
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fc80b9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qYKNfHejAAAA:8
 a=4WRb8wXiXRrubVGSIagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=xXeQd-R7dKE4HXh-qqqZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_202756_328768_3D750306 
X-CRM114-Status: GOOD (  36.94  )
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



On 2025/4/11 18:05, Lorenzo Stoakes wrote:
> +cc Oleskandr who kindly pointed me at the v1 of this patch (see [0]).
> 
> [0]:https://lore.kernel.org/all/20250124093352.481-1-quic_lingbok@quicinc.com/
> 
> On Wed, Feb 26, 2025 at 07:31:18PM +0800, Lingbo Kong wrote:
>> Currently, when ath12k performs the remove link interface operation, if
>> there is an ongoing scan operation on the arvif, ath12k may execute the
>> remove link interface operation multiple times on the same arvif. This
>> occurs because, during the remove link operation, if a scan operation is
>> present on the arvif, ath12k may receive a WMI_SCAN_EVENT_COMPLETED event
>> from the firmware. Upon receiving this event, ath12k will continue to
>> execute the ath12k_scan_vdev_clean_work() function, performing the remove
>> link interface operation on the same arvif again.
>>
>> To address this issue, before executing the remove link interface
>> operation, ath12k needs to check if there is an ongoing scan operation on
>> the current arvif. If such an operation exists, it should be aborted.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> 
> Hey, thanks for this!
> 
> Not sure on status of this, has the patch been taken for 6.15? As I don't
> see it in Linus's tree (not looking _that_ hard though). I don't think it's
> even in -next?
> 
> I keep hitting issues with my X870E CARBON wifi onboard motherboard wifi -
> most recently I saw a null pointer deref in ath12k_mac_remove_link_interface().
> 
> This occurred when I tried changing the network interface, in fact I had
> first clicked on 'available networks' in network manager so quite likely a
> concurrent scan.
> 
> I rather stupidly didn't copy/paste the text of it, but you can see the
> report in screenshot form at [1]. Apologies for shade being case on ath12k
> driver but you know, frustrations :))
> 
> It's difficult for me to test your patch as I am having pretty awful
> firmware issue with this motherboard - if I powercycle in any way that gets
> interrupted, or especially if a kernel issue arises, then the ath12k module
> will not load on next boot, or at all going forward.
> 
> Updating the kernel to, I think, a recent 6.13 (and now 6.14-1 where I
> observed this issue), got the wifi working again, seemingly randomly.
> 
> Usually I have to try to reset the CMOS state, but doing so causes other
> issues so I generally try to avoid (I have a network workaround involving
> an ethernet wifi adapater, it's pretty... yeah).
> 
> So I assume some non-volatile state gets corrupted somehow, I'm not sure if
> you had any insights into how I might more sanely reset that?
> 
> Anyway regardless thanks for your efforts, if the wifi adapter appears
> again then I will test this and can give T-b tags if so.
> 
> Cheers, Lorenzo
> 
> [1]:https://fosstodon.org/@ljs/114318530969496869
> 

hi, lorenzo,
sry for delay response.😊
as for as i know, this patch hasn't been accepted so far.
for your description, you find the ath12k_mac_remove_link_interface() 
have a null pointer deref, i think maybe there is a concurrent scan 
operation.

i have a suggestion, you can apply this patch and observe if there is 
still a crash.

can you offer a detailed crash dump?

/lingbo


>> ---
>> 1.rebase to ath-next
>>
>>   drivers/net/wireless/ath/ath12k/mac.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 3e3afdc56fc9..551133483f44 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -9578,6 +9578,11 @@ ath12k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
>>   	if (ahvif->vdev_type != WMI_VDEV_TYPE_MONITOR &&
>>   	    ar->num_started_vdevs == 1 && ar->monitor_vdev_created)
>>   		ath12k_mac_monitor_stop(ar);
>> +
>> +	if (ar->scan.arvif == arvif && ar->scan.state == ATH12K_SCAN_RUNNING) {
>> +		ath12k_scan_abort(ar);
>> +		ar->scan.arvif = NULL;
>> +	}
>>   }
>>
>>   static int
>>
>> base-commit: e180a01bf2c4a67db13d70d2d91410a8c6f74be3
>> --
>> 2.34.1
>>
>>

