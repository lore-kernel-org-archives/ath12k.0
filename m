Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A38C369DC
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pr+d6CwD8HQZBx/B4m+j0zeceAIo24NP3c7VO2pv9BY=; b=cGVPFbqux6y8ybigEJptPy2Lfg
	lTfAcU1zdCqq1CYQcUbFS2pp29VsLouxyJR3rRqyNETerzngs2J+ug4q/kAdVTsNrIc8iVtuuY71z
	+nHQ2+jpk87DUTRMguXDPpoUvUIgJpRJ8FWlxlRqLOKvYkRolc19y2zU/DnwcDprV6sxXvSITkERG
	gKJgZTmmyGhuD+pR0gHGmwEot+KDhOpx5hEUPogPHig+iadD5gZ6mKlKkTrwlQXuv7yxvpscRk20W
	Jsd2d/+BRv7sw8/avGBeqtqQ0mCJaYTqbOdd6UhWzOE1GKwKjGgroTsdqNYEIbeMJVJrkeXpNuHPG
	KWpjHLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rnk-000000070Cs-2Qki;
	Mon, 28 Apr 2025 16:57:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rj6-00000006zUg-308i
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 16:53:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9WmdA009160
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pr+d6CwD8HQZBx/B4m+j0zeceAIo24NP3c7VO2pv9BY=; b=g8xmjBUABdUIIN76
	b9U2jDsI3u0RhU2IQqm1h8WdK5e2wllL38zToodCihhBHtp698U9SZxDKVyVNjIZ
	cH1MmT/CUI8CMHMk/Dh5KveXBeOeQ+AgWA1St9hfsdxBolfkTmm5ysz4Q5suP7fD
	9QYlYFxgvaQGbRp1p+rhJb7JjLwkL6znnJXUpJB8WPVH78kwD4PCxh3B9bKtgHbc
	6BOZORDDwPnnsb6lsg81FlViVUK+7Q/deziIkheREVIC3AsyZVbuc+SEjGwRpudq
	j+WSxzh+KFy83Ro9HWIMLV9KQ52jEInxbwiMOfyXjOquJu1776rfDeGdZzkZyLXG
	txvJyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb8s5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 16:53:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2241e7e3addso43461545ad.1
        for <ath12k@lists.infradead.org>; Mon, 28 Apr 2025 09:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859183; x=1746463983;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pr+d6CwD8HQZBx/B4m+j0zeceAIo24NP3c7VO2pv9BY=;
        b=ZcW3tLh3brwf0BNbxAzfFbWeKI9HCovcJItwE0z2uo73TvPr0VaHsd2nHiH53HgjMn
         jD8PnPiM4HzmlepNJUpn6XKNaHSf1AQuEuebXSBQ/XVgVvpQ5pvFxWTyLLHq+b9hg+YE
         X/5tnX/b/v3ui6pni5iOaaKsXczd9JGRgDgHLmacz70DiYbCarNUjt1E3ZMxmCjwxPUE
         qOxyynqbYR82uQsUqmWgOrSaNaa4PVBIFq1EVkr1/1ViscK3JZeU+N4Tf4blmBuMshx7
         +ssA8CpmQjerX880F8ZrRGzZV3tsWYAGEPWKFPAgDjjzPJlL/ebE8u/X799ijhT+gyCr
         y8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR3UGPehnX0j7ZzGEW3MibY1hL7XHCe52t2EPi6R0TeKvobiqimT3kqfUL4VqPSxWpDWH5JvU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yza3eX958XfoSd1nxrZs5/7wT0IOomZ5otm7TciOyx6G+b6+J14
	r9agks8BaJunQFrNnwy9ROtI+4zHgnJO39g2AWRzzYjSQ4gaRaYr/ZUuRkR6DXeOAnJWzLsiOTa
	5VmSJvvj/2fSzV7JAcLtRSoKgjO8uil81mhVlzoktCGwGZUFx1WPr0LIPN2dU
X-Gm-Gg: ASbGncteD69e8hN+CtA0Ih5XYiEFpu6n2maWkb1XbfmpNaRo6R876olPvPgJF3orOSb
	Q3f1EMpyI7VvIeLp7VNWW3sxOHjNqYpyO6bR+USA1KAscQVhVIX9nZYIGGQ4aVSsn9NsGZXgIiT
	qnDnq25k0nTX7DTD3X6prn0VQjjovuMR801g4DitETKF9ggYKFCh3bvwtqSrBkY78HsUN5kv397
	KbY5XPKVi8WF1KRnK08OUo8XauicjSK9xqlwQr96CG1k1z+iwcqjd4a3qI2l1HqBsRNtXsDESUM
	a8qBD9YYP2xkVfueHusS/X/KPje3jVXZNyC8hvGjW1p8BchfpekrpLqYX6HY
