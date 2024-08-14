Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EB6C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0xqkved+ydPGiYnoCWzqD/6Sc1UrR4nqQzfRqbF/BM=; b=lT+PZuKepzINC5VilHpOXga/ml
	7nRUc4rDheXEqQbnTBaJu3qVjf1qjxWVh8fVU12zhlRbQEF0UyhlkmqIfb4WGtp7RfCnG4jF41l/E
	w/0Dny2dEh3B5aUqZkde/e0shRbDybeJ9L7AOkRilTqgNVMe/JwPh90Ag1Yj88+Rv2hj+Of6wgnir
	lIYlrVFBC9k0alU53zRnHBQPxmXfSzLKfjfO4m2zerpbDmFlKP7SjH0hkrwpZDF0xd5lJYsjEdjxB
	uU7zMH3huEqwjqI2ZgI0+/6Hz36u733SEoqYiICK4H7bJIPrxVfsEN3y4VGjM9DyIih85rxxwlgqE
	3WKkmgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9fl-00000006GxW-3B7X
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 08:48:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9f4-00000006GpX-0lek
	for ath12k@bombadil.infradead.org;
	Wed, 14 Aug 2024 08:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=r0xqkved+ydPGiYnoCWzqD/6Sc1UrR4nqQzfRqbF/BM=; b=HgmFRmQBi9uJsGbO+Nu7v0U9y9
	UT3j3gni6o33LCPqDRGXswF5yu0GhdaS61lIIi1tnoT/KlVQ63b7aGMBXFa58KRbN3wcOZeTsVReF
	IUZAnuNCHiezNXO6MkfN4EOugMDdQGKC3tYFjipcdKzPPj+0tiLtq+F0kLB2fc+EbKsVHo9HBRaTk
	zy8K8eQXX6K+nTL31ivsw2jICFTemY3axlShmAIlE1n/LGoDfMQgUVK8Q7wsqBEnNd5zB7XdoZaGz
	6K4UlXr83VtbLDs/7FQoccBpzNxSdYICdmnSxh1207R/OsbwG4/DMGAfliBRY69qoFglsYYeO+4Fy
	neSbYUyg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9f0-00000007ykt-1tW6
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 08:47:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E2htxE021402;
	Wed, 14 Aug 2024 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r0xqkved+ydPGiYnoCWzqD/6Sc1UrR4nqQzfRqbF/BM=; b=HfjIrVAXAOj6TFhQ
	wBVAEVC4xl/7xBH17pnhUSIiiJOF8wQxvv5jlk9gRFhvuJn/tbEzSbOOJLmzp8rA
	gRFP3H6BGOG2pV0qS/iAYSNeC8ytthvEyD2VxiHIzWGVZeWeA49VwtSRzjMUEk57
	acH+jnFTES7FHy0SNet1K5H/GRECY3sNgMJINNFAO/J4cOwUCF65fSYwgfa+ZL+V
	vwc6BopbySFOwKlACyyq3STKYzfnhk4zaE+butwiPY6aLDKK8WXArldGFCfNVKtZ
	RijtLx7UMOaP+uF7IRO1m7hznLucKDsJg39qnUSHRRvLIl31W108T4WkVuxYyrcB
	aDqIXQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m290sdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 08:47:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E8l2Ob015751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 08:47:02 GMT
Received: from [10.110.56.69] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 01:47:01 -0700
Message-ID: <1ec9ab4f-c79e-4872-a5f6-c6378b233c55@quicinc.com>
Date: Wed, 14 Aug 2024 16:46:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: grkxBMKgPwXHo61FlkJl4kn4_blyXZpL
X-Proofpoint-ORIG-GUID: grkxBMKgPwXHo61FlkJl4kn4_blyXZpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_06,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_094714_977303_CC798AC2 
X-CRM114-Status: GOOD (  14.14  )
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



On 2024/8/6 16:06, david Atkins wrote:
> 
> Hi,
> 
> I have updated the kernel we use for testing today to main from https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/, the base install is the ubuntu 24.04 desktop release
> 
...
> and iw dev wlp1s0 link gives me
> 
> Connected to ac:91:9b:b7:05:b0 (on wlp1s0)
>          SSID: EE-CN589H
>          freq: 6295.0
>          RX: 537531156 bytes (3281227 packets)
>          TX: 297500287 bytes (3152968 packets)
>          signal: 0 dBm
>          rx bitrate: 3602.9 MBit/s 160MHz HE-MCS 11 HE-NSS 3 HE-GI 0 HE-DCM 0
>          bss flags: short-slot-time
>          dtim period: 2
>          beacon int: 100
> 
> Concerned we have a report of  "HE-NSS 3", wifi 7 should be eht and we have a wcn7850 which has only 2 antenna ports.
> 
> My understanding is that 160MHz HE-MCS 11 @ 160Mhz will give us 1200 Mbit/s so the report of 3602 suggests its assuming it has 3 spatial streams which would be incorrect
> 

hi david, thx a lot!
this nss value is indeed incorrect.i'm currently working on resolving 
this issue:)

> The signal level looks wrong
> 
>          signal:         0 dBm
>          beacon signal avg:      -24 dBm
> 
> we would expect that to agree with the beacon level, we see the beacon change but the signal is always 0, I note from recent messages on the thread that this has been fixed, what branch should I use to check this?
> 

the patches related to signal are currently in the public review and 
have not been merged into any branch yet.
the link to this patch-set is
https://patchwork.kernel.org/project/linux-wireless/cover/20240801112853.85508-1-quic_lingbok@quicinc.com/

/lingbo kong

