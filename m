Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80ADCAC5B9
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 03:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmE+a6SIgfWrhaIW24BFA+Kyx86nWQNX287UT648S94=; b=YkPPmLzQBxI6cKjD/OSr53CE/7
	VKwWPncniIw0lD8GnLO4I3ZQmUwU387DVP2qsaBP+XmGcGdNTCueB/d+ZAHpvJxy4eZhUeh+9G14G
	QxtXNaBtdf4I7cM59gss6SBBKCWd+g/Na1AUo2DrOv8z6Ho+puilqcVlVb4EA7fc9fe2MncMwcA+p
	J9gCqZ0VvR+qXeLiitWS4Qe01BKE2Ioz2uj/Vg/UANC6R+XfJw8T1gLdVsxhYVKinOtwqrCesNgO8
	IiUCazioad+w6C8dIhDPLZQ3h7WsyDgJ9T+Rtw2sEM0nAWVxATox+o/Ft5AOz3ViBFdvyyJhgXbjP
	RawZC+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3R5i-000000041pn-2cAd;
	Tue, 30 Sep 2025 03:31:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3R5g-000000041pF-04QL
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 03:31:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TGej3r029434
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 03:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmE+a6SIgfWrhaIW24BFA+Kyx86nWQNX287UT648S94=; b=EynkdRfeAFsOV/cq
	YYj9vROGu2DqvojSHzGjx4fw0J4+ebceiXvQC0PyhZe9Dc1GYhV/aYktnM5qEkgW
	WInzxj/f38K+DqJ8gmcWpDitU/UKEpvg0ZHBNUua1so5d9tyd0hXlroA34tKDGEd
	BEYykA1Dl15fBzR0RhENBTO9wgSavUUMxao52p39Y6tWffH7KkUe6/EXt67tgaaG
	YdUnlJeiHEQEG5YjT802PDXZ1b2jC7gTEY21AyVB7kJtazpmqtbXNxZ9oRam1EB7
	BkSNbeZyaMqFbABfA4276uvQjKk3Ahh5lNoet4K7TMc6zV+dzrwkRK84DqrTyULy
	g958ig==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr2ydr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 03:31:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso9785008b3a.0
        for <ath12k@lists.infradead.org>; Mon, 29 Sep 2025 20:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759203106; x=1759807906;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmE+a6SIgfWrhaIW24BFA+Kyx86nWQNX287UT648S94=;
        b=Wh5DWuxRpDn1opedE1+1AR2HvFMYOL7moTNQwq7UsqvKKcggGPei3z07gVBQT2+6q3
         GPTkwKQrPUuYj7iRg+9Fy11f0ocxjN7ulmuOtrLvdnL1r0JsxvouDXrNxd/vLQ+hMJHz
         nukwk5LyFGzqYowYoDGlYEXx/YcxQlI/EwHlo0tQwwyJxtt52fHjRkgS36m1cMlMHwRF
         ywtNJHLr9I87F0wvRH042BbuzRfWGpLDyZShveMaSkREdHmGQwy5nbdHZIxjKwTh5K0c
         Z78Dq8NQunrPzQua4eEp9LA+G7RaJnyHKfKi0hkKkljqAYFDv5zLgxzGLjqbqHO6fy8H
         olgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsgAEZNyoLxdsU3LhM6lHyUfkJI1EXr0Y3gOnAzvrAdV3F9fK2tNcU3HAkTOPg5t90IqUOm2g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7nWFHm+MINF0e3iPK5AQaVFhfrnLPKmBFhkdYZoRhBRH2tMOn
	XyknyDrvZ3WjpJVvx/w1ybZEoT6ey8zZlppnramg0CQiUTa/qgQlnIOKsFM54x0MMTkL77Vs3DU
	HbImEynmAdWIHq/YY6cdcNEfm9cG+fEMIDFPf8G2D6Ud61fxQuzK5DiNF/pmh6isa
