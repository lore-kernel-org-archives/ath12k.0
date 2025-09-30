Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4282ACCA468
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UF3xPVizitXHcEN+gFFFp6aHN9M/76f8O6UvUpKNjI=; b=smt4+SVVNqUQvEnNRNoZSHuXkN
	YXBKPybGVwzsT9x4m6NqrI1tmTpzY8HTab5cIcphuNgk1Y5UKgXsSZ8e+ghrA4TtqaYt9pDlT6tX5
	tWavi+31s/y4e+IC31PcgK8hHjR9x76A0TYp8n2t7B3qUGfhtcRtST4Sg0MB9d+H7IPsG3M6fs4qL
	jfxHJOlufLrjtpC93uPs/wvda83JzuczCEyrh+OopiWKIQNKjzJgOZ7OHe9eUMgIjGqvjEBtkeP9I
	pOa9NfnQKXE73W1yz57WbrscSWPfVhu8osfJM8pgH7Zaasj+uSsTR2IYD9MJII/HDrq0irHiByZM8
	WEi7k2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aG1-00000005Nwe-05mB;
	Tue, 30 Sep 2025 13:19:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aFx-00000005Nvf-3lrz
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 13:19:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBHJss009559
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 13:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UF3xPVizitXHcEN+gFFFp6aHN9M/76f8O6UvUpKNjI=; b=NgeQOB87nrQAOCKW
	Nyj5+k8+d8hnHfDcYkdyC6CjQECnNzWxuugTgJPXnE+k40FP7XZ/a6rsoCjZrLwQ
	EBkaMcBEMjO9QLGO/Yf6yOqfL2V48eJ8zMSfH9GVIQxu6WqfmjfWF2qL21L2O8V+
	s3ZHRubfWFn6gbAx+oxjLr6x1HpbQOe8QDiH1xvJR73F1LkRcFO1ObpnpyrWS2Qb
	6U9Wk1BiOiv6Ge0ZTtLQbaC+M7jpCH9xdyyvGWreE4k4tl072tgCWc2vRtk1nTx1
	nXNssUzWQ53BM+B1h1aTQEMcdm7sp4I/8JH5+PJ7w7tlfrFGGiA/iMIfCyXulA3r
	eEmcJg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977rt80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 13:19:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b57e477760dso3645713a12.2
        for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 06:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238339; x=1759843139;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UF3xPVizitXHcEN+gFFFp6aHN9M/76f8O6UvUpKNjI=;
        b=W/F+8qQVysNoeT0jHUdMRfSsD+wpNQKanYo1Z6+1CLe0mTmxdd9dcXJLdvyBQJBytr
         S+wiPi6bDDyf8eqji4rMO7nTd3VlWWcUs4ukrLNHjfMFBuPkldGP6SFG7/kGyb1j4l8Y
         ekeLsT6kqIg7Yl2bP2MYFc2EVrbiTTs5rNp1CFtdyKeucD4sSD2eBNmjEIT3M+/4bCB2
         +MLwRM8FUyzc9pZbQW/b8DoumpcbBLMfg9raLD/t7K24ep4gs6NZIhCST7ypu31YMGrp
         fZznC/4VyBD3bHDqKHy3l2hI8WuCBKuQx+BcnbI4sK9QwZFrReEEGot5AGDm+XqY3m86
         QgdA==
X-Forwarded-Encrypted: i=1; AJvYcCUM8Tkr/0/RiGmQ12/M8JsQ4yIlRokQnRJXqS4e8yZytXnbJFolyiQe/PKK0O7L+ZPm5k2Rnqg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJNkqMx0k9a7JIte1uJchtyN0aBdKM0N6UpWA+L3o6H2HVgAJM
	vWTDPopDdUBtbQbKiUDOfgSKKvFbonaDrM6zxH+rFYt0EOeGaEp6ISWefzr3lfg8A8mzacvPF/T
	AEnsMTtZQtNwIg7Q6i/pFBIgD2lXC8qw/ZzAgepWib5RSBFXEoSQdqaLHQ28Nwg9I6E0BCmvE
X-Gm-Gg: ASbGncsyuXdwkR9EoAna1a9vpHKgVV3gEMAkPt5mWjhpdT0+cEb6GP9AQePkbNuuM3U
	HjeZ6I9AlrEw1z1xEC927tmZrGUfkqBODmm6W/bk4FCfc40bLkz+2Oglnqrb+YRqM+2RU+FdmB2
	p9CANYZq2exNd8nfBV/pyb+U94F1uRzIVNZBcehr/rzfevta4guZIojce9aA9Xa32hZejaEFs1s
	FTlbnCCDcozc+8PbGlSnXLJzh3lOYzOQynrYn7Hi5OZFSgdXmADjnY2fgJrtRCys/nmLE1cCBzW
	4/Wrem4lkOx0QIzOO3dPhx22YQxRoWsgbiq+ThWleMvTAJGG23j/nhzTPx4etGvodzecWGUjHO1
	hZiIC1s9NsQWpmjfD1ruKqdqCTIROYsuyX3CIviz/urg=
X-Received: by 2002:a05:6a20:734e:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-2e7da45e875mr28048876637.52.1759238338952;
        Tue, 30 Sep 2025 06:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXByZqzBxvKKJLmwX8Ti+9nx4OdQkh6CDH5fI10SzUo2K2oW1vRRmLuDdghH3eTHG+u62peQ==
X-Received: by 2002:a05:6a20:734e:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-2e7da45e875mr28048833637.52.1759238338368;
        Tue, 30 Sep 2025 06:18:58 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-783ad5e988csm6463432b3a.18.2025.09.30.06.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 06:18:58 -0700 (PDT)
