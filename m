Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696B6CA0FF0
	for <ath12k@archiver.kernel.org>; Mon,  1 Sep 2025 05:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8+Z495oqBiTc0wahdk/+1xEayYUpFgX1Ia0/rITxCs=; b=i7dSEmBQeTFE3swW2esIazVnCK
	Tvphm8AHybrJkuUAjSJ//4gfKeUbNaQvBq1b30DkKdJwLHW6IPVh8YVM5jbNrUTwbSF+Pv1R2S2ey
	PgpeEBDwgkUucHLU8upZOTvbpuVrDSSlIv71w+dXeIuEigOU8zIOZ2KysWV4kc60Il/OrvgkxCVwH
	LH3+tgUPjT65yyu5MTXpylZORao2QNz6GNhdNMdIsYRTZ3aNh6NBbdSuoNCJClbGC6iWAtk6WTPyQ
	Vq6vYCT1hGDM0SFPFrYTGM/3aRUkxkRPbM0o78nPAbPBVnYCObJD1Q7GylPu7Z+7+5PFM53oyeuYv
	fb+3ApBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usx12-0000000BCv2-0gzH;
	Mon, 01 Sep 2025 05:23:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usx0z-0000000BCsd-1YJo
	for ath12k@lists.infradead.org;
	Mon, 01 Sep 2025 05:23:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VNkW2O015427
	for <ath12k@lists.infradead.org>; Mon, 1 Sep 2025 05:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8+Z495oqBiTc0wahdk/+1xEayYUpFgX1Ia0/rITxCs=; b=Sri48Gr/w1fAmofn
	im4LEkItz4YhbEVjurO3074Spcsu/N0KcJubhmBq30CE4XLbl8dmUjfuXNsR8W9i
	zg2U1NVGwQ/fktCy+znqTA8VsOQtqubqioRPj9kdb3vFro6KES77AF4DmEUYHNJJ
	jOi0dIK/hz96pv+he3cjxe9GwrMUeYyS+Yju5DLe+kzrdfajqSUD9NjzuydS3okw
	K9OVR3dEGZIV4ytG9K41rjIStU6wKReukhxqx4O3Erl3ZpbXaUhNmPA7maJtwLnM
	lHVz/6/pgpqKg5va61jDbfi5iFRLJDAN4l1/6nkW9rDT4VRRCfmebgVCOP9e5ovW
	tDjodQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp3h9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Sep 2025 05:23:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7725c995dd0so423835b3a.3
        for <ath12k@lists.infradead.org>; Sun, 31 Aug 2025 22:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756704213; x=1757309013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8+Z495oqBiTc0wahdk/+1xEayYUpFgX1Ia0/rITxCs=;
        b=B0Ea3NW7UQkG9sM/aMUtnY4Yxw3GI+yyNFDnUXuk46djE8i52E3D0xqpXMAvf0PiyG
         NJM9nsCghwD2ZHp2WwGpcDt93VDAlcoYLxLbb4TU5KHVeAGao0SPAgaA9HG3+M+QL91D
         u+EH1/YZyzA4mP1KgaBOptC3dEHwt8yNjhuZ/3lexOmKp6+Pm6GxvismRSnbJ+mPZaZS
         PezcrpndEeoAFMrseJsfJvXCrYcd3f0JFYW1683RuaqxkUzFpZ8RJ8QVo7hi0Z2rvhpu
         rh58TJUrUyFPPSJUB2TcTRXtgFzsE8evmZTFvC11afulU92EbaS5Yjx89ocfkxOPZ4lg
         BjPw==
X-Forwarded-Encrypted: i=1; AJvYcCVXOHJ8kjNIMFha5OVRdk8H8/cXMcJWzqu5NW63fcxxeea6cK5Ytg+cHtMhXV5ck5j/Dnsy+oM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9/lImkX8T0A1IatWvSTAxjJcjBf726aQCqdEuuRIplB5OKhXP
	X8ZTu8BvdfIgP2rGAwhUfdOrzwHSFDBKa02yY+cBI2XHg3pjD5iGeTwAzMPNwjJiBmFdBw6c+/X
	ljnTjrj5tdxpaPFLNdfYLgDbvR8DaPZTRWRt7hVKHw0nG6xCS5gbIEf4+Seym0g9BCO5VVzFF2A
	M=
X-Gm-Gg: ASbGncu4SNbNRlDNW8XrjF3sbevQcqLaJ659MPx15TSaQkIb82JX41Ha9Jli6qOMu+T
	cSFZtdA2WGde+kn4UXNSTLLMbxe5rlAEwyMs/SrhWmSNbH/vhQQxWFhtMV8H0CvIow+ZAs5QvY1
	Tn9bSaf0C760+RBtbkj+WHqGGSMNhAnIjQxLLiSz/oHr28wPVbrAXuO5aDeYvN+f5xonUnnfoJT
	fkz963WwqUPASuwhyxWiAWYKhVf7JDLEBqeUPna+g1bGW70Vw+bQMOWZxqqKp/0GyYi0I2yOOL5
	3WYtkz6AfJPUVPziMtgb2EdBte1hxbKDuT8Ib/mMwG7ulSZ3P6lEKdydVvXxNFB5UgXhAfeLBzr
	J/pyRrN88EyWfBgkgrvI4xqiRezBV3C+Xdra9Jg==