X-Gm-Gg: ASbGnctzJ+83IGBjqJVKu9ZQ2/6VJ2IzSUvc0IZHUZTX0rOytcZuJZIsbs2cMnuPaxu
	reRGTeTYa6q3U6AcmxScO56dIM4w5sRGsjeu5GX0LRhKA5lu9qx3BmmKVwurOlGG0bQY/FTOP1M
	eUluacsFcsXNk/TBJOK8n72rPhVpIzSyxjoOGQa9q+jlMbLoEQUQRodAW1f46FSnzPoMQe8zsXE
	pPbIhzejJf9US5oJJULNVTTS/dnOcXqtfKOZb5LrWspxPPW4c7XyT3Uq3VE8VFjhABVNLbuDzFP
	oGxoodrki+md3xZ/LzKnCazBW/tE7nLnsdrLZUbP0S35gqVirp4swYMbvL7u9v4K3Z7fRVWT6+c
	huYMaDOfCT52S3Pm90aCt/1guuY7Fdg/sdv7pNo+58yw=
X-Received: by 2002:a05:6a20:7349:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-2e7d83ba73amr26327942637.42.1759203105843;
        Mon, 29 Sep 2025 20:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmgl+4ufBZ/rhJt7kCTlkjU/DMZ+0QNPC78B8rvyxOUDkGwC8PYNFlfGleUuhg2bFvb/+nqA==
X-Received: by 2002:a05:6a20:7349:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-2e7d83ba73amr26327905637.42.1759203105431;
        Mon, 29 Sep 2025 20:31:45 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53babe8sm12704442a12.6.2025.09.29.20.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 20:31:45 -0700 (PDT)
Message-ID: <4f48debc-7910-4160-90c9-cbda2fe8e66a@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:31:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng v3 0/6] wifi: ath12k: Modularization of objects
 for Next Generation Driver
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250929115102.512719-1-quic_rdeuri@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250929115102.512719-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX+AqgyVjEnhaE
 FCr6PX7LuziTf2Sx6MSJE5/k47QetlawdVKyDvVrLLBN5hEtXjxLXXyKcmYhqomQ+K5VrnXP9T4
 iCOLbx0q497rGqXnZK1A/aSUf/RmV8mJ9fwp8Op5ml8inRMFk1d5cNV15FEwSdbea/tqu0pWI8h
 5V42Ocpl7P9emXZ0FxrMEoyV3r3H6nEjdC+/fF/g/Sp6Q6K8kGT2xwath3U14mVeaX6Td283ONc
 0BVwVxWYmEN3a1+rC1Gqe+8j7IrAsxtg0JUET4GW7kEzW5I5zyIqeKxzncB0ukMePLjl2jfjYVX
 HRlcg5uiH5wvaF14XCahdgeDsZGUNi1eBGOHymPwhMPhbgDklHRs2Bdv9eOtPHDxBx2p44qVSvZ
 CoWcbn9HPrlOlb/kIrRhHP/zpNqWQQ==
X-Proofpoint-ORIG-GUID: QKzEeib0zoU8IEW8qvZ5_P1T5I0RzzFH
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68db4f23 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wCY2apRfTzfgVPxwIycA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: QKzEeib0zoU8IEW8qvZ5_P1T5I0RzzFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_203148_180058_5B6770D5 
X-CRM114-Status: GOOD (  18.67  )
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



On 9/29/2025 7:50 PM, Ripan Deuri wrote:
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
>  drivers/net/wireless/ath/ath12k/dp.c          | 143 +++++---
>  drivers/net/wireless/ath/ath12k/dp.h          |  32 +-
>  drivers/net/wireless/ath/ath12k/dp_cmn.h      |  50 +++
>  drivers/net/wireless/ath/ath12k/dp_htt.c      |  22 +-
>  drivers/net/wireless/ath/ath12k/dp_mon.c      |  15 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
>  drivers/net/wireless/ath/ath12k/mac.c         | 339 +++++++++---------
>  drivers/net/wireless/ath/ath12k/mac.h         | 131 ++++++-
>  drivers/net/wireless/ath/ath12k/pci.c         |  23 +-
>  drivers/net/wireless/ath/ath12k/pci.h         |   4 +-
>  drivers/net/wireless/ath/ath12k/peer.c        |   8 +-
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
>  31 files changed, 845 insertions(+), 340 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/cmn_defs.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_cmn.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.h
> 
> 
> base-commit: 972f34d54015a4a16aa9e6a081bafabb6f9bf95c

with the two nits in patch 6/6 addressed ...

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



