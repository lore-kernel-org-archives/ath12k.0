Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088EACFA752
	for <ath12k@archiver.kernel.org>; Fri,  4 Oct 2024 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAnSnRBRqZlJow3JTZLFRjk2hy3sR1AskNoybtE9AKM=; b=2Gee4Tkf0WcyHnR/5YcbAFcv5t
	48B/rrSlx+XU4HTaGu8QNTcXi7NTcA4rYG79xeZzTe9dgBm69vKJS4ZWai20ABLivtPpbXphSMmvG
	z8HCgz0QRVRQTfbxzoNoZpWgw/aV+WRVocDCxMZnz3IgkqtHAc53AYKfnIlOiuzHHDbFU74EY6nIh
	2QClXgCBRlKvq5LfTs8d2MAgj+wSQiic1DLJXyK5Zfd+AfzAxFZowVK2doreInXkrhvyGIgiz1ZAT
	MCdRvEU8/uVcIRG+pHkqehPUpFUk0b1RrUupEj/fw3FwnzzAmNX5nHEIfx5eiOeLgxpwY8u/1kCGC
	aORgvtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swe7d-0000000BV4N-2xYH
	for ath12k@archiver.kernel.org;
	Fri, 04 Oct 2024 08:57:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swe7b-0000000BV36-1w2c
	for ath12k@lists.infradead.org;
	Fri, 04 Oct 2024 08:57:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I04Oi031024;
	Fri, 4 Oct 2024 08:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAnSnRBRqZlJow3JTZLFRjk2hy3sR1AskNoybtE9AKM=; b=HPIRXvSFPxxc9WIt
	9bmrHM3Wyp17uqnkx61orgX8rqPhKAek49YZvt7JC0Zemz6fBAB6ct4oDAFN2GZF
	Z+53qz8Yy8+sYXGNOKiDKjHyvy9ddKv9IxBynwbSqzZ6wnK02t1+ekCH7K3c6bA1
	T7obkcGxN5XdtXh5pOY+0HVILX8bjG+2PNlnQgTFzx9iMfJSz8GWLGRPmkHjOIxR
	jeSc0UBeuU4jFrhI6TONOe4VbClISV4D3MIiKwOvz8VHABNGKZOqTqQ3jVb1D/4n
	JnGyz6uXN7+YlGRWmeVM4K+ofZ6+H2uBeMxPtHHFEt1Bpy+xpTiR6wlKClcim05d
	1evnzA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205nhjan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 08:57:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4948v7BY011837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 08:57:07 GMT
Received: from [10.50.53.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 01:57:06 -0700
Message-ID: <397fa1b0-6116-4234-884e-a31261c47563@quicinc.com>
Date: Fri, 4 Oct 2024 14:27:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Modify print_array_to_buf() to support
 arrays with 1-based semantics
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
 <1f1e74a7-3ab6-4a92-84a1-ee157b7cd11f@quicinc.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <1f1e74a7-3ab6-4a92-84a1-ee157b7cd11f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 911L_cqKHaeHYoffj0x0YACO7W_eTU3G
X-Proofpoint-ORIG-GUID: 911L_cqKHaeHYoffj0x0YACO7W_eTU3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=684
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410040064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_015711_663687_8EF00F03 
X-CRM114-Status: GOOD (  15.99  )
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



On 10/3/2024 8:26 PM, Jeff Johnson wrote:
> On 7/29/2024 8:51 PM, Roopni Devanathan wrote:
>> The API print_array_to_buf() currently supports printing
>> arrays with 0 indexing. In some cases, a few arrays need
>> to be printed with 1-based indexing, i.e., array should be
>> printed, starting with 1.
>>
>> Add a new version of print_array_to_buf(), named
>> print_array_to_buf_v2(), which implements the functionality
>> of print_array_to_buf(), but with an extra variable,
>> pointing to the index starting with which the array should
>> be printed. Modify print_array_to_buf() to call
>> print_array_to_buf_v2() with 0 as the starting index.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
> 
> I'm in the process of pulling in this change and the dependent debugfs
> patches, but was never quite happy with the naming of the new function.
> Discussed with Kalle and suggest the new function be called something like
> print_array_to_buf_index() so that the new name has some semantic guidance to
> how it is different.
> 
> Can you update this patch and the dependent ones to use this name?
> 
> /jeff
> 

Sure, Jeff. I'll make this change and send out the revised patches.

