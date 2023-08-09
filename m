Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65908C001E0
	for <ath12k@archiver.kernel.org>; Wed,  9 Aug 2023 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWhQSZa2HfRR0l1O5SR8uHrkKzWbUfGe1JZn8YS2KM8=; b=hMqqECxxfLOV3X
	XmFDKSykzae1e554TiF3Dq4p+sSr/dpJRgkUdRBTu7ZFRh4Ma3xFlDRbfkCt2HAts75BwFTwQZgvK
	0NrBmIjQ8tdvPNnRVS1uspqoyT4p2EfQ50c7TGuXtZSyqWfuNczkHXeCpP/rr3yAJ4IXqez6LlYfi
	TBWmB0bd4T7g5X/c2qY/dUoNdIQvHBsbDPHIFt31g8hYV9jlCeqzEl+zyeFDi5Htu1f+QPzsyJ/o0
	nO9IyYFBqxM8u16ndi9df3eplq38IIKCZdha6ZBj7BToyHKGOskQFwRFqYj0H8bndzy6aV/imW6wd
	GtVnh44ne3YCgp8qf0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnjH-005bRC-0V
	for ath12k@archiver.kernel.org;
	Wed, 09 Aug 2023 18:16:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTnjE-005bPJ-2A
	for ath12k@lists.infradead.org;
	Wed, 09 Aug 2023 18:16:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379F7YgO027866;
	Wed, 9 Aug 2023 18:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VhuCsA9LB+H+wDhsrYRHsMw1UdW8ekrXuowjSWfJlqY=;
 b=ZiPuKpX5I0QBwGl+ns57jqRf1+q555WTuqu+oFjbHc6w9KNyySHwbN79s1yDCrD0UcGb
 k22yanIE253QsWUsYHyoox9qz0xQ14w6TfGXEW2qSVR3/WO2zUq9V5EVrkzPFRzRLF9X
 7KuvswGtkvy6/JckRPYbKCACR4pl7G5HDVqeo+5SrtbeoUtwDw8GuBO08i2YpVHQti0p
 93NKPk2aKRdDS2F+lgPQz2MXxnNY+zaPqaAMcRHnWt6pTad50ZHOOCZH9jaVWaDUEwEc
 eJ5TwI2rj9O3ZXzkZdfvde6H9Eo645qKgGz5OnH935CIL1wzuhSrT2Smkx3rRZMck+zK ow== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sbpqs3b36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 18:16:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 379IGFNq013537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Aug 2023 18:16:15 GMT
Received: from [10.111.180.219] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 11:16:14 -0700
Message-ID: <3206e181-f770-c599-87e1-364114b9746a@quicinc.com>
Date: Wed, 9 Aug 2023 11:16:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with
 extraie
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
 <4e63a318-2aa0-2993-ae03-5544c6e41390@quicinc.com>
In-Reply-To: <4e63a318-2aa0-2993-ae03-5544c6e41390@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WkHK5tlI47vBkbRddeUTOPJ1SUi84lAx
X-Proofpoint-ORIG-GUID: WkHK5tlI47vBkbRddeUTOPJ1SUi84lAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_14,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_111616_718475_4741BFDD 
X-CRM114-Status: GOOD (  18.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/9/2023 10:31 AM, Jeff Johnson wrote:
> On 8/9/2023 1:12 AM, Wen Gong wrote:
>> If cfg80211 is providing extraie's for a scanning process then ath12k 
>> will
>> copy that over to the firmware. The extraie.len is a 32 bit value in 
>> struct
>> element_info and describes the amount of bytes for the vendor information
>> elements.
>>
>> The problem is the allocation of the buffer. It has to align the TLV
>> sections by 4 bytes. But the code was using an u8 to store the newly
>> calculated length of this section (with alignment). And the new
>> calculated length was then used to allocate the skbuff. But the actual
>> code to copy in the data is using the extraie.len and not the calculated
>> "aligned" length.
>>
>> The length of extraie with IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS enabled
>> was 264 bytes during tests with a wifi card. But it only allocated 8
>> bytes (264 bytes % 256) for it. As consequence, the code to memcpy the
>> extraie into the skb was then just overwriting data after skb->end. 
>> Things
>> like shinfo were therefore corrupted. This could usually be seen by a 
>> crash
>> in skb_zcopy_clear which tried to call a ubuf_info callback (using a 
>> bogus
>> address).
>>
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> 
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Wen, can you please add a Fixes: tag since based upon the discussion you 
actually observed a crash


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