X-Received: by 2002:a05:6a00:1406:b0:772:57ee:fd6c with SMTP id d2e1a72fcca58-77257ef02e5mr3467865b3a.2.1756704213351;
        Sun, 31 Aug 2025 22:23:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHis1QZo4o4wxpJY/7XCl0AFcl2fPXRBXZrV34INgUuVjLDwLlJrPnENWnG6e/8wwGlPN1zPA==
X-Received: by 2002:a05:6a00:1406:b0:772:57ee:fd6c with SMTP id d2e1a72fcca58-77257ef02e5mr3467840b3a.2.1756704212872;
        Sun, 31 Aug 2025 22:23:32 -0700 (PDT)
Received: from [10.133.33.244] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a1b9sm9175124b3a.7.2025.08.31.22.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 22:23:32 -0700 (PDT)
Message-ID: <786b9049-3542-4447-9263-a51c7074d8c5@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 13:23:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng 00/20] wifi: ath12k: ath12k file re-organization
To: Ripan Deuri <quic_rdeuri@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3k2QJSd068vKetQrkx8YY6UaQkSzh1Lt
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b52dd6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=oTiaGnL0ubTkpw5IOr4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3k2QJSd068vKetQrkx8YY6UaQkSzh1Lt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX3UjOgHhGAgkV
 9WRIbaSTp5ZgO0Jr6moEB1WIcXdno2eiD/x91sy208KavaYTSMYk02gjjBXKX6Y71VCJtAMHoP3
 FX1mPCL7FkemhKidqILUiH2JM1panOAvl5UM+SsBBfipxNpACICOE1olpbX7Y3ybuvK0//XS/P2
 fqCLZIx+DTaY79bHDeM0PYUN7nytu7gcNS/4gW8ZPdHxKtpUtnXVG+pMYWm+VQSqSBSyB3wvJTL
 pEnWUMib5qPAw8ySD0lX1hzI6Nhu/xD2NbXnhFBUcFUDxMdYJtCoRLU3tKliy2CPIjLIW3oe5VQ
 AKjpcnY3YnHdd8qglJnJBuXrPXCw/N/vLyVVN01XnBg8yI6F/D87KOF8SrRR+0ye+zXObXKmgB+
 /3KP53k8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_222337_533047_8EC10AAE 
X-CRM114-Status: GOOD (  18.35  )
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



