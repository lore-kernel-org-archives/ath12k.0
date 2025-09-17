Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13ECCAC598
	for <ath12k@archiver.kernel.org>; Wed, 17 Sep 2025 02:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrReQTnqljoeNybsCXmGGnr0Q4DAABKRtCC/lOXhvcU=; b=pld7M1aVwp5o3y9rLjDSRJN2GQ
	S5nZ1zsmFgfMs5pLaf7HiLJ/3vfNHrA41gLLy6Ie/qDM+DrH/2aWEYTMLWMUUECuU6zZLC/ROheDe
	eBxpl0U6exu8/aUOuCAyuyOA1o3PGu9Ak474VQLSumih4xhJzNoVb2A5IH8DwyMIYvdRpVqkU3ylg
	V5FCsSU11tI7rSW8aUg0mog/NuVHq258wtwKhzfZuH7itfQrYQ8syO/XfmwrKwlfmyBA+iRpWTmca
	DF9R8GkVkFwftcmGw0+maL57xiS9SuZkYU/8Btbr8BY7OBOIMrBfbHN/BcBOumY1nbPrdR3I6pm+B
	RNgC34tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhz4-00000009yNY-2RAQ;
	Wed, 17 Sep 2025 02:33:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhz2-00000009yN4-0ZGg
	for ath12k@lists.infradead.org;
	Wed, 17 Sep 2025 02:33:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLa5FR007462
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 02:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrReQTnqljoeNybsCXmGGnr0Q4DAABKRtCC/lOXhvcU=; b=RapfpkezrMRPRQc7
	Rr6+OxIPxf0Z7pDyb6LKKETuNXIIbbOBrtv9FU2ra6mFUl0cWfV/CnVrrclqt0HE
	Sfs1rvT1P6CxPUqC14oFvBKhgwhX8V1I1+XJpGCMeJl0h8/vLKLvGLXF4wYbgUpg
	QTZzzwrBtPSh4lpO4GdC3suxbzUzieTF4UxzrAF1FDOsq8p3Z3aeGWBduhMg4uyt
	iI2t1pmDkbyrPCQ4MkIGESPO7fVvwi2pW7eZFtp/H27YW8HJW5nU77OinTPtfotu
	bS4t5O9JpSSdH8tSYhBSoTedwqqy97dC6eEzfki+NMSVPhvq5UUoUu8aRF0pb0Lt
	Q+hBhA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxrkbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 02:33:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso74823695ad.3
        for <ath12k@lists.infradead.org>; Tue, 16 Sep 2025 19:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758076403; x=1758681203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrReQTnqljoeNybsCXmGGnr0Q4DAABKRtCC/lOXhvcU=;
        b=hz0fDNNuQ25mJv/BKKO8n9FVizkAbOpovPSVC61EbEUcfwt1TfxKndYL+CEIACPi/u
         PPTo42LHW0O9aX9HMV2D1jEFLsREq/XlnBrDtP0O3FBlnmF3U5p9ZWsm78szlkMBhW3L
         jUCQ33mLfwnZQqh1xrx49ClyMn5D2mhKV/ted4JNBTvZLwFA2I7bt8udubrL5fkOBnXx
         uhALiLEPJbyt7i5oOlBFWA0ipRu84EG9Ulcdjtd2zDsbpjUEJr3qiMV2gDDzZ8n389Ha
         axBcQ0L1P2J0lJFZrp8I3OFUTK84kgWK8UcpuvL3R2GFAymWs3H4k7JwQENQxEDwgQpu
         nXHw==
X-Forwarded-Encrypted: i=1; AJvYcCXHipdc/Mw/a1PmJv6NeTkz/nBuDM7ox9FJZitzYUAVqU+lgJv9npiRnqd/6WlDN/F9+TK3qds=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4rEP3EXzlK9mn0rk3w9RpBE+tUcOqpxM+itaiRilOpjyO1Aib
	FZczAdz/ctmv4YbPxZ7rYhepCpFWgb2J1WFaA6mnPfSN6YdHkjlVCEQGPpB4z/HeXRNZd6pd1RG
	yTzRZpBTQpH6wivrYQePRW0sNmqAzODm3uX4odIX8+MVeeSNz/BvIlVXlXkHwZYw2
