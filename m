Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8924E68974
	for <ath12k@archiver.kernel.org>; Thu, 31 Oct 2024 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9nDCjxtZPLloaBBRNv4yrOUXwySIfTJ/Uiv5uIJ0DU=; b=4X2x1F/3CprFS+yi01lE1NLRZI
	gP83JUux5TXmq363RXpuUNATANhZus/TtSXp3EbsHQXdPTJqzMEKO5Nt5l8bOQYl9bss2N6S5+FBi
	2A5wCJXD7PMlLVtmnb0rxjCUzA6lcoEEksZlIzqUOYEPD3MUg4m1K/kjqzRAXBPPEqLu34bDEpuP6
	2AuGSFTdFytoK/zHLfqEEcrTg5Uxph33XcrOuPuZcaJsB3HbUMG6X7jc+/HBrSEW3PCgXa9sp1MoS
	s6qbpc6hyRfLFHGIU0VpT2O+xlNv7nBiC6awzOWXOP919FZUfhht7IGWdyTVRrGYvlj/qucWZ+kQ3
	Qol4z6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SmU-00000003JJ2-2ndf
	for ath12k@archiver.kernel.org;
	Thu, 31 Oct 2024 10:51:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6SmS-00000003JIg-0RAp
	for ath12k@lists.infradead.org;
	Thu, 31 Oct 2024 10:51:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V9tfhG009563;
	Thu, 31 Oct 2024 10:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9nDCjxtZPLloaBBRNv4yrOUXwySIfTJ/Uiv5uIJ0DU=; b=Woq3mUpq5fi4k2Ay
	0LAM/BJHG9QhIrLuhzi2etGpgEWR1UvyoeQMLlI+QhuNnzJrWaM+CXeWWzsI0D9r
	FXcrO1FB6XiFLk0Ux5eA9ESarU8ZNhWfZS6LFFjqbMXYwYJ7fR75I1oV2Wp/7Ca5
	ijcokXTY7N6sLCEzlfTOejdbVAvHrAIyZT9j2fXQzzgSRQZ/E2ZPL9cmMH9Ujh/f
	tuCfHl9MkgXYKG+Gdwz08a+MalJ7byzhcCWnruUvv1k6hrffaLzr2LbWOWA2Qtn4
	SxoEc7mr/kblSjr9x/6Afm/6iN9GcADNUX1s/MOPyDGDx2VVgc8odZKlXSPsRTf4
	4dN3AQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kjm1bqjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 10:51:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VAprfH003301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 10:51:53 GMT
Received: from [10.253.79.17] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 03:51:52 -0700
Message-ID: <a921cfb6-3877-4364-9c55-cc89c3d97535@quicinc.com>
Date: Thu, 31 Oct 2024 18:51:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: cfg80211: Correctly handle Medium Synchronization
 Delay
To: Johannes Berg <johannes@sipsolutions.net>,
        Benjamin Berg
	<benjamin@sipsolutions.net>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241030025515.16004-1-quic_lingbok@quicinc.com>
 <e56621b7a8b229f726d644ffde7b98ba0c11b06b.camel@sipsolutions.net>
 <3a74f2f1-fd9f-46a5-87c1-fdc0235a50e5@quicinc.com>
 <b07102047bf2f076c090948b1a06ae4f22a881ff.camel@sipsolutions.net>
 <f6ec91977050f6a1f08d995b4e36ef4067ad3de2.camel@sipsolutions.net>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <f6ec91977050f6a1f08d995b4e36ef4067ad3de2.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PzLF0uwkLl85BtITYk8EQBCwpUY1Kgb5
X-Proofpoint-ORIG-GUID: PzLF0uwkLl85BtITYk8EQBCwpUY1Kgb5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 mlxlogscore=687 spamscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_035156_283136_0EA63E96 
X-CRM114-Status: GOOD (  13.68  )
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



On 2024/10/31 18:47, Johannes Berg wrote:
> On Thu, 2024-10-31 at 10:25 +0100, Benjamin Berg wrote:
>>
>> Right, which does seem to imply that a non-NSTR AP can very well set a
>> Medium Delay Synchronization.
> 
> Yes, we also pass it to the firmware in iwlwifi, so definitely.
> 
>>> Regarding the statement “Could it be that this is intended to be used by
>>> NSTR APs only,” I did not find any explicit indication in the spec that
>>> the multi-link probe response carrying the medium sync delay subfield is
>>> solely applicable to NSTR APs.
>>>
>>> Additionally, do you have any suggestions on how to address this issue?🙂
>>
>> Not really. I don't grasp the intention of the specification here. But
>> if an AP may include the field in an ML Probe Response, then we
>> obviously cannot rely on the value to be consistent.
>>
>> Seems to me that the option to remove the check is still the best way
>> forward right now.
> 
> Agree, let's just remove it - Lingbo do you want to send a patch?
> 
> We should probably compare "extended MLD capabilities and ops" though,
> haha.
> 
> johannes

hi, johannes,

I completely agree with your perspective. I will resend a revised patch 
that removes this validity check.🙂

/lingbok