On 8/29/2025 1:35 AM, Ripan Deuri wrote:
> This patch series continues the modularization work described in the
> https://lore.kernel.org/linux-wireless/20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com
> ("wifi: ath12k: Ath12k modularization changes") series, which established
> the foundation for the Next Generation (NG) ath12k driver framework.
> That series introduced the foundational split of the original ath12k.ko
> into two distinct modules: a common module (ath12k.ko) and an architecture-
> specific module (ath12k_wifi7.ko) for Wi-Fi 7 devices as depicted below.
> 
>                                      +-----------------+
>                                      |                 |
>                                      |   ath12k.ko     |
>                                      |    (common)     |
>    +---------------+                 |                 |
>    |               |                 +-----------------+
>    |   ath12k.ko   |  ===========>
>    |               |                 +------------------+
>    +---------------+                 |                  |
>                                      | ath12k_wifi7.ko  |
>                                      | (wifi7 family)   |
>                                      |                  |
>                                      +------------------+
> 
> Building on that framework, this series focuses on modularizing the Data Path
> (DP) of the ath12k driver, allowing the common DP to be reused across different
> hardware architectures.
> 
> The patches included here support the NG framework objective by reorganizing
> DP-specific files and the directory structure as outlined below.
> 
> Existing file org             New file org
> -----------------             ------------
> ├── dp.c                  ├── dp.c
> ├── dp.h                  ├── dp.h
> ├── dp_rx.c               ├── dp_htt.c
> ├── dp_rx.h               ├── dp_htt.h
> ├── dp_tx.c               ├── dp_rx.c
> ├── dp_tx.h               ├── dp_rx.h
> ├── hal.c                 ├── dp_tx.c
> ├── hal_desc.h            ├── dp_tx.h
> ├── hal.h                 ├── hal.c
> ├── hal_rx.c              ├── hal.h
> ├── hal_rx.h              ├── wifi7
> ├── hal_tx.c              │   ├── dp.c
> ├── hal_tx.h              │   ├── dp_rx.c
>                           │   ├── dp_rx.h
>                           │   ├── dp_tx.c
>                           │   ├── dp_tx.h
>                           │   ├── hal_desc.h
>                           │   ├── hal_qcn9274.c
>                           │   ├── hal_qcn9274.h
>                           │   ├── hal_rx.c
>                           │   ├── hal_rx.h
>                           │   ├── hal_tx.c
>                           │   ├── hal_tx.h
>                           │   ├── hal_wcn7850.c
>                           │   ├── hal_wcn7850.h
>                           │   ├── rx_desc.h
> 
> 
> Note: While common files are not intended to include architecture-specific
> headers, a few Wi-Fi 7 headers are temporarily included in common files
> across patches to simplify patch splitting. This will be resolved in a
> later series.
> 
> ---
> Harsh Kumar Bijlani (4):
>   wifi: ath12k: Move HTT code in dp.h to newly introduced files
>   wifi: ath12k: Move HTT Rx specific code to newly introduced files
>   wifi: ath12k: Move HTT Tx specific code to newly introduced files
>   wifi: ath12k: Move HTT specific code from dp.c to newly introduced
>     files
> 
> Pavankumar Nandeshwar (16):
>   wifi: ath12k: Move hal_tx and hal_rx to wifi7 directory
>   wifi: ath12k: Move hal_tx.h file to wifi7 directory
>   wifi: ath12k: Move hal_rx.h file to wifi7 directory
>   wifi: ath12k: Move HAL Rx wrapper APIs to dp_rx.h
>   wifi: ath12k: Move Rx error related functions to wifi7 directory
>   wifi: ath12k: Move hal_desc.h file to wifi7 directory
>   wifi: ath12k: Move rx_desc.h file to wifi7 directory
>   wifi: ath12k: Move rxdma ring config functions to wifi7 directory
>   wifi: ath12k: Move rx error and defrag functions to wifi7 directory
>   wifi: ath12k: Move regular msdu processing functions to wifi7
>     directory
>   wifi: ath12k: Move srng processing to wifi7 directory
>   wifi: ath12k: Separate arch specific part of RX APIs
>   wifi: ath12k: Move arch specific REO functions to wifi7 directory
>   wifi: ath12k: Move arch specific rx tid and related functions to wifi7
>     directory
>   wifi: ath12k: Move arch specific tx APIs to wifi7 directory
>   wifi: ath12k: Move ath12k_dp_tx and related APIs to wifi7 directory
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |    9 +-
>  drivers/net/wireless/ath/ath12k/ahb.c         |    3 +-
>  drivers/net/wireless/ath/ath12k/core.h        |    4 +-
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   |    4 +-
>  drivers/net/wireless/ath/ath12k/dp.c          |  159 +-
>  drivers/net/wireless/ath/ath12k/dp.h          | 1518 +-------
>  drivers/net/wireless/ath/ath12k/dp_htt.c      | 1354 ++++++++
>  drivers/net/wireless/ath/ath12k/dp_htt.h      | 1546 +++++++++
>  drivers/net/wireless/ath/ath12k/dp_mon.c      |    4 +-
>  drivers/net/wireless/ath/ath12k/dp_rx.c       | 3056 +----------------
>  drivers/net/wireless/ath/ath12k/dp_rx.h       |  297 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c       | 1609 +--------
>  drivers/net/wireless/ath/ath12k/dp_tx.h       |   41 +-
>  drivers/net/wireless/ath/ath12k/hal.c         |    8 +-
>  drivers/net/wireless/ath/ath12k/hal.h         |  501 ++-
>  drivers/net/wireless/ath/ath12k/mac.c         |    3 +-
>  drivers/net/wireless/ath/ath12k/pci.c         |    3 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  137 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp.h    |   15 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 2043 +++++++++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   47 +
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  908 +++++
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h |   14 +
>  .../ath/ath12k/{ => wifi7}/hal_desc.h         |  149 +-
>  .../wireless/ath/ath12k/{ => wifi7}/hal_rx.c  |    8 +-
>  .../wireless/ath/ath12k/{ => wifi7}/hal_rx.h  |  299 +-
>  .../ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} |   48 +-
>  .../wireless/ath/ath12k/{ => wifi7}/hal_tx.c  |    6 +-
>  .../wireless/ath/ath12k/{ => wifi7}/hal_tx.h  |   11 +-
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c    |    4 +-
>  30 files changed, 6993 insertions(+), 6815 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_htt.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/dp_htt.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h
>  rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_desc.h (95%)
>  rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.c (99%)
>  rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.h (83%)
>  rename drivers/net/wireless/ath/ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} (97%)
>  rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.c (97%)
>  rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.h (96%)
> 
> 
> base-commit: 0e487f03c6e5d8dd5b076b8b061e50e736ab2196

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



