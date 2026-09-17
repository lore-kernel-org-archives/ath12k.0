Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D4AC88E72
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCYEospgVDPAAQl+7gboh+7Q+HFKYksIuEIvjVZidQY=; b=16usNciiHToVh5FFlHT6tSYdAt
	X4YDE7JaebmvIBU595QMF0HmlPptGD2p3L/yhYYfXs8EHMEE/iM+jqa+b5H13ESQUSEZJjXBy+Jil
	B2OQvAqo+/H0N3LTaRuy/wFoVI4DqkrK4Sj5i7YxXqEJu1fh1DKj9CJ4gaGgE4E1526f+EcmCFGRT
	KK++vAD9YbmiV92YWAGzWaNuLehV5Vy6Dz2mMcifDfa2yerxZ8AWYUkt36Hvlm2tZG4nUPTDCh3ag
	DCz4s2BaYlCws4pt2M0aynduKnwCqi/LrptzRqGjd4G7gtqA4L503x/56lJVv5a1QA8XbEP/e8nW9
	jIWuHuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79bY-0000000B7n1-1WPb;
	Thu, 17 Sep 2026 10:44:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79bV-0000000B7mU-2ozX
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 10:44:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZqX81863438
	for <ath12k@lists.infradead.org>; Thu, 17 Sep 2026 10:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCYEospgVDPAAQl+7gboh+7Q+HFKYksIuEIvjVZidQY=; b=YhboDrhAqLfk8mIO
	MtS2Ph9BkObPRR6lODo4+zBwlQrENDp4KVJBDE3lu3C1+iaPYh2f5FI7/w5R/Z4g
	W2U8INKwzf5nTrm+ZQ2Rs9ataC8nSuyz8HS/wAmK6sTKteOfrXxyWJvhNnEQXALF
	J5m86FRmjz12Lr7zieB2Hmc/9pylWtzvE89VswlpZ3pL93O3jmyRUVaNWgOd10SC
	BbJr9vpUOXy7art02T3Vvw8/FUdQxzuzT9ioCFEaGctQQA8RBEbHcNoLUzrm72E8
	c1uj99xuHpDGwq8lGMFeFDdXvrWF0FKV6nLqNTsibceLMu1C2+mPaD1KdoOISUT6
	0O7OTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6autkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Sep 2026 10:44:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc92350888so14081825ad.3
        for <ath12k@lists.infradead.org>; Thu, 17 Sep 2026 03:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789641871; x=1790246671; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCYEospgVDPAAQl+7gboh+7Q+HFKYksIuEIvjVZidQY=;
        b=bZuVKjMT4Jy6dhizkse1qB8H1jW6/QUcCK73utcUWsD3vB7mX+1LaxgJq9pJAFhcAa
         EzGHm+TZ5AhuiCXci32VfIEpX4Re7NMZrju8Sn91X4zOnlKM5caYkqxDM0woEFVSGqlz
         BYU7aY7Jhg4H9C9Awiad5da1tHqwzq3mmc5Tyrr9npfhguSpQ8xM5nrSLkPU9zVNtBYk
         72DjZFHZJnQ48mEw3ezyLu/vRN5o5QOLBFgy6u9ARw+8cBc5xZE55VrBj5qXSWaDiyAU
         MsIC1bvW+dYj4QT8RWANpUqvU9b+A0B6E3E5idicyO+e/svO6H83+OlbyDrO87sdX+GI
         8fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789641871; x=1790246671;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCYEospgVDPAAQl+7gboh+7Q+HFKYksIuEIvjVZidQY=;
        b=dsIF/XEbpTy5ERB9IoqFn8IX/KBdrWaEPX9/RkTM84tAlAAV24ft7fgtY6GQDMTBZa
         +LtAhzjNueVrv+e193WAW3CMkCjqlLMTD1Vm76/gZAiC1NKVgy+QNUZ2pRIfdux/RJ0b
         enyAgPf+j/wsgRgBfBY7nTcPYK7nNXD6tcoU0bIXlWbOCUr8d52eV8gvLq8ZIBQVluS/
         rMsTnDfZwjv75giYfapbJROT+IrEb4U4v0pz+JJiIEKivSx8igLTRqeccEF4J0AU2zjW
         4ndakQRVd1zuzQ67H1tqK7/7oIGA0PuS7LvGQDV8NPVOqdphJaMULW/xiDqY5rach89R
         pQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5KdmTQYxkdZpyi7t1j973FC8U54rYtpCe0Q29R//coEthxQDaSBaIUcaF6G3myAK7T+GNqyI=@lists.infradead.org
