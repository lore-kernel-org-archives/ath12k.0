Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4391D0E6D5
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mk+SxayGyeYDS5Wl2XojgirHH/IjbtuVxMSJDdqxZiU=; b=zliRxru8Wzgkujsi1E5OOiApIK
	BMX/Yu2qB1Wd90ikNL1ZoJkT20m/nLlmk88Uwf1OCfTLBzQUX/4UzTQ5PosQ9Vvh3J5IcoLVJTEBY
	BQwsEWA8e3oOHmXpMgSR1aBZjxC61UGMc+wmIiZqE9SrwWBNsK3puidpxus1WVNgi+GFH/16UbFBs
	UPppLo9NAuWZhTXqpVALS3yMwnLH/f/rFD6u7B2F6hHcR6SGd6Ez4hYkJoIvXiWP+e/6VemXl55cm
	A6LaMjw3ekCymcIlLcQCibhs4YWmgkJLn4XZxbs9thCcQIPZP7lIweVJmXa7yBqagMOPE3jrJPARn
	VKRPWE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ocb-00000006gM2-2DNa
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 09:22:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oal-00000006gCA-2FAt
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 09:20:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L8Vr3t014410;
	Mon, 21 Oct 2024 09:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mk+SxayGyeYDS5Wl2XojgirHH/IjbtuVxMSJDdqxZiU=; b=ZAk9A6QDM7hAFiyI
	QqfKpsWpA4uOCKVakDlKpiwGU/oV2aDyLt7vnkj+9/wZj4fiipITDE8rUOxafo2V
	YQAoSZ4n2gHn9OLElg9A0NJsTu5Q+xSuEeUcTVll+HO2TNKY7DNmwwI1b9bjIR0f
	EKinCH1lPSkhYA9kCLYUstXXFBm7d9h4RfytzWlPBhErDRSyonB6TLR/wF0NX44f
	nooa++m6LFR5Ywlt0VkQIfV6Nz1h06alV1olseoA7psZjz4Fmuz1h6Ao4XCqZzRV
	yRA4IT6h5okF8OuaqjOxX6qheJ6MKSNkgsNjdeGD3EGcptHjnMXAzj6K3TFEDozd
	Y0UrGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd078f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:20:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L9Kgx8009094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:20:42 GMT
Received: from [10.253.15.238] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 02:20:40 -0700
Message-ID: <6838befe-4305-47f7-a4f3-0f34864f0031@quicinc.com>
Date: Mon, 21 Oct 2024 17:20:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] wifi: ath12k: delete mon reap timer
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241016065700.1090-1-quic_kangyang@quicinc.com>
 <20241016065700.1090-12-quic_kangyang@quicinc.com>
 <87wmi1q1tv.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87wmi1q1tv.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jzD7HXGyCenab1DB0Qa0rIBBWcejrbml
X-Proofpoint-GUID: jzD7HXGyCenab1DB0Qa0rIBBWcejrbml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=788
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_022047_835926_D1BEDEA0 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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



On 10/21/2024 4:47 PM, Kalle Valo wrote:
> Kang Yang <quic_kangyang@quicinc.com> writes:
> 
>> Currently mon reap timer is not used, and it is not needed anymore.
>>
>> So remove related code.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> 
> Same question, does it fix a known issue or is just cleanup? Always
> answer to the question 'why?'.

It is a clean up. Ath11k uses mon reap timer to implement rx pktlog. But 
ath12k doesn't support it yet. If we want to support, reuse the 
interrupt of monitor status ring is better. Because:
1. monitor mode also need the configuration of monitor status ring.
2. the rx pktlog is highly dependent on the implementation of monitor mode.

> 


