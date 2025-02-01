Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B634C0218F
	for <ath12k@archiver.kernel.org>; Sat,  1 Feb 2025 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/m04xN808cRZHBo6SrtoBJ89jdzWCq8bSyEuXud4NM=; b=ieKGuxInygCL9aa5F3JxQqsSTs
	iQKDGFes8rW9ev0j4WOl6T9iu7pSdh6BEBLi/SUFbcUmCW9nl24NaEk8KuvBQ5+UInUVqhnSk6IOb
	1MlcfBYo5mYv5I61zE4QVDdgJAXTD4fmPJ1SnLvtEjR5bR0QatnB78hbTs1wkNOc6aZCFgx5MkJtB
	VrJfRBGDSz1EUkJ1F7zMSjaKqoLiLR54VNYZjV2DKtnTEU0Bmu5wxYZPy21gweUfC6cP1Tt0sPksl
	FrhHR5sTaN6C9ye8jBBk/ueouHxASxtIZNTuFJGoOFx+Vx/fcomGJk2XgUoeSP8Z7XEtCq2+tKaFC
	lJplTzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te21t-0000000BikM-1EYD
	for ath12k@archiver.kernel.org;
	Sat, 01 Feb 2025 01:10:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te21r-0000000Bik2-0Jrq
	for ath12k@lists.infradead.org;
	Sat, 01 Feb 2025 01:10:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VLs2xE021810
	for <ath12k@lists.infradead.org>; Sat, 1 Feb 2025 01:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/m04xN808cRZHBo6SrtoBJ89jdzWCq8bSyEuXud4NM=; b=PCATuRhr38qDVTUV
	A1Kndd/HpXhdcvSrdx91qp79vh+Q5zRSYDsqNCcFFGEeyxH7iHTGXyQ6JN4pBYfY
	n5jmxY1gQ37AE26Jb/GZ7UKCOaZNwLni3Ksgf+bVa8s+MxnMN8LNnLVsJJESRpux
	fpG6zD8Ia/tItJ7VQyP2ya55yNuyO0rwMxr8hejZoaD1Tk27XYmNi/+2ymGPWeUu
	lF41bQokf8wH5TxDyuQ+mWM7fRb7qWX28d8WjsZwRXXODYHbxyVB1kBnaECavN8p
	gDsGLxnHsKFV3B6l7Z2Y2Zru+lhMNfQbrpS3EwmgBUUJ41XW+a2JuJhX1cI51bH0
	8+4aeg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44h6u7080w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Feb 2025 01:10:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso4912746a91.3
        for <ath12k@lists.infradead.org>; Fri, 31 Jan 2025 17:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738372232; x=1738977032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/m04xN808cRZHBo6SrtoBJ89jdzWCq8bSyEuXud4NM=;
        b=X39meffyxhSe1PJC0yY7m8bqNvvF0Hyuew0QVjXdNQseJjZZjbRAn9F59LYSi1stQn
         Z3Pwzp+TBGuQdz1lqseHDvAfuPAoOHk4WY4ZGeYtp2BoOTq8XtyhBJOp2TK2GJet10Mc
         DbJo1MBf5QMcDpd7NvioVhq1L2tNfXckKvKxGGC5mkcalkVzleaajXKawr+STFwyZp4a
         yjxrf1sG2GMsI867r0Ww7YSxhMLteqgIHHHjVz7VdDP68PfJm9wrIvTqf/tn5PKz2crF
         ZOFAYks5Qbz/ERycoalM9jpnQuLDF0A1xm8NQt929pKQilJkeyA01XdS+E6Rs/ZVYg7a
         O3AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsLhe/Mhip0GDAzvQSK0gySSJJjgPKY5YMoPqSJqwsWHrvjsGdgxUNjslOFbiIMTrYIrRDACw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9VL2MBbtQUKz469Jdt++h7jwyGJ6sAHduVqvtLGZjDbXhgpcn
	mmx+r5be5O8z5507LF2d/oaPmx3e1pdhiF0mLEe/QtUEnTRA5YP3LeQVEo2qhhaIbXV5s9D4FrL
	PYYL5qdW/SUX9rWI9ePJnnKy9Pv4M5wPNixRL+zMs9S9bfNNYhYEnl6+8s9Ld
X-Gm-Gg: ASbGncv7MctUhKPDR+2jaVbrGVbooyGI+iUiuVRfo3KLLNKcQA4HycmWzONTqfOLKaW
	tdUDTIrSGS48M0kv4zOhNGfVH5sI66Yra2zjCiTvLcQ30YZaub2SkGZF8Q7KoyHBPTb7RoZ9a+V
	yKKmoIi0A4Q2R1GpdIK9DoWMGYQKBCryx3jYl3PBzPoP6m5l+ctpi8st+rbmDztvpIbB6Zy5ziL
	MfBuS526CVyEkfN3+dSYjuOnCSsEqShyURASGDzeMPHER2EIKrjbH7c9iXWjhZY8RxeofqZu3pB
	VR1+PDOJtBAuCv2fAFOP2V4KE+MK7vB/E7EnZUupvS2JtTkOc9h1VdSsAEymJPwXLl1N4p/MoQ=
	=
X-Received: by 2002:a17:90a:fc4f:b0:2ea:5054:6c44 with SMTP id 98e67ed59e1d1-2f83ac86bccmr18174855a91.31.1738372232271;
        Fri, 31 Jan 2025 17:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGag6maRdPrxE8IC9TevBY0D6X91fAgeJoEYMPn9LVgyvp8pNG36emajnrskUbL8ZUzJNlq1A==
X-Received: by 2002:a17:90a:fc4f:b0:2ea:5054:6c44 with SMTP id 98e67ed59e1d1-2f83ac86bccmr18174825a91.31.1738372231873;
        Fri, 31 Jan 2025 17:10:31 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbfe6bsm7258366a91.46.2025.01.31.17.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 17:10:31 -0800 (PST)
Message-ID: <a215f6a8-dc62-45bd-9feb-bec178e4ad5b@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 17:10:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250113071758.19589-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZqxycD_7WLljr48vKQzSHlU-qXuWMkr5
X-Proofpoint-GUID: ZqxycD_7WLljr48vKQzSHlU-qXuWMkr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=915 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_171035_254406_21359C18 
X-CRM114-Status: GOOD (  10.68  )
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

On 1/12/2025 11:17 PM, Lingbo Kong wrote:
> Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
> Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
> Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.
> 
> v4:
> 1.used tab(s) to align the = to match the existing code
> 
> v3:
> 1.Rebase again to 48322e474f04
> 
> v2:
> 1.use TAB to be consistent with existing code
> 
> Lingbo Kong (3):
>   wifi: ath12k: Dump PDEV transmit rate HTT stats
>   wifi: ath12k: Dump PDEV receive rate HTT stats
>   wifi: ath12k: Dump additional PDEV receive rate HTT stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
>  2 files changed, 682 insertions(+)
> 
> 
> base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256

pushed to pending, please verify the following edits:

patch 1/3:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=d971a54bffcda2421038fd09848b0781244f15c1
 added 2025 to Qualcomm copyrights in
   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
 aligned = in
   ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE	= 9,
   HTT_STATS_TX_PDEV_RATE_STATS_TAG	= 34,

patch 2/3:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=64cf8cc8f141ad47ca831649f3173fae25c5010b
 aligned = in
   ATH12K_DBG_HTT_EXT_STATS_PDEV_RX_RATE	= 10,
   HTT_STATS_RX_PDEV_RATE_STATS_TAG	= 35,