X-Gm-Message-State: AFuF++k6TqMpevZoapz+wU0om/Nvo2+e/p6RH/7hCaKNUXiVvidAHpnX
	7eQpHdGKM3SXlsGAei/9/9GV4nuYmDS4WcM61fqdmHKal9ozbJ0mV9V3WgaIwfKQTfG45/Jqykh
	a8GjTKeECNWxC/rJVe0Vr/2jV2KnTWbPuxhJecrpchEawmUJi9jLI682o/tTz7Us2
X-Gm-Gg: AYBFou224zVH9/inClHjBDJZQCSrICgE5U+jCLSmvG+U4SYNESWqDPthv6H1e97JqIn
	RKU/kCglMGJwCV0we2Fa5d3qrbiuru0VkPx69XSkvAdLLS62QLOKmckoK3xWL+T90KCCwHMUq7i
	uaMtlnHtaMw4e9fOE7suAroc+uupWNgIWEi4yaGs3dnBsBN3WO+Vvrp90T2lBT75UZ2O2ok9d6W
	hijms27L3u+oRBsBpk72aPnOjphHA+R5LJtM19vjg3aZ/Z2hgY3EjxxPmj5D1+laCCxgSLBy+ER
	Jnz2SxtYTAcXbSMTkJx5k8cND/xzDlQYu2faZ/36XIzG7G9ioehrW+l3LBzV9F8EyKMl4A9nM5z
	r33PoQiy5anee7jnA22DW4UcTfYL8/Sm33JgGf+XRFaHb/YY=
X-Received: by 2002:a05:6a20:d10f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd5f72b353mr17153728637.21.1789641871123;
        Thu, 17 Sep 2026 03:44:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:d10f:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3dd5f72b353mr17153666637.21.1789641870660;
        Thu, 17 Sep 2026 03:44:30 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144c9f0da19sm186695c88.7.2026.09.17.03.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 03:44:30 -0700 (PDT)
Message-ID: <1da678cc-d2f3-46d2-9cb1-1c3ed2a8f0a3@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:14:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: fix monitor RX buffer
 lifecycle issues
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PbfaXGVJQznIMLsi3fTmATw7eV2v05c-
X-Proofpoint-ORIG-GUID: PbfaXGVJQznIMLsi3fTmATw7eV2v05c-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfX29L3Y/WOsMCo
 Ozi1yz2io7yq78Urqk4wcejTkEb1fX7K252mlJcxwf6ZTqjJurJAqGPOINOBCdQHTAdOg0pnKaj
 0V57e474uqdsfdUUY+7O7HwK+LKFlMtV/V9+V4tdZPtPpjgs2ygpuT3bT6LVGfXLxJuJPwgv3ay
 jwR7SwKyPQTSmlhdQQTSXIrvjFI8as7rhblxvtKO8CTOI2fZMGc5psSbE1XL2kNMyt1SANl7Ndg
 wF1989mgQkiwy99gr1ogGii24pMZxnu1A1swykVAQDAC/BU+7Nnj7tfwxDV+Z+tv4bUr5ikSp1R
 n3/SUjJqjFub9jK0D3QScwMt84sLbEV0OSFybQ3xRnpgYEH7MkuGMFpVMxxzs1VeGoPtzZdFFir
 Suw4jC0XfB1iZDDYg+agTlcWjDzXPWtRlLOtS7yrUW4slf0UA5lEMDUih8nnjeX3UdU83MMIMyH
 wWOv1HUQGK27LpsQafg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE0OSBTYWx0ZWRfXyZmE23Q3T6j/
 Dyyo7fDgezHPCO5saFti6YORjVCeC8e5+inGVN1laEduEXf3ebIk+NUC+8i3H3t2nUNqBX6Qo9h
 7clwq+DmzjV6wxrA62A4LjMScXA/F7c=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabc490 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jeZ2dEGWif2cJ8v1hNMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_034433_852088_60097EED 
X-CRM114-Status: GOOD (  10.35  )
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



On 9/16/2026 11:33 AM, Kang Yang wrote:
> This series fixes several monitor RX buffer management bugs in the
> monitor destination path.
> 
> The fixes address leaked skb buffers, stale monitor descriptor state,
> object lifetime issues, and incorrect DMA unmap handling observed in
> various error and corner cases.
> 
> Kang Yang (6):
>    wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
>    wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
>    wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
>    wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
>    wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
>    wifi: ath12k: avoid double DMA unmap of held monitor RX buffers
> 
>   drivers/net/wireless/ath/ath12k/dp.c          |  9 +++----
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 15 ++++++------
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |  2 +-
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 24 +++++++++----------
>   4 files changed, 24 insertions(+), 26 deletions(-)
> 
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>