X-Received: by 2002:a17:90b:38d0:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-30a220b36c9mr48810a91.7.1745859183080;
        Mon, 28 Apr 2025 09:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH++KIcOD1fN+XXpeIyd81eig/UfWeeBlwthCVUH+4tnndpjeSWe1VcTub7CddBvPYhJk1XoA==
X-Received: by 2002:a17:90b:38d0:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-30a220b36c9mr48773a91.7.1745859182628;
        Mon, 28 Apr 2025 09:53:02 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.192.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77641eesm7423164a91.25.2025.04.28.09.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:53:02 -0700 (PDT)
Message-ID: <cd38bb89-7d17-4bf0-8b88-459be675d758@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 22:22:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 00/13] wifi: ath12k: add monitor mode support for
 WCN7850
Content-Language: en-US
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNyBTYWx0ZWRfX5+FL9TGsBOUl +l7Nvj62SbpixOfUd3aO5ExOsodxSli2mnFcLS9lzlOlzDQaaoHzcxwk+xt3L9WTQJyhzStpjHR BFtJ+QYNIrhO6BV09xa6/RvctTTIOA8/TGIdW5KgiugFXZYr1Drru+96iF43v9rhPHhdMNpQgf7
 JPPyavF82Gb5r448ozX7XaC8ENOU42qwYs5fF+cXIdZBVKL/H/C2VzeFcVTCyT1pA08g5Ec7tax o5SqobYbxRrJy2eJ2Ktgd4ToXE5nGVlNIXmnnzEJapZpAbFps0re0JVDCM8NljjB1Elecymxrqf NfNFc75LIYEUGxyO+3d/tkXeXIIWZDwXsxLWtRSq5sHJWhDJXLRSBUicruRmDfI/2/5zYuU9C5t
 DgLbMDoUwk2j3UMpXxvt3Lx6Xt9sQryys2VhbOi3zpQPLsWaPIshEYxJ/CL863QwP9U10gsL
X-Proofpoint-GUID: JirP67XUqqnRInEjaKRkL0YpjGcMdaeb
X-Proofpoint-ORIG-GUID: JirP67XUqqnRInEjaKRkL0YpjGcMdaeb
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680fb270 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=XJI/iaC0GbrNbCf3OOiYRw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P8mnIQ7AJwXJk1S5SOoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_095304_765800_5ED928C1 
X-CRM114-Status: GOOD (  11.09  )
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



On 4/21/2025 8:04 AM, Kang Yang wrote:
> Currently, monitor mode is not support on WCN7850. Thus add ring
> configuration, interrupt configuration and ring process function to
> support it.
> 
> Kang Yang (13):
>    wifi: ath12k: parse msdu_end tlv in
>      ath12k_dp_mon_rx_parse_status_tlv()
>    wifi: ath12k: avoid call ath12k_dp_mon_parse_rx_dest_tlv() for WCN7850
>    wifi: ath12k: add srng config template for mon status ring
>    wifi: ath12k: add ring config for monitor mode on WCN7850
>    wifi: ath12k: add interrupt configuration for mon status ring
>    wifi: ath12k: add monitor mode handler by monitor status ring
>      interrupt
>    wifi: ath12k: add support to reap and process monitor status ring
>    wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
>    wifi: ath12k: use ath12k_buffer_addr in
>      ath12k_dp_rx_link_desc_return()
>    wifi: ath12k: add support to reap and process mon dest ring
>    wifi: ath12k: init monitor parameters for WCN7850
>    wifi: ath12k: use different packet offset for WCN7850
>    wifi: ath12k: enable monitor mode for WCN7850
> 
>   drivers/net/wireless/ath/ath12k/dp.c       |  28 +-
>   drivers/net/wireless/ath/ath12k/dp.h       |  23 +
>   drivers/net/wireless/ath/ath12k/dp_mon.c   | 816 +++++++++++++++++++--
>   drivers/net/wireless/ath/ath12k/dp_mon.h   |   3 +
>   drivers/net/wireless/ath/ath12k/dp_rx.c    | 122 ++-
>   drivers/net/wireless/ath/ath12k/dp_rx.h    |  10 +-
>   drivers/net/wireless/ath/ath12k/dp_tx.c    |  38 +
>   drivers/net/wireless/ath/ath12k/hal.c      |  38 +-
>   drivers/net/wireless/ath/ath12k/hal.h      |   4 +
>   drivers/net/wireless/ath/ath12k/hal_desc.h |   2 +-
>   drivers/net/wireless/ath/ath12k/hal_rx.c   |  96 ++-
>   drivers/net/wireless/ath/ath12k/hal_rx.h   |  12 +-
>   drivers/net/wireless/ath/ath12k/hw.c       |  12 +-
>   drivers/net/wireless/ath/ath12k/hw.h       |   1 +
>   drivers/net/wireless/ath/ath12k/pci.c      |   3 +-
>   15 files changed, 1127 insertions(+), 81 deletions(-)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

