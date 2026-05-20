Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF561CD4F5B
	for <ath12k@archiver.kernel.org>; Wed, 20 May 2026 02:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0t+yEDY7apJ2M7lCjNB0JiHDCl6lCw65TngYUkig1U=; b=nre7A8htIrnsVsYQsQn7nEGSCg
	SZDg7yZ/owmGvC/it8HClUo/65OviWpGmdRCHrkRTejKZphLk1YNWg8U2BfnK/LCKdcsCyYa6uAG8
	QvPIixTCosQKvsWh/mIMDSNNG99dCXHWDsezeU1RkZ5B5hPz1ImmD7jSSjfqBdauhfXVfcK1zli4L
	7qPUGRRv+VuhpJOTsEeSe5DnCDXXHdf728xBME+YUhUrqtE70A1Aj1KWYBsT2Q+ADfxgSWgI786KA
	MBhpvSKT/P+8tQMZG8WH2YEDi4EKxxoGn3Szay4RsygV3kD0hOV5IBZADaO5+e6WEzUjfhnpDEVIY
	tsRGCrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWtQ-00000003KQd-3ivJ;
	Wed, 20 May 2026 02:42:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWtO-00000003KQ4-1z8j
	for ath12k@lists.infradead.org;
	Wed, 20 May 2026 02:42:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JLsJuk629597
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 02:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e0t+yEDY7apJ2M7lCjNB0JiHDCl6lCw65TngYUkig1U=; b=XzAcdbzKgPtPP8NY
	fX+0iJCbDYpURWPY/d1AKI5otFKLSNF+Yb2JbkY8nykDHRxNeDU5rGTt9Km16ekY
	2sdKJS7Lk9xnJ1dik9vVjnkEnVGrpQt/6ePJqJ7WD3ZP+o4yb0GjRPt3VX2QT6Ha
	cSqhW/byukPsIawWGwez46qNkiHza7OeWmFqunSEPJblCk0E+M+ikV9RGs6bW08q
	O56qjX5eVNAXO7nEIueLd+txZOkH36dTyk7W7JT+hIHymHkBKmeNTiGSZapWjNlp
	SoqD53s0VfYDBShfekT+KjDDs2oveUzSHMEQP2m0SqqXQEB18AUPLR5QUELanWNd
	4MGFyQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3ntk55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 May 2026 02:42:41 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12dba1e866dso2960700c88.1
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779244961; x=1779849761; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e0t+yEDY7apJ2M7lCjNB0JiHDCl6lCw65TngYUkig1U=;
        b=B05cyWtOz3hlsBMl/1S9yGeg2LmrMKxxW5Ad18eYk2bCdvI3tu6i8Jmjgh1mhaixd/
         wREq/LCYtYftrse0UMyLQrGbr0HSgbqLPjMcox+zWms0fhzz2YezD6twVi5jbHIlbk4S
         4KJ6LzTyJFJbI25cAn5uaiNZQoaE2WiEh/lBe1Km/HzUH40hIms9vn1FQ4YTjtCnFqhv
         D7COu2f0yfO/I2WhghtKUxyyOcRbQEbRvVi3pQxr4LrFCiDM//GP2yD5bjpCurJyE7XV
         BLNrMbFs1TwG+w6TAGzs/86HtALA+CJYjTYQJDoDoPdFxU8B8UoFwSRO2gln0jTcoBCg
         Lhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779244961; x=1779849761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0t+yEDY7apJ2M7lCjNB0JiHDCl6lCw65TngYUkig1U=;
        b=eXt90I/75NjdazmHvg/Jemz4UYFHgo8brXP6rO7Wc7DrBW+MeZAvZUq+pBtQtRnOEE
         9987bd7gsBgaC3IDn88mlG3fYgd9IxdnBDhL2LjbNZvXySryGBDO1DSyn9hk50DEKHRN
         Ez2jjdWN1M90XG2EKcvjpbHUrB5eSUpI8LPXn8p27hCGGZd99+reXDuHQzQblqOsyfCo
         ghLsEGQN0jzeib6QaRUvehkxY9BbjDmFu8pl4gPz6uxmtkdjyDLcxoKVG6yb8Z+RLEAU
         ++JB1dutdy9cBgf1VyEO6yOlh4DoLJWk+wYvwfjldxI0UJJelfi4RGHKJk1WViJKebjs
         ouRg==
X-Forwarded-Encrypted: i=1; AFNElJ9ql7FdMFkcpAKibOXJlv4QbLSS97yt4+vSvXjetXQibN9RlFuVgn4Dd+gNTjnuGTI7w7x+how=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj1Vt+HzfHQerzKugBRE3d6x5T8TeOSlL2qqthREb69o4Y6TuH
	BWheNuKx2Y2A2BMkdTVL6Uh9UPHEJikVGAcmV2ZIsocMlhablqjHj7copazSwKqZSwXoEdoMu08
	0sCRvqSF8MsJDQuyAe8RhYekoYg2YED8+Htb6qJP5cPLroJgZR7IgTgy67jg9bJEy1p8rYQwI
