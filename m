Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F6C43458
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ/2x+XVHtMq89QE+QEJmdN3JjMlArDp2qzGS+R+kMw=; b=t/Fu39TCdnx181Ewd/PxTdlYlx
	n6GKoz0QKYJSeVHhYEoIGMxvKO/j+N0NKA9AAMtP2N2qPwF7TkISi0LgyM/pOeud0WDfQcT28IkCf
	82vVC4oyk2NXqtjIFdrc0Bg+tS/qxVmpuT8ee2P9eXAX5RpiAOgYBflzZ6QLCX8xdbcd1DYTURxWQ
	94RkdJBEmabXUpS5lw9Mq7LwxuLMMosKo2TO0Ke5mGXA5rS1a0Ym5yS53aIPg3u1XMaRaMlNnJy+M
	Eeorl2x67zFBLqARyH6yLoJC/PF6OFalnad/X+Ms/d7WbN51BBgVu5EuN+hP2N/ZtPE4vkv28XdVy
	Cjc9FGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCWo-00000003oit-3uBW;
	Thu, 02 Jul 2026 08:12:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCWm-00000003oiQ-2tFG
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 08:12:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KDiI3050472
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 08:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJ/2x+XVHtMq89QE+QEJmdN3JjMlArDp2qzGS+R+kMw=; b=GwcYpUnZ3OLJJ2Qy
	9N0r4k9nRP6In/WpXlrzo8y7WMQij5X54gyX9c/y++Feeo3MvKrJ7cYnXQgQ2iz+
	Il/NO2CskZWD19BNojxCt/7nCVuTL1uMMbkSNQc/FuqYCYehzf1861v7JNyl4ZTu
	pN8NJ3VdFvpN7zcvhnAwPE4OGZjNZYLYRp8sBb9i+3/H5hq7EGt5LMvjH4uf7hsS
	9l6nJ0Q+6Jt0Z7zhrACJL2Nz/VWsscpjZrNvN1/zqNRliaj0hyN2QSP548ZQ//Kw
	ygc+7oAN6AEgvRG4xoQuhmqurXbYEw6e4ZYa3zZRnwNb/EJsKuD6PjxnAudsCT/o
	k8qF7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpu1q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 08:12:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c825562f8bso22687095ad.2
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782979926; x=1783584726; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJ/2x+XVHtMq89QE+QEJmdN3JjMlArDp2qzGS+R+kMw=;
        b=KE0Bdpgd4EQdw4ZgiFK+fvWNMMyNdXRoWkqCOAu+n+Rkt+x0MZFWVsfjhC9PpU069R
         rQwFX8VcFAcY9pMx8iCDm3IEABGAzyj2D6uK5CKRS4/BedSyC14ZJQKOaFo8qsdFhZMu
         Oe6lSG+VQE01y/q7IhNuTGHjkjahIwhizJs8nMCLmAZGb84xDjGZVhG630DyXHM7WEPB
         xVkBZBPQ7KSvsMjZM0hKNbUg8AadTVJwIYpwqFfKbQVihDYI6MwEqOUFIGlX2vhANhx5
         kC4Yq+cO0c5MOaVkjwvrIjY0e1qzF7jq3g8TXHOfFWA5xHtD0FudEatOct7ff1jz+lpM
         Z1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979926; x=1783584726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJ/2x+XVHtMq89QE+QEJmdN3JjMlArDp2qzGS+R+kMw=;
        b=eiJ8NGAdMu38gIj0f1Ap2tmg+zHx2QWhJ1kQGqYphSGpBaOuqfHxrAUZzcYStCOv57
         5ObQb2HibxrsyaDywrx7sNa78VtCnjl7HK2C2akE5o1GT/S2WSe99tl/WnTh6DAvfaNY
         6CSH8X1pa338OzR01nUdAbR8fpgS/Swgtf4uKlpvQq1D8MZhiM7bGmLgPH/dfvhhbSq5
         M/Ut1DZu+LSNpJrMJTiB0W2HKuDTm6tjM6pYgEYJjshIEzkMqUbsIda/+BSSIJ6xxe1S
         Mz5LxfKKxdqMGJ1HW7YbbMnhbPg7L3AU7YdGxXbqF4Y1vOeRFCdd9GC/PeZf4PMumnbm
         8XKg==
X-Forwarded-Encrypted: i=1; AHgh+RodeY//XYYRJd0FverMAeQYeQqWIZAMk1ajhkQhHWsFQAswmi1Z6MTCYyX1NdkVv3U4sEkQyN0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwR7rDiJZshODiouKR/qepFLdggH45G2x0eq4y/CuIGybjX/JYk
	BcD1PbP/Re5aP+poGPqOT3Ou/fVnvWhD6aT1Jia6aSMJc8DRzmaTKy8fFZD+WBzDL6E5Ho66m1Q
	Rt3CaRZ6LC1CgCHHsn/CAYQgQvK7gWZkwZqF7KAII8Sa0qd7d1RoaaE3p1sG3aQ0R