Message-ID: <a4df6fd1-6ae4-44b1-8f3d-4c8ec23c4e62@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 21:18:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng v4 0/6] wifi: ath12k: Modularization of objects
 for Next Generation Driver
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250930131005.2884253-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f9irkrqn2NUAWeQ47AoNHAuJg9TmTHGq
X-Proofpoint-ORIG-GUID: f9irkrqn2NUAWeQ47AoNHAuJg9TmTHGq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXx47XRPpPuqnz
 R8OXqzRoYeO9cAHg4J0H4MPc4ybwNBRke3yR7mdiQxOMbfMMXs8F6rP/O2HmJS5QZcJitGZ6amX
 kUxIjIM+P4kn+64dEY8lR/NA1mtDVtnh4r3BayPV7EvRnP4OuSGYpRFEdFSMuQXX++9n1C3xNLa
 KrTZbTcGHLTtT10bLAtoxFj3nqqoyibxaA+kpvDT3y2dQD5bL+t29ymbsFv8NeTeNb+Xcqfn6iK
 DLWwcsdfCuel81ZefA/PeTfmqkI2ZVt1rmb+i28k4FdM1m2u5Kp3+hJIe/4yNIcdyCe82XTf17z
 D2TaF/zNdYcUT15ShGIZpvfnMg1KXwPZQNiQ2trIy8HZUtwiZdmEUPmI/FvfIOp2EGhm3c3Afgr
 TS/d+WZZQpHsuVWf1lswslrbT7kdHQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dbd8c4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wCY2apRfTzfgVPxwIycA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_061901_947701_601C67F2 
X-CRM114-Status: GOOD (  17.85  )
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



On 9/30/2025 9:09 PM, Ripan Deuri wrote:
> The primary purpose of the patches in this series is modularization of
> object structures along with their allocation and initialization APIs.
> 
> Patches in this series are made to achieve the following:
> 1. Modularization of device object to have a separate DP object in order
>    to support chipsets of different hardware architectures
> 2. Refactor hardware group and vif structures to optimize data
>    path operations for future extensions
> 3. Add framework to support architecture specific interrupt handling and
>    ieee80211_ops registration
> 
> These changes are intended to provide a base framework for the data path,
> allowing the data path to remain flexible for future extensions in Next
> Generation driver development.
> ---
> Changes in v4:
>      - Use ath12k_dp_vif_to_dp_link_vif() in patch 6/6
> Changes in v3:
>      - Use dp arch ops to invoke arch specific service srng handler
> Changes in v2:
>      - Invoke ext irq setup/cleanup from dp device alloc/free to fix
>      suspend and resume call trace for wcn7850 in patch 5/6
> ---
> Harsh Kumar Bijlani (1):
>   wifi: ath12k: Refactor ath12k_vif structure
> 
> Ripan Deuri (5):
>   wifi: ath12k: Convert ath12k_dp member in ath12k_base to pointer
>   wifi: ath12k: Support arch-specific DP device allocation
>   wifi: ath12k: Rearrange DP fields in ath12k_hw_group struct
>   wifi: ath12k: Add framework for hardware specific ieee80211_ops
>     registration
>   wifi: ath12k: Add framework for hardware specific DP interrupt handler
> 
>  drivers/net/wireless/ath/ath12k/ahb.c         |  22 +-
>  drivers/net/wireless/ath/ath12k/ahb.h         |   4 +-
>  drivers/net/wireless/ath/ath12k/cmn_defs.h    |  19 +
>  drivers/net/wireless/ath/ath12k/core.c        |  19 +-
>  drivers/net/wireless/ath/ath12k/core.h        |  39 +-
>  drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +-
>  drivers/net/wireless/ath/ath12k/debugfs_sta.c |   3 +-
>  drivers/net/wireless/ath/ath12k/dp.c          | 145 +++++---
>  drivers/net/wireless/ath/ath12k/dp.h          |  32 +-
>  drivers/net/wireless/ath/ath12k/dp_cmn.h      |  50 +++
>  drivers/net/wireless/ath/ath12k/dp_htt.c      |  22 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c      |  15 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
>  drivers/net/wireless/ath/ath12k/mac.c         | 339 +++++++++---------
>  drivers/net/wireless/ath/ath12k/mac.h         | 131 ++++++-
>  drivers/net/wireless/ath/ath12k/pci.c         |  23 +-
>  drivers/net/wireless/ath/ath12k/pci.h         |   4 +-
>  drivers/net/wireless/ath/ath12k/peer.c        |  10 +-
>  drivers/net/wireless/ath/ath12k/testmode.c    |   3 +-
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |   4 +
>  drivers/net/wireless/ath/ath12k/wifi7/core.c  |  24 ++
>  drivers/net/wireless/ath/ath12k/wifi7/core.h  |  11 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  40 ++-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.h    |   9 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  88 +++--
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  29 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  62 ++++
>  drivers/net/wireless/ath/ath12k/wifi7/pci.c   |   4 +
>  drivers/net/wireless/ath/ath12k/wmi.c         |   5 +-
>  drivers/net/wireless/ath/ath12k/wmi.h         |   5 +-
>  drivers/net/wireless/ath/ath12k/wow.c         |   5 +-
>  31 files changed, 849 insertions(+), 340 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/cmn_defs.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_cmn.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.h
> 
> 
> base-commit: 972f34d54015a4a16aa9e6a081bafabb6f9bf95c

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



