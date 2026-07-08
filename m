Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D8DC43458
	for <ath12k@archiver.kernel.org>; Wed,  8 Jul 2026 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcJSnD72t3bjrI67zk7M3+keJ/xu3I6eDgTZ0AvcGpE=; b=qPT6xVmrLhNDZ0A2YE4WVWPGCo
	7GXtpwiesTgh/cYKh02vW9RkshPcEm+eCaNClkyYHvB1vRr8KMwZxt/JuTM58kL2wlGbuBunBf3W+
	XOZq/BRqnLFDdC0dYNWcv+0z9QGt1K7aQOhcjvo5QfqvybKC+J/TNkVS437iYAjeMSLA746SsaM14
	NFmc5kuXGQfXhVU4shhmZpasHxMjGtuZcji/e2EWGpznzupYE7F6oUEj+PuZefXdJ7pgaqcS1Mjut
	LvgN4B7/VwHHsPIxasul2aEQU6dWbP3m4VqM9B3OXD/Ow/xfnWF00kAsgwKDtL5VLam7I2+qcFq+8
	sHDx3zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQwZ-0000000H3Im-0vRL;
	Wed, 08 Jul 2026 11:59:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQwW-0000000H3Hh-3SrK
	for ath12k@lists.infradead.org;
	Wed, 08 Jul 2026 11:59:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BSr3O2672587
	for <ath12k@lists.infradead.org>; Wed, 8 Jul 2026 11:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TcJSnD72t3bjrI67zk7M3+keJ/xu3I6eDgTZ0AvcGpE=; b=LqvCUEx5cZNuz+bM
	1++j4xfPGr7Ff9+DdMQ6+EoQM08KPMo1uWoC06Sh32SRnqvgrrcjPeh4ZYN2PdKL
	xMYEmx26D1DepoIlUCr3hQ5NArAA4vGF+HRXiO7Fl0TGpXqPXN2MuDALmPOgTCda
	0QJQWPvqThMvMcRcWXcHsp7uMl9Y8wuQibRXJ1GtL8l81qr9G85oaIGFCX1Mc82S
	6fW9PwUCxn+9yd8AEsIg+YBGYDBhkNH5LOgoyqQpb4Bfrr7Jm7AyQ0pboPTn70Is
	/Q0VED095sS5hmNXQuc1wv84xKAe3qOOmg9n+djGK9DJvS4t/pZyfMWDBeiw2Cc6
	SQjZ5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssta1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jul 2026 11:59:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c804e38c65so15914365ad.2
        for <ath12k@lists.infradead.org>; Wed, 08 Jul 2026 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511994; x=1784116794; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcJSnD72t3bjrI67zk7M3+keJ/xu3I6eDgTZ0AvcGpE=;
        b=IOFKOoCQMB4d46k9PhqTDtc7sJaO/1xOCXVM4O3ZA+hG2984j/pjwLgpckUaHg6JDI
         Sa81W8oE9NVzPipiI7iIIickaoJ4ERsQjgqVASL/RBUVaN4yYZJ4k/Tft47eHymCS0cL
         AIlIJ32TwLYMxZcNZVC7/8UyF5MXATeIzeEEjrw4twAunz90ZTvEUbJkZYN+qilg6FTw
         t6D8GqJScFg9z+EhamuA8i2JNydgzsBBpuPLPPtGvNfvsox3WQh4a923/FsNxCT9TpXb
         yZ26md0PLsb7QyLFntYE0dHlAe3hyQRazExA9epxYe40iZlV1PDRTlx5YiYt4DbtDpBG
         VrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511994; x=1784116794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcJSnD72t3bjrI67zk7M3+keJ/xu3I6eDgTZ0AvcGpE=;
        b=Vrl/gP4iFbYlKedyBq4d8iF0qKWyPgWibmcWKtFauh1zFykexh7DMH6yZiFt94V56w
         xAg7DOKfFyvu69cFhLzQnct7jV444T3MOJFJArdJN/9oKG33HrPsMmcdwrZHokXNjtnX
         Xv20tOlDmnJhxxMAw9eE0adthlv10dCp4Q9/g6y9h8SGOmM2bggMAc7c/VdoFerakv2n
         KywKjHsdbuwlHMFTQlHD6SR8mPUwHSWYdlH/CHNCJV4N1aJVSEnwGG/dzX01HzWGYTTk
         DB0vKO4kNqIVi4n4RISZLRq6dHeDGDhg4/ztBNphuA1R3EyGAlWDBmBmi7iq+E/7mxfQ
         UN3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqW0285v9JHpx/Zp6ENELUwZ8UQr3bQCYvjbkQCloqPJxi2Qweub8eteONNYvgNAPQeQWu35E8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywku/aDKiiBnd5IoGGrVaSxYjDI30Sxrij32vMm0fGIGfnk917f
	Y8T4TZKi6EUqaEKNTeq3ywYS4YtOZAhweCYOQQQqJtJPpUds2TMCBn3/BpHUEJ5/HOhbTsVGu74
	YGJPb4R7H6KoaAJayvGM92VNoxUXjMXOjS1yVqtGUC0MFTosqo6OjmdLnrnnD0Ma8
