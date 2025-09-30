Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70166CCA468
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUYOMDB9EkEFadf2JHO2eigkdoLDTAIOZ93jCOeSXbY=; b=U1P3LX+sEVDq/SaGGJLFzsPaDJ
	l96F66ZVn1UL9npUbyxRwsG5qTdU/6D43NQEY0+hoZvczNW7PkQ8KDYglxUV79Sicz2PGQJWiZ/l5
	CAlAzkkNtK/HDKSSRUSJ2V9VA4hIjfWSW+TVD1OCSG6XToqIOsRGKvR34G3foV+q2bQHbe5IWKAfs
	qKvsRvacdIDFWgn/AvEFlfynTq6rYqK/N3A6DetlS5dqbMjO1I0SUVMl/FUoxOETIYbTZgkzV7tNW
	6FBwiJbcvDfsCX74I2X2tYRqPtZwIm5XEhgkCcSW7s/Pt4m3EcI1LAaClOPk8gn4WXI/ZtlzP8YJp
	bnFQh5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bRo-00000005Vtl-0fbC;
	Tue, 30 Sep 2025 14:35:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bRl-00000005Vsx-1fDe
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 14:35:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC85Oo024086
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 14:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUYOMDB9EkEFadf2JHO2eigkdoLDTAIOZ93jCOeSXbY=; b=JKk+gxh7wEwDRTsA
	fJh+SJ1ZcP1TK06O+lY/z0pHCj/I7jND6Uy+AMQ1YhcfoX/3/3N0V/XC0nUk3j0s
	oU+a2kCtFYBt2ujmyeb3brY7TuhkJhTV5jWHTrDVIYSU49xzRnGOGe2QZkx/hX16
	Ksmzi1k2kRCjOUl8+i6Ro8C3NEKb6dk961V2MDOZ9fDcBNKlqdVYj5RR69JbwEcY
	7gEjUlB/Xumc/jx0SdRGW+JOC9eK7PRhAitHgf1M01NcYmA5KUrHNNmYH2j1Sj3R
	qoHkb+rLhcD53/EluPAt5av06oRDatqpQHpyCK5eCMNajR5qdK/ZWk1O2Ru08FrY
	uxPQrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n1mbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 14:35:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f68c697d3so4271634b3a.1
        for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759242915; x=1759847715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUYOMDB9EkEFadf2JHO2eigkdoLDTAIOZ93jCOeSXbY=;
        b=H05xdhvKE42qziYrnw6816tuxSSXE00e6O9OMcRCQkij/jWoeIvBh25AKil+OYcfWA
         rqH2CYmYufZZlnDP2mn7bk/FUXxVGgCJFn1g0Nz6C0o8s67lvvAw35PNekaqous1v6PJ
         pqGkajbhGi/sR3YQqch6cews/eTzAh3Q9wD3lfQiqkMPqCK3Q/btG7vNKL2tH3/J9M/i
         7+nB5AuA83XWXb28ODIn8MzYKuWelZ1zadOo42LWPEIHXTJipasbYeDGwexjwgJsJFC/
         uljYaKyr0mfLqjdRl5DmIVz0hWFFQ+KMNm4dTbzyIV1wUvANslFDzaVfz2X02L3/l07Z
         77/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2dci/TMPlnxIWCUrybJxJDr/KKUPwW33YdvK0Q351yr2ayCItElGlHdBEw/F7Q4UvC5mdu2c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxak7NS0zjq8a92JtlQKiXji0msZEo48wsWjnmTn6tnykApStx6
	J6rVKV1bFegaCVhTqjwsmKp1Px3HksV/m80rY6M6FjFBxBKvQ+FW9Lp1C7CFdK5e5skLZZpaInS
	J9ndZfE9FTDx3cpk5pnQiV/3+dOJAtbw/P2j+gFyOp96UNEN5fvrSNOCXXR77nadK
X-Gm-Gg: ASbGncupYj27pplpzqHH0F21LVtMwZJQ3Jwgd6wS7NVgLL9PYHSquUk9TdDcpqcxIEX
	lC27UExuHjunEYRw0Ze7Lr5PI9n4Bf4yf3jCbnK8hf3kSOXRgNrqq2GOI2dqA7p7CXtFa6FOzd5
	hFKEBQ8GZZYN9obXk7ZMMgmVw85nJTqpaexidHeeU0gC9Fn5QiNsWx/+9IgMmhZ0i8kUbBpzmTh
	W1VDrb8C+2K+NMc5X3CRsZUT4KSERAfiSh9PRnuul/W2cpn2YICLQgf6HanD8VjDR0I++LPRcZr
	3ZsLijR9qOrPapU9HflGZ3BHihJXn+y+t0Y4cjGXP9i6PtWHuuHVy4qCBWOwULFppQhbjTHETfL
	hlI/mQOxuj4jrhVzdS8I=
X-Received: by 2002:a05:6a00:21c1:b0:77b:943e:7615 with SMTP id d2e1a72fcca58-780fce9a50emr19078503b3a.16.1759242914920;
        Tue, 30 Sep 2025 07:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPg5ZJRk8dz0ph328bRiAAwJg2g4EB7GzvUxmIyjNu0bbkfh2u3peHgOnyQ/TEKb1iV+ZMA==
X-Received: by 2002:a05:6a00:21c1:b0:77b:943e:7615 with SMTP id d2e1a72fcca58-780fce9a50emr19078462b3a.16.1759242914342;
        Tue, 30 Sep 2025 07:35:14 -0700 (PDT)