X-Gm-Gg: AfdE7cmXOWnxfR1vOtCMJHdUdH0gthE3wo4QHWeZDMcq5Tmnf6/os1n3G6piVtbKho9
	leLDS9NvYViAdUkJ9Ob2qf7FvGfLDCAEFncYWG+f0gsUCfa8GfLV3Z4FvVUrhj8mXaEwulSVoms
	KHsca8e9ta/VMD3sMDX9CtA7slWZsQhZz5PXK5mAWeFRWTFAFBsdZ4HbejPLsP2D/iw0ZcKcpOv
	svthC87LV780pVKtHH/6IyOr1la7PEsGeYx6S0JLCLLJlaztU08p8njnTdZuJtrqhMJw2aOIW9c
	0rXfoYCRKbcdGy8NBCjbvywn+T+fSwFC08cLJ3ueL0OhWbbmIeS/xEOhK+e7LLSYoAL1yHaC6Rc
	CCaky5IZG1eGFALZ2XMsWvYsjyTs3MBIfhHEmQQStlL2mPRt1W7cVdm9HKghwJD2OorRjOO7cNc
	xUCPuq8CWJ
X-Received: by 2002:a17:903:2ac7:b0:2c9:9927:a060 with SMTP id d9443c01a7336-2ca7e751e3emr51677375ad.24.1782979925524;
        Thu, 02 Jul 2026 01:12:05 -0700 (PDT)
X-Received: by 2002:a17:903:2ac7:b0:2c9:9927:a060 with SMTP id d9443c01a7336-2ca7e751e3emr51677085ad.24.1782979924931;
        Thu, 02 Jul 2026 01:12:04 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a8dae49sm9805725ad.10.2026.07.02.01.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:12:04 -0700 (PDT)
Message-ID: <f4d0c9c0-6d21-4426-8403-209f77ab1387@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 16:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath12k: fix MAC address copy on big endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260629-fix-mac-addr-copy-on-big-endian-v1-1-3de40f74c13e@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629-fix-mac-addr-copy-on-big-endian-v1-1-3de40f74c13e@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4MyBTYWx0ZWRfX0MEbY1VYtmDk
 1rCXureHOt1Qp5TfL2sfg6iqqtAga/fQmdV2mijHIasTNzG13qOc+QARW+AxQhKcIKYZWYfexQY
 nGqVe8sTavw23O6RBOrkTnPxXwSKXfA=
X-Proofpoint-GUID: wf5ZHukZeerOCX3MqKwTooT5r6fzSZ8W
X-Proofpoint-ORIG-GUID: wf5ZHukZeerOCX3MqKwTooT5r6fzSZ8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4MyBTYWx0ZWRfX3C6w4BVO5PPj
 I+DvtzczGxyhYyuKqDFgCicx4eFB+swNdKc0n4KBNuBiwkZzqOm4BMSyG4clqZOGDzibyXhUm+c
 SGopemPW5FQOFcs+fRPdfQpVr/QoHa5GfgAXVoL47XE3tkD72oWMcoNq5Lsat23tFWH4BRmyn2b
 UoJwUN9l8fRRGbqBhfHBxG64RoJc8kzJbZymOfhhT/9M/FnSp1H2r5ujVSHZqdBLG64Sa2hBBwa
 Ng8/o5u9RQ/xponwhf//qXPh02tjsYCEp2zebVvO4GyhEYU+sP8MAac8ZL633gIOw052by7ZpJf
 FKxllqVuobdkdHmJis5iABCRPSsbMq7S9wELD7fAD2ceWc+y7FuIt4S+5bErfxslsjkl1cDswWG
 wi7pbWzs4/cK+2T4HkTjbTcpr0zdh9NFK5c0NgHMNdV1GwJqIvDKrPzoFInrUG8aMdRXUBGS0N+
 WHnb3ZOgejGb2i91SKg==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a461d57 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=N9GNhs4bAAAA:8 a=ywX3x0iTvHv4trEmZJsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011208_728657_C91F1E6C 
X-CRM114-Status: GOOD (  16.53  )
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



On 6/29/2026 3:55 PM, Alexander Wilhelm wrote:
> The ath12k_dp_get_mac_addr function performs a simple memcpy from a
> CPU-native data types into an u8 array. On a big-endian architecture, this
> later results in a null‑pointer dereference. Convert the data to

Alex, did you find a time to investigate the root cause of the null pointer?

> little‑endian first, then copy it into the target array.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index f8cfc7bb29dd..50957915dbf4 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -647,8 +647,11 @@ int ath12k_dp_arch_rx_tid_delete_handler(struct ath12k_dp *dp,
>  
>  static inline void ath12k_dp_get_mac_addr(u32 addr_l32, u16 addr_h16, u8 *addr)
>  {
> -	memcpy(addr, &addr_l32, 4);
> -	memcpy(addr + 4, &addr_h16, ETH_ALEN - 4);
> +	__le32 le_addr_l32 = cpu_to_le32(addr_l32);
> +	__le16 le_addr_h16 = cpu_to_le16(addr_h16);
> +
> +	memcpy(addr, &le_addr_l32, 4);
> +	memcpy(addr + 4, &le_addr_h16, ETH_ALEN - 4);
>  }
>  
>  static inline struct ath12k_dp *
> 
> ---
> base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
> change-id: 20260317-fix-mac-addr-copy-on-big-endian-f1a4fea40184
> 
> Best regards,


