Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11943C369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M69//rVJCJEotb2r3fB/lWzv3UcHCc5pQL25VvW5N4=; b=p9UAjXYcit8loxlgFyNukLwWyp
	iZo6I6X5+0RFL/lae2Amy2GJl4lelyJnaY2nieGOr6dk+9IOOq6k1M2W0rmg6xv2PUZpKFYophHxX
	WQoYiNPcTMANBShRYMHKz4N31Et2QQmBGk5KVgSrgJsXr4usoxGKT/JQIS2LUvClAh9+mvMd9V5vn
	/UvPC2QGbCPXSLwMMRaWHru1aUp4u8kDCIa2MraxgfeAfKIPlS8sHOZWdvzkGKK+HaXY6cQYSt6NW
	FMeiGIazbwMrkxm8Mq2Z/0Uk0m169uMBkW1oRSv5eYQ6m8heLzy6lnYEJFeUCyej6KwevKsAeUzkF
	aLP8Si1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dlH-00000005NEO-3JHH;
	Tue, 15 Apr 2025 10:43:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dc9-00000005Lfv-2IrQ
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 10:34:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tM6x002421;
	Tue, 15 Apr 2025 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+M69//rVJCJEotb2r3fB/lWzv3UcHCc5pQL25VvW5N4=; b=jP6uLHVjzVcGdnOz
	Qp2qe3JnzV/GN3d7ZdKglQM65eRetw3fIwI02llN7X8v9YzlOSQ3RuZoI0YREBfa
	lBTqI/+kDO4t2iB+7gcvWkkKWAZoHVkHECEclERFW2be/mQfcNt+VqsodURriTk3
	OEgWzd63VA87td4n9DIX6778WtmOC0F/DsgxjR5Cu5GdoLu3OGWc7ctQAM63KlsG
	ohcxh5bBKw/tleWA5dywMnyt0KaxcIBMmRQfCrlH6/N8QyTRLdkJZWN+Wh6mIeu0
	oCwhojnX9hVLGhevc+pmZkpzHWjic2HNuJx3t4AU7/BOBDeLZoKbkak58P2Se832
	wAPYyA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjyhqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 10:33:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FAXwgQ011621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 10:33:58 GMT
Received: from [10.133.33.156] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 03:33:57 -0700
Message-ID: <283c0cb1-ddce-46a3-afd0-eb50728d2967@quicinc.com>
Date: Tue, 15 Apr 2025 18:33:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] wifi: ath12k: monitor mode cleanup and state
 handling
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250107025621.1907-1-quic_kangyang@quicinc.com>
 <702c843b-8462-4594-91d0-75721ba5dc48@oss.qualcomm.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <702c843b-8462-4594-91d0-75721ba5dc48@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe3617 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=T5McmiZYbs39c0-wqtQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: O-Gr9geDNbI4WqWMdVPUDEPAAul_szwA
X-Proofpoint-ORIG-GUID: O-Gr9geDNbI4WqWMdVPUDEPAAul_szwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=966 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_033401_606897_EA5317EA 
X-CRM114-Status: GOOD (  12.81  )
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



On 4/15/2025 7:13 AM, Jeff Johnson wrote:
> On 1/6/2025 6:56 PM, Kang Yang wrote:
>> This patch-set do some cleanup and handle state variables correctly for
>> monitor mode.
>>
>> Note: The quantity of this patch set was 11 in the previous version. 8
>> of them were merged:
>> https://patchwork.kernel.org/project/linux-wireless/cover/20241022110831.974-1-quic_kangyang@quicinc.com/
>>
>> v6: update copyright for each patch.
>> v5: rebase on tag: ath/main(ath-202412191756).
>> v4: rebase on tag: ath/main(ath-202410161539).
>> v3: rebase on tag: ath/main(ath-202410111606).
>> v2: rebase on tag: ath-202410072115.
>>
>> Kang Yang (3):
>>    wifi: ath12k: optimize storage size for struct ath12k
>>    wifi: ath12k: properly handling the state variables of monitor mode
>>    wifi: ath12k: delete mon reap timer
>>
>>   drivers/net/wireless/ath/ath12k/core.c |  7 +++++-
>>   drivers/net/wireless/ath/ath12k/core.h | 27 +++++++++++------------
>>   drivers/net/wireless/ath/ath12k/dp.c   | 30 +-------------------------
>>   drivers/net/wireless/ath/ath12k/mac.c  | 13 ++++++++++-
>>   4 files changed, 32 insertions(+), 45 deletions(-)
>>
>>
>> base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
> 
> If these changes are still applicable, can you please rebase?
> 
> Applying: wifi: ath12k: optimize storage size for struct ath12k
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/core.h
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/core.h
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/core.h
> Recorded preimage for 'drivers/net/wireless/ath/ath12k/core.h'
> error: Failed to merge in the changes.
> Patch failed at 0001 wifi: ath12k: optimize storage size for struct ath12k

Patch 1 just optimize storage size for struct ath12k. Seems not 
necessary, will drop.
Patch 2 already done by Karthikeyan Periyasamy, will drop.

Will send patch 3 on latest tag.


> 