X-Gm-Gg: Acq92OGBOzZpw8EiVJ5+Embfd+v3B5CMHF+G23/yOnqimErSyqoZg3ZnYejK2WiCnzk
	bH5pCdT1NVpY3pGZCd/k1JbwUamacEFSrq1/Hvu+vFReFzLYiJ0E1q5+SsDgRBv7Yq0f2sPGtTT
	NfaX2q8mDuGlcPHusw42EcuABNi1/eCKAWlPTRB9ITiTQf7hLy5iYDFNPWmd4IcKt1XiU4IK1Ra
	apG6sx8ibWwqMSg9J9LPWonVuQYWOFfYyvwQnPh3Bnjvb5guc5Hi9TcrfDceqpZ5y7uuRrv3gZd
	oSNF16E5vSdzhM55faoq50bTUYcPpGigOfO1jtxNUopRtf3M4XvGTXGmGduSouiBLEJjLK4qN1A
	M6LdABHiRamsgyKdOVzzRc3LLS74qGBK0IzB0Lm3uOBRVBVD+i+YO5IMw+QlCL3gZrUqPcnTDXD
	bZoJ8=
X-Received: by 2002:a05:7022:f96:b0:12c:9037:5115 with SMTP id a92af1059eb24-134ffe9529bmr7832778c88.13.1779244960670;
        Tue, 19 May 2026 19:42:40 -0700 (PDT)
X-Received: by 2002:a05:7022:f96:b0:12c:9037:5115 with SMTP id a92af1059eb24-134ffe9529bmr7832767c88.13.1779244960123;
        Tue, 19 May 2026 19:42:40 -0700 (PDT)
Received: from [10.110.23.100] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm25554404c88.5.2026.05.19.19.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:42:39 -0700 (PDT)
Message-ID: <b5870d83-6cc6-4b9e-bb4c-ee812d8b7727@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:42:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] genirq: export irq_can_set_affinity() for
 module drivers
Content-Language: en-GB
To: Thomas Gleixner <tglx@kernel.org>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
 <20260519011627.713068-2-hangtian.zhu@oss.qualcomm.com> <875x4jxyht.ffs@tglx>
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <875x4jxyht.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMyBTYWx0ZWRfXzdQfdehbMaHc
 TfZ6r8K+f6M414is4xcpFRJPRGlEd6gjPW2iZvS1Q9phOAGEy4l4mGp8V7ITcEACk1wBTkk7OlD
 lFI2JnzgTnU9HZhnadop+biSB1RNbxfF1BuCdxJo3cPOV6yh/CHjJ7a9cB9uioSEtWeXlRk4FR4
 Pe1EginOMt/8Q7zfTZ6g4c6btPsiwJ1w6D3BbxviTF7Es6ij6WObf4nHAHke4g3tJhFBzR/lahF
 GOetIXRGbTxnbPnLKJqVz6EbMEQdM/d8F9z2SSRQ7wAqVjmQL0Y8e8Q7cXn0iW/09cor+tQNXBe
 +T9jAh+KAf+Q0l2miACzNjtuewPEb0oCae8P0hoFR920RIzhroSEm3zrBzePRGHsTD4tEJqhwON
 pkaFjY3LfxP9bURPUo7ySnguUf9b8UiUusv3pGCZU9KVkfkjAPbWv6hB4ISvHq9HFMdzcqP80K8
 KrG1pfP/adzksNUobTA==
X-Proofpoint-GUID: v8CLMlN0ZSSeC_hMBPfqGqN0SWXj5BFh
X-Proofpoint-ORIG-GUID: v8CLMlN0ZSSeC_hMBPfqGqN0SWXj5BFh
X-Authority-Analysis: v=2.4 cv=Mr9iLWae c=1 sm=1 tr=0 ts=6a0d1fa1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lnQDW5h3hmdP-kpHZ14A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_194242_528851_FC61AE13 
X-CRM114-Status: GOOD (  11.11  )
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



On 5/19/2026 22:30, Thomas Gleixner wrote:
> eviewed-by: Thomas Gleixner <tglx@kernel.org>
> On Tue, May 19 2026 at 09:16, Hangtian Zhu wrote:
>> Export irq_can_set_affinity() for loadable drivers that need a runtime
>> check for IRQ affinity capability.
>>
>> In hierarchical IRQ setups where the effective irqchip path lacks
>> .irq_set_affinity(), drivers may need to switch to a fallback policy.
>> Without this export, module drivers cannot use the core helper and have
>> to open-code equivalent checks.
>>
>> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
> Assuming this goes through the wireless tree:
yes, it's wireless tree.
> Acked-by: Thomas Gleixner <tglx@kernel.org>
>
> If not, please let me know and I pick it up.


