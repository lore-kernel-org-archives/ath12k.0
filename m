Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1997C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv6pA3vNYZKLjwqhVP/KU778A/Sy7FvGxJvop3xJ8aU=; b=2h9PCipD/x2n38U9x3VszguaMF
	4X8JQQHrh22niARo2EiY8+25Jdm2bGOguzc6ggxeYJsmEmHI0/TLw8v+80AlCZBdN/juyNQjmAxOZ
	lvDzA9nNZbKNJx7/HrM21ZQatl3Y84ywx3SVlr9wRW+ST3UDQe8BNZau2yQsn87Xv5T8ziGyqiX86
	NsKn7vbMo11PQeBty1QIH/FNmhDwPOfmMcFN/mS7NjLEWgNL3mAC7ReA8HQuEDh3lpUYBO1BPKina
	h7G6svOXdORwqSiVWPMvX6kkKsVGwBd6ET9E9Ytx014IxRr/X3Ng0aNXVh3IihQ9h47+EV0cPMQzj
	D+Z19vmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyI-00000000EjN-1Sws;
	Tue, 30 Jun 2026 21:26:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyF-00000000Eif-13UR
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDp4f2838598
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fv6pA3vNYZKLjwqhVP/KU778A/Sy7FvGxJvop3xJ8aU=; b=VePcXhA7rTOqI4Fw
	hfJ2TZxrHv5FAMjWvogqvarjFkcJAsaFI6gP2oH2apwmJ47aZHxUBbArGVdTW1Ek
	nTG5/otaNpA/EqrtglPrERHiGqgRvHXtvYQan39wU7Di68o9d75NIqYKsSU2Wp2e
	mJjbvGWvBXH1J9Qxc+opseNIJajYmLlsffAmqEIj2AKrgxrW6NHyQK9Sbnwg5+y6
	SDbuKC1mRomeFb5XaHXMV7KJh+Q0hhreXeqnc1bfN6m7JiozHuzWLs18LC9D1K1S
	YR0ARIbUj66ErMAi4bMnKLLIehmhJnLifY2Bl+xnAlWtp4HAL+ZNDbVdiIlrWJ/j
	9La9xw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd1bjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so859360eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854778; x=1783459578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv6pA3vNYZKLjwqhVP/KU778A/Sy7FvGxJvop3xJ8aU=;
        b=UA+RZTYiwiCgwPrrnq5PTBk8m4gl3COsI2SbflZLWaXgoSxCaAPqu/oOxUkGVWOy7l
         5A7Ehqlr6jybwEiMHyOGvQJWg2wP7xLBEU84+OzCvd+pGaRaJS6eYun3tJbilt5nnmXI
         3S6Fsu+g+ziYRk6utPxTcbkHVVLwX/a9ulmss9QVDf61X5HmzHjUHFEQUrSJIFHd+c83
         dTFXV6tAgI9ooFVETmxCl/ya/FPlFALZVz88urYWkdj0WPPfKjpkZqCr4dAc+0HXpRrC
         woZL9oyt1CHiiUUc8nnAiJgPRTxRJjF9oH+XNQEgL948K/OPbGF4QCPl3WM5xmHfm6Ch
         JIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854778; x=1783459578;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fv6pA3vNYZKLjwqhVP/KU778A/Sy7FvGxJvop3xJ8aU=;
        b=Jyna9y3/buD1743HXz1JlGWkOAwdy0XL9AjRgeAKQxHXMrhNyQ3GZwBo0vVEUUKJvC
         48jsiTw0FWIOy8bN+o4UUskkeTQGHjH8MqJoThoUnkl9d6kSLaIDr/JpvAHCP0CvjJmN
         mkqpK3Xl1r7J1feG+KvVfEPziZBEZWd+8mmygxRKb9EooD08Dpy2eVIcv+83PvhgXWEA
         pqs/EItyHUh0qLbjvVpviarYLtLp67Q8dCRSUORsmhfpOZAqGwk+qjo1OtoNFpBxFL+e
         7UoPEKUwZn/ArzflVl/GJ7/jBUp2TjWIC5agKBMHn3kFSjuMP4k/y4MC9/PAZOdPmead
         zfmw==
X-Forwarded-Encrypted: i=1; AHgh+Rr05osBJLD4XexfLaYIfq6leB9c3M53vsB3HXfjrnqmPbW3gAbwUWYbuGVbGyemb05eh70Q7U4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp3r4cX5+tuRzAANgNvjMOrl+vjA2MRabzFgZa3YJR1Wtkb+ER
	f131GQ0OHAXanO1kKBkR88x94RJIU9SjUJikhROOGODyHGY1HRJ+WBha6gwEXFEBzdNlnnIVI8O
	oi6bfb26x9g2x+3q8GGoEHISVu2O9W3OO1NOqZqpX2CNiVcwnLHbb7upFRj+UroJe
