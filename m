Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E84C0218A
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 03:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9XMzfRW9jzjbAmoToE16yqekltPnI7Dhph0+hZplT4=; b=ehlkWKEOnHbVzF7zcCAx1Umi/J
	ZR+o1P1uQBeNRFTIvEVwyt7hv5f+CuygXLm3MJ+d9YIcl65jqs/HqEw+aQJUV6ADz9ReS+hKiu5z0
	6J40AiBxU9nArWhLH28bJj2NK7aREAVJbwI6f6VfrbwiadMpM4o179O90I1yLF3JviE8xXVstFZBz
	Iv4GYJnqSwsLX77gvR+1fm/4IUBl+Q9XyB6MYEXCPhyW4vqoohPXjCIwhgncbdLwPc+LKlmFSKHXN
	UmKgrmFK5Li5IZatygTzw10lpR0JfjIE950wh9UmGmkUUvXh+gc3mwgddyuTSjrLI5kd4RCVXqC16
	aksHainw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenFv-0000000EUjF-3kmY
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 03:36:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tenFt-0000000EUiv-1VLd
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 03:36:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512MTB7Y020406
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 03:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9XMzfRW9jzjbAmoToE16yqekltPnI7Dhph0+hZplT4=; b=aMPxvXhC1mk1l+Pj
	XSadx/e7PBy15L2+09LRs2cUjF5ZA6KVv9hhW4zk3I/Y+V4Id2V5462Ckf62MZHE
	pQ3XHwZECa4TrVzaoxB2LTx4NWv6AcPcI6DTUec8Yf/EcfOs0FZ9zaY0SkYh9Pog
	QO5GgygmAu/yy31jdtFxk2Thwxcs1Pf7tX4PEwOQB0FykdkwplNlxb0moh5DSIEL
	RGEF+M93Mg088BXdoYUUg0ZKXy0CCIF9cudpN2sWTUIpKj1kgb9TfFA/yWAmTc0Z
	nZyYDGpAw1Ve1StBTnJSlmfVAmjcgJEPaGFU//GT/vBC8KGGsTLhkcODV8NO8AvT
	8LLMGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44j6narxmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 03:36:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef8c7ef51dso7719841a91.1
        for <ath12k@lists.infradead.org>; Sun, 02 Feb 2025 19:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738553770; x=1739158570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9XMzfRW9jzjbAmoToE16yqekltPnI7Dhph0+hZplT4=;
        b=J4m+cjXQL2xIow1Wz8WmABWgaadpO5pQvoScl2A40NS4dijK2JB/bB3kpW0b2WCrDC
         y1IFVQhcjR/VAlpXoLlKOcScJYGdTKeZGqMCbT1hsecgHlQ14cvRfAk5m71UybUkPTl9
         EqTDTafVya08GhFdZ8MEUCMJrg6kYMfxLvI0tOFeY/mMY/xNhLD9RPBIv2yr+QZS5Cqw
         k7pbPwTcTlFJIivVlby/eRjeWlmw75xBRpJbC5pL6QI5Tma8Rz49wbgxI0UqWHAf4l6S
         y2LkqO5LjFX7SvXjGsWGQAq/4914KBzfVAWCInDanb03bOa7gtgPNIVqid8Lll9ZgI/k
         2vcA==
X-Forwarded-Encrypted: i=1; AJvYcCXBGLHawXAXSZ2/M2NvgVvmf//lExEgsD+uoBZQio6Vqy2BAwGMdC+Fv7mStKj5JREitdh3Bx0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTd8VNKQQ5kthF1mD/T5oo7CNpmXYvVKyDj16L+nXF5eoHEfdW
	UlWZeh9fu8Lq/c6HSGGLhUsKRYNXbcYT51FjvHlAwczqHK/3r/v/gQ/45M3nH17H5XzpvFA1C/J
	IdC0gUXt+2MzY+5S4jflVab+gKEYajFqXtGsreKgohzbSnH3gv9McVn9Tx5cE
X-Gm-Gg: ASbGncsOaJvVP9U7RNn7HHglq16+zhPZxwr6IVckijsaLUDGQv23NG/ETX7S1jXja9N
	VdcwY/QkqyImlKmeOwxSxhsuAGeJfjtoYgGq/PQvb+z1A+7xgRThva+qSa4M30T/NfXmPzoxgjn
	JvAHO0ij1UppjYWSlJCFMBZk5X2qA82gyUJnXt43au+RZ4Ek64UOIKeSM9XStH97qXJdNwtlP52
	1cmfDKPo5MjeDc2IGLj4/08Qx+/UTRyR6UmHi4BX9+r5De9lnESV1TBobVZZTA76De6clZHE9O4
	xtBXBU5NRdRQXoyahtdOpELVe496zvvDJc0zayg=
X-Received: by 2002:a17:90a:fc43:b0:2f4:4431:51d4 with SMTP id 98e67ed59e1d1-2f994e5000emr19927238a91.6.1738553770456;
        Sun, 02 Feb 2025 19:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNhbgC+sGkK+l3sx6RBqEzjNY01E3D5ZcUn3ADllOXPHG4uVtSywlZybhdX/wqmRfGHMdZng==
X-Received: by 2002:a17:90a:fc43:b0:2f4:4431:51d4 with SMTP id 98e67ed59e1d1-2f994e5000emr19927198a91.6.1738553769993;
        Sun, 02 Feb 2025 19:36:09 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97d32sm10046455a91.4.2025.02.02.19.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 19:36:09 -0800 (PST)
Message-ID: <f31557e9-88d3-4800-aa77-14a76857f797@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 09:06:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] wifi: ath12k: Support dump PDEV transmit and
 receive rate HTT stats
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250113071758.19589-1-quic_lingbok@quicinc.com>
 <a215f6a8-dc62-45bd-9feb-bec178e4ad5b@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <a215f6a8-dc62-45bd-9feb-bec178e4ad5b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6FdVWc0oK8wPeoxOVJQ6qASXDtZ53Pwm
X-Proofpoint-GUID: 6FdVWc0oK8wPeoxOVJQ6qASXDtZ53Pwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=860 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_193613_445906_759D074D 
X-CRM114-Status: UNSURE (   9.22  )
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

On 2/1/25 06:40, Jeff Johnson wrote:
[..]
> 
> pushed to pending, please verify the following edits:
> 
> patch 1/3:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=d971a54bffcda2421038fd09848b0781244f15c1
>   added 2025 to Qualcomm copyrights in
>     drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>     drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
>   aligned = in
>     ATH12K_DBG_HTT_EXT_STATS_PDEV_TX_RATE	= 9,
>     HTT_STATS_TX_PDEV_RATE_STATS_TAG	= 34,
> 

Looks good.

> patch 2/3:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=64cf8cc8f141ad47ca831649f3173fae25c5010b
>   aligned = in
>     ATH12K_DBG_HTT_EXT_STATS_PDEV_RX_RATE	= 10,
>     HTT_STATS_RX_PDEV_RATE_STATS_TAG	= 35,

I see alignment mismatch in macro 
"ATH12K_HTT_RX_PDEV_STATS_NUM_EXTRA_MCS_COUNTERS". Can that be fixed?


-- 
Aditya