X-Gm-Gg: ASbGncsZP2S+FRX1tqdZvPrzNjhpclFk9FBNpek4yBsyuqtcMXEZ6gO5/80zq02UZjM
	x+OkvsJFUVLyXm0gda10eBkE0y50isoTu8jzICNEFhJdg90uMT1SW1OgxP7ZEtIxbxxUv3vXWT4
	b5LwSkwJPezle6fTpyvy5eGXGStBN2uDg5BpywY9aowTRmsMf618iOn2uIN67S072sup945ZegK
	0TzYuq7ZAT/q6NwJ6Z2aOHvHatXCgBJFkS6xv25sCSGdxnsPt8D6y90OaaU2Qb8lVCWsPZzuJ7f
	msagoCWkckVBoSLmbjn2CtIrOI9iupIhfMGSyrnUKxVBmAafGLnhIlzAdY056t0dQX8VUn4befI
	TdU4Hyem8y78lZ1mcu4QUx8XoFdiOL4hnzOAICA==
X-Received: by 2002:a17:902:ebc5:b0:267:c963:25c2 with SMTP id d9443c01a7336-26813bf2129mr7036615ad.43.1758076402736;
        Tue, 16 Sep 2025 19:33:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG57Qfsb1gzeQ8IKDiMv0+iirbUDwdvmSrbCVzVBMrY/eL0zRy2rcSooGDkkLzEQcHZlj55VQ==
X-Received: by 2002:a17:902:ebc5:b0:267:c963:25c2 with SMTP id d9443c01a7336-26813bf2129mr7036235ad.43.1758076402270;
        Tue, 16 Sep 2025 19:33:22 -0700 (PDT)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-261333a972dsm110557595ad.75.2025.09.16.19.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:33:21 -0700 (PDT)
Message-ID: <1826dd68-d418-464b-a96f-1a290809e2a8@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:33:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/3] wifi: ath12k: monitor mode fixes
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxhjjkSahmSBm
 FidVRiBKl1weC5/VlvzaKhIeCNweS5im3nwz5BX6VQ1bTT5dFMQzVh7CwLO0mJribAXXv5PW2nR
 heweMdIZ4fDGknxNoTv6T0O0lpXgEp7h6CQgqBI4OTlY35fgs73BO/CjZCxFV6S/HIHkgxSdrEx
 ZZ1DqWICftPlN0KK1nZiDmRtVtPtI440KidxirJN2mZ8obkPD/4bWczyajzy+PnUcRhMozRZZou
 vEuMxGQ0AMH44zXh1H6rTpRGlxrkheyF+CD5HtLV75pwc6cUbbHf8iD0AarCoMqftAqvhCQoJX7
 yFav70TGxk0KcKoCw6Z0N3ejnkT97YFr23hNfuaowefjjOblDReK1g9GV4FR6/H6xdwIp04xKG1
 70qGb3wd
X-Proofpoint-ORIG-GUID: IK91eIIGedkdR4DAxWleyDK7XETO8mLe
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68ca1df3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-ZAtyTsNoej9e0GDpi0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: IK91eIIGedkdR4DAxWleyDK7XETO8mLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_193324_192446_4F17745B 
X-CRM114-Status: GOOD (  10.43  )
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



On 7/22/2025 5:59 PM, Kang Yang wrote:
> This patch-set includes three nit fixes for monitor mode.
> 
> Kang Yang (3):
>   wifi: ath12k: fix signal in radiotap for WCN7850
>   wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
>   wifi: ath12k: fix the fetching of combined rssi
> 
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 49 +++++++++++++++++++-----
>  drivers/net/wireless/ath/ath12k/hal_rx.h | 12 +++---
>  2 files changed, 46 insertions(+), 15 deletions(-)
> 
> 
> base-commit: e4f11ae0c4b29ca0c133f891412afd5dcddc68ff

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