X-Gm-Gg: AfdE7clSVG6gB2U/iLoAxPlf21dJkoZE1B9lOJ1BD22SfPSjJ1TByAqZCszSqt6jS6k
	KebHF307yd9MQ4RAh+25jap5L51pegYzGIVCNTzwh8J8S89aMAdQOCy6FQ1x4JiGlmd8TvvRC1J
	cpOnTEofY+X/2DD78NJ7WCS/muXk4ONK3sE7E0PE3cH2tvTRAw/T5oIE9kZscMxp0VJQtIIqpBw
	rnGVcnLMgy8hoT1WY5OgaWBQ/5dsYLFAEWZo1GRpMFV+I8aNzkIZbJawSm8NoIukP3PySdt1+VN
	n76LtBBhcdfwODHcZ9jpMMGtoNE6D9Wh7paHvq5UvuXIrJXJHkqoPHzER+cWb4pyFyQ4YL2yL6J
	tBFlxNtv9o/qx3SR/ioZJuKVzyBiHZjbXwmebuHwQhLVmUq/hm5pOfHU04nZhag==
X-Received: by 2002:a17:902:fda5:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2ccea3a8001mr21827855ad.19.1783511994557;
        Wed, 08 Jul 2026 04:59:54 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2ccea3a8001mr21827515ad.19.1783511994089;
        Wed, 08 Jul 2026 04:59:54 -0700 (PDT)
Received: from [10.168.91.130] ([223.185.219.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7e9sm27836995ad.10.2026.07.08.04.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:59:53 -0700 (PDT)
Message-ID: <9bea0cef-e6c5-4810-8b79-f90ac731906d@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:29:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: release QMI handle on late init failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260708100924.744386-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260708100924.744386-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e3bbb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ziM92C7oNnnlFgKtw0sKeA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JK7btWPRm8zbeGui-XMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX/tS3YesJ92OM
 Gi3IO0qpPzo7YuncIe/NSdxbUJq05G0V7qEnoK3dbF5wcLix3v0phxtjDPDRMnvb/x28kKVxmNK
 7jyHyLCv0aul1ZsnUEwTsMKLBW+FyoX2vhDU/UUzANUVv5dSUOOFr+MvJ4jePcDUdyGuYSdD7iH
 8vUq262kw48fbn6XMo98fuRfklbOpsrzlp0CDlI7KeGMaJc8IpyhRlBNo5E1Ehf6myFX5aBSA9H
 lhymOZCD0e4+SCJczk/5VIYvfj4My/RCgHkfz8kqM0E0ujWA88i2bHjFaxaAvLyD4PmjzJ2T7zN
 s7NSytERWuRiPgMX3gHQzWJfNd9ujr9Wt55qQyndlTUSKgwJ0DoF3ZXy8aKzq7AbZtQuL1AmaOh
 IqJC3esDC1WCHJN3rhByIy8Vte48fJswNN6XiSPJQGDzhDbp0g5of60XPruG6VkaOF2P1vfOIqT
 pg2oAHA/1JhWP1YSa/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNiBTYWx0ZWRfX4OV7SLcvRIAN
 +lgZd6+I+AvltAWZ4epz9TRHfXhawxrCrrz3mzGRzecyY2FoTOw7J4eLWqz4iVtet7NwTTyygyI
 jk1ZRNEv/JySu0TjGuBet5qkvvRtDuI=
X-Proofpoint-GUID: cY_tqZsEmARkEwPv4_WFvfMLSJ0_d0Kl
X-Proofpoint-ORIG-GUID: cY_tqZsEmARkEwPv4_WFvfMLSJ0_d0Kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_045957_005581_218C5BE9 
X-CRM114-Status: GOOD (  15.31  )
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



On 7/8/2026 3:39 PM, Guangshuo Li wrote:
> The change referenced by the Fixes tag makes hardware group creation
> skip the device whose ath12k_core_soc_create() failed, and only destroys
> devices that were created successfully before it.
> 
> That avoids releasing an uninitialized QMI handle when qmi_handle_init()
> fails, but it also means that ath12k_qmi_init_service() must clean up any
> resources it has already acquired before returning an error.
> 
> qmi_handle_init() can succeed before later initialization steps fail. If
> the QMI event workqueue allocation fails, or qmi_add_lookup() fails, the
> function returns an error without releasing the already initialized QMI
> handle. Since the failed device is now skipped by the hardware group
> rollback path, that handle is leaked.
> 
> Release the QMI handle on those late failure paths and clear ab->qmi.ab
> so the failed device is left in the same state as the qmi_handle_init()
> failure path.
> 
> Fixes: 088a099690e4 ("wifi: ath12k: fix error handling in creating hardware group")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

btw, similar leak may be there in ath11k also, care to fix that as well?