Received: from [192.168.225.142] ([157.48.120.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b23736sm14083548b3a.51.2025.09.30.07.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 07:35:14 -0700 (PDT)
Message-ID: <d0f8650e-1e65-3c9f-7906-507ae08bdebb@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 20:05:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath12k-ng v4 0/6] wifi: ath12k: Modularization of objects
 for Next Generation Driver
Content-Language: en-US
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LHE_tbd07fOiSvckJnRHIa6ZsE1OyxqK
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dbeaa4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=3dlviFq7DiuaNFQpTVE66g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RLL8ftfnos28qhovEkQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: LHE_tbd07fOiSvckJnRHIa6ZsE1OyxqK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX+woIn/QCoqZ4
 FfWnu9cuL3qNiYt41sGj+sEnOEr1z/N65K5QAms48XiVw/lv8CPMZh1weEGJct2BA7/v1AyjaXS
 nn23lFvaMg9A+BmnVWNZfObhcP6GxS+92eBqAJOuPXT49qR6xHgdxZqDEgzOUaWzDJxU/YP2bjL
 wc1BbCuFVZddDijZBZ0TIA0cxM9eeAlhYyFC0v0fVTtkH4Zewk4cUKhH/LQuW8SfZ9904Vb/KE8
 EbXnq50OAkQ99q7WDZE5+PiL8iEKoFZAppcLGqUmvqjd4Um+9AdfLJzTrU0wq82nvukx7yEXE/w
 8EzgDWe7Nrx2kS0qGIodfVlBvFZ18aVWSy396bLkyc5pw7M2bELzQAVEeHgDEVW1fkBHmY/JEEk
 x06gLHrfnNyAtaHMU2z26MMVf82lGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_073517_557255_A89F2D1C 
X-CRM114-Status: GOOD (  17.74  )
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



On 9/30/2025 6:39 PM, Ripan Deuri wrote:
> The primary purpose of the patches in this series is modularization of
> object structures along with their allocation and initialization APIs.
> 
> Patches in this series are made to achieve the following:
> 1. Modularization of device object to have a separate DP object in order
>     to support chipsets of different hardware architectures
> 2. Refactor hardware group and vif structures to optimize data
>     path operations for future extensions
> 3. Add framework to support architecture specific interrupt handling and
>     ieee80211_ops registration
> 
> These changes are intended to provide a base framework for the data path,
> allowing the data path to remain flexible for future extensions in Next
> Generation driver development.
> ---
> Changes in v4:
>       - Use ath12k_dp_vif_to_dp_link_vif() in patch 6/6
> Changes in v3:
>       - Use dp arch ops to invoke arch specific service srng handler
> Changes in v2:
>       - Invoke ext irq setup/cleanup from dp device alloc/free to fix
>       suspend and resume call trace for wcn7850 in patch 5/6
> ---
> Harsh Kumar Bijlani (1):
>    wifi: ath12k: Refactor ath12k_vif structure
> 
> Ripan Deuri (5):
>    wifi: ath12k: Convert ath12k_dp member in ath12k_base to pointer
>    wifi: ath12k: Support arch-specific DP device allocation
>    wifi: ath12k: Rearrange DP fields in ath12k_hw_group struct
>    wifi: ath12k: Add framework for hardware specific ieee80211_ops
>      registration
>    wifi: ath12k: Add framework for hardware specific DP interrupt handler
> 
>   drivers/net/wireless/ath/ath12k/ahb.c         |  22 +-
>   drivers/net/wireless/ath/ath12k/ahb.h         |   4 +-
>   drivers/net/wireless/ath/ath12k/cmn_defs.h    |  19 +
>   drivers/net/wireless/ath/ath12k/core.c        |  19 +-
>   drivers/net/wireless/ath/ath12k/core.h        |  39 +-
>   drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +-
>   drivers/net/wireless/ath/ath12k/debugfs_sta.c |   3 +-
>   drivers/net/wireless/ath/ath12k/dp.c          | 145 +++++---
>   drivers/net/wireless/ath/ath12k/dp.h          |  32 +-
>   drivers/net/wireless/ath/ath12k/dp_cmn.h      |  50 +++
>   drivers/net/wireless/ath/ath12k/dp_htt.c      |  22 +-
>   drivers/net/wireless/ath/ath12k/dp_mon.c      |  15 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
>   drivers/net/wireless/ath/ath12k/mac.c         | 339 +++++++++---------
>   drivers/net/wireless/ath/ath12k/mac.h         | 131 ++++++-
>   drivers/net/wireless/ath/ath12k/pci.c         |  23 +-
>   drivers/net/wireless/ath/ath12k/pci.h         |   4 +-
>   drivers/net/wireless/ath/ath12k/peer.c        |  10 +-
>   drivers/net/wireless/ath/ath12k/testmode.c    |   3 +-
>   drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |   4 +
>   drivers/net/wireless/ath/ath12k/wifi7/core.c  |  24 ++
>   drivers/net/wireless/ath/ath12k/wifi7/core.h  |  11 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  40 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.h    |   9 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  88 +++--
>   drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  29 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  62 ++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c   |   4 +
>   drivers/net/wireless/ath/ath12k/wmi.c         |   5 +-
>   drivers/net/wireless/ath/ath12k/wmi.h         |   5 +-
>   drivers/net/wireless/ath/ath12k/wow.c         |   5 +-
>   31 files changed, 849 insertions(+), 340 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/cmn_defs.h
>   create mode 100644 drivers/net/wireless/ath/ath12k/dp_cmn.h
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.h
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