X-Gm-Gg: AfdE7ckmlSPj5w54ZIU9MdVQLnb44YhMU4CJNg+NVwDgeoCm1qzZbgaQ4O3KEHMfTsS
	9K2Vi6hXkm5hqYXWE3FtIF3Qeo2iboEKNEKCFqZdos5sHQEZfgW8JYB3NPpk0pJoZ2PWKaqRXol
	sFNVKO/f87Z0OiBMh46h/u6sMOH2hklnH0BNFK880lN2uGWsNwsXjp+p4pkZJdTSxTaMB0Po/Bv
	7Bm8lIiUEvFdHl83N+NlJ7Q50HcW5ocVEyPCg46xshiZsgKLYSncKri4nuSzRp2n+il6kPPvLRi
	kMC1J84F5TM7ahVODEae949hFMRmVuuQ+Gx3TZ6cvGU/+ngNQrIrs119Wp4RTd8Kctgbobqz8UK
	CsEZFYpVbUxhpCuU9Q3FM0EH4ps7tIRIA3ICiefBrFaQDJdvGC+zxqB6WdA3zitAhvw==
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr4512367eec.16.1782854777913;
        Tue, 30 Jun 2026 14:26:17 -0700 (PDT)
X-Received: by 2002:a05:7300:2325:b0:30e:d236:57b5 with SMTP id 5a478bee46e88-30ee128cd0fmr4512346eec.16.1782854777388;
        Tue, 30 Jun 2026 14:26:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:16 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: tglx@kernel.org, jjohnson@kernel.org,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
Subject: Re: [RESEND PATCH 0/2] genirq/ath12k: fallback to threaded NAPI
 when IRQ affinity is unavailable
Message-Id: <178285477658.1590147.549685497846838720.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX4Zysd/z0/dK9
 DbH8bP3XJKIQ4khzxrsGbMeV90vTEIGN+SvCea5N+Tl2MY4jQ6q45K2tNkpwfhjlyOzLe4+RU1P
 5TNC826YTYUCFe78iVDXREFtDLyss3o=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44347a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9_3RmCN_obsrxBC78ikA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: -BuufVk2U0xCBKybdgzJBm3Fc1PxGrDD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfXx7KZ1xvKxD18
 Ds/Xnhu8+/heG02fpjSZiYvxfSdSps+fHu+z+2v4e8z+KM01mFthnpmsd3qxNoWe09EEX0yUPSk
 btL52kCAFbmb7Mu3LCnNbicboT/WQAaE5n82Jw6I8roAg/M5gXcntMh39fyez0rpONFOZq7+UKj
 XqlhGWRVDMcT46G9xPu+x5Um6PtpsOLCv2A/6J5bB1t/Qb15pj9Ht8rAnKVuKafFz7CJ5gs0+27
 6roCurSK6Kt87PemipnrM6XScwp9HHY1wFcn1a+aZyXg0q6QuyM8W3udsKZrsgNN3uKOlHG0Zcr
 Njw6BhYUk/6gdkqbEGipL8O2rDP6IuY+CbM3h8yMTr0Vx0H0KPL9YHtj3pEV3KZn2s6a4VUQdE9
 1LreijoRVSRdpMIoBgfkVw7BxOq65MsbIVUtqb5latuyosbajrfwN0OKPpmZPHA2J8nL1uuhIzz
 eIMNRA2jxuT22LUck8g==
X-Proofpoint-GUID: -BuufVk2U0xCBKybdgzJBm3Fc1PxGrDD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142619_309393_F8582627 
X-CRM114-Status: UNSURE (   8.63  )
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


On Tue, 19 May 2026 09:16:25 +0800, Hangtian Zhu wrote:
> This series improves ath12k datapath behavior on platforms where the
> effective IRQ path for WLAN MSI interrupts does not support affinity
> setting.
> 
> In such setups, DP processing cannot be distributed as intended and can
> become CPU-constrained. The ath12k change switches to threaded NAPI when
> runtime IRQ capability indicates affinity is unavailable.
> 
> [...]

Applied, thanks!

[1/2] genirq: export irq_can_set_affinity() for module drivers
      commit: 25e638447e329f08febae2b64c7f85b3bb95e998
[2/2] wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable
      commit: 74e1a4762c79a2d6879495d83f22b83acc4dae33

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


