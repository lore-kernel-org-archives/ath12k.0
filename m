Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFAAC02192
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 02:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwxH5eaHP07LekM95UHcWYMO0l5O5gAtWQNIbNz0zDk=; b=GZIZKIm92CZQMA8B4VHmYsZG6r
	FWLoox5q0Gb3d1UvqFhddCe5FET97BHpukX7yXr3q/h6YAR9HG0S3oneEHtcKMXghz9rb1wGZUyE4
	l3kW/AeKUPMbDhhPsGQ1nA41tGqRLVRPgYnoHy/PIRoD18md/lkl+/HQ7Rv6H3gRzaEBGCqyB2tr8
	blfkrHSN6fEGP/BYIqVmf9HLZOkoQBOTAGxth3l7p5diBSynCt8N8wwt7CmUQsqpldUTOByPzOId0
	PLMg+1hyf8eBaHxUlHtnKhyBIFL8/cFk6yyTPwznrU5jhytJpvGXqyYcsVsv8sV7e562vbCKUMoGC
	gZ8TGNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8NS-0000000H6Gf-30Ac
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 02:09:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8NP-0000000H6GF-3XI2
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 02:09:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Iaj7r008805
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 02:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JwxH5eaHP07LekM95UHcWYMO0l5O5gAtWQNIbNz0zDk=; b=O+PlCNyX83DWw2A1
	M3lRTPx6ZX86rg7Cghp6KXBxfrwadM3bzroUpW4mvd02EPsIHViAZxTxIt/SAbu1
	46Ranih8Ad/VSLxKWo99jl+JHcbEhQhhIC1s9S5voGJtocfwCsXqepEO7p3B4h/Z
	Irxf6yrZnx+6XCbjbghGcUX+/7TQjISZjgrfByk23YjWfK52jni/374soVt5Y2lR
	MX+13kgbXEe0WdfvAdwV/LaJrUEeu2QRZ2LmgYvLIqDv7iar7wcatOObeHIdW39X
	YSSjnEaPQ3Iq5PFBJB4O5ZIn+r5DG78Yi4RP46TXJHIilB3wm10CTQb6L1Cx1vWo
	9jqvRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k37u0tjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 02:09:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21650d4612eso74538775ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 18:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738634961; x=1739239761;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwxH5eaHP07LekM95UHcWYMO0l5O5gAtWQNIbNz0zDk=;
        b=t5sAj3Z/baUVdyWju0w+XXi4Qp5GfbecWHZVg89lIhg/miD31NfmHOeNJRIpk/3cM/
         VZe8irUBzCQgwLVIYZK3vui9NCcVjmRvOOywI6sfeReUcEcD++y6Y4r9Zp8+T1JxCVcF
         aIuHgISu2W9aHj646FSNwxJGDYtv2GQTBybqDkE8kYi7yn+TNGM22vLI88kru+v/tIBP
         St59svlRiBwypPX5nqeUprjFLXhnO5l024bco5ZmSuo+ttAE1ltqAk5iODhCulsl/X2+
         GEk/537BacoDDRh5Th2dx4AJEEfbvFBiO6zYekN3tOL5FxBkxkQCPZqIkwAILWoijhft
         WE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7jW031rZAWXTIqbEgBqCCoLdWgSy9As3lP+jUee51wcs5lwUmJ+7eDExr092jMJ1eagdrLdw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM+3hjaC2juR2n6o+y7VeXMqBtYR4N8mY9WE6PF9kXAyc2txLM
	Y8stnj3zIyU5ff6Gw3Wu29oRroX9ObvTLgmCVqucIPhSyUzK4+F92Z2Q80vILBtndcz+6yVFKCK
	NpBuaIpEeSBA3OKoGVroCbNyXiStdGRd3FGNA0IZLjr0W1fTwMj9KNYP8l2+6
X-Gm-Gg: ASbGnctmSmCEAQfui4L4kjW463lBguGuBmL7u2wuXpDVaqjzaAqcK0EsbAmf8dyxrw+
	MWkhbMz3/03SDspOuUa+Kgn7Y09OdZ8YlNqWwaY1VU7n6t3toeopSzYeclS3XaNq4iagyZFq+ek
	EBG2QK+Lm4p+aaHGbe+rdZ4VGkK/RaJNYkFcUrhNVbO0HTBBd3X+Ku+RYBdcKwx9wlPMup2FYHB
	LBANQHCEIscj7X+vsZ1Rn6lZESlpoK34GUX+sjuIlSp0M4U9KkFEh5ZIoG0L/EfykaNaVpfk3of
	v9s5agfz8G/dCYcBN6JfZF0wqZgEaZt7UcrwGFXq6sVPwCpz0RXuhXqejirlXOD7OTQKcgD53Q=
	=
X-Received: by 2002:a17:902:ecc1:b0:216:45b9:43ad with SMTP id d9443c01a7336-21dd7dcb011mr403527085ad.34.1738634961275;
        Mon, 03 Feb 2025 18:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqILNSrnAPMgEY4Sw5wGbNbvICyCrdB+mr/0pb1KXyDFpt9iwAPyvisUW90bxZJv5sSbjnkw==
X-Received: by 2002:a17:902:ecc1:b0:216:45b9:43ad with SMTP id d9443c01a7336-21dd7dcb011mr403526705ad.34.1738634960740;
        Mon, 03 Feb 2025 18:09:20 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad25ee99ba0sm3782124a12.69.2025.02.03.18.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 18:09:20 -0800 (PST)
Message-ID: <d96a5643-64c6-4bce-930f-f1651a09cb11@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 18:09:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250129105810.1094359-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250129105810.1094359-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DruY8GzVyi35CgIEh_e4oPifoshXq5jt
X-Proofpoint-GUID: DruY8GzVyi35CgIEh_e4oPifoshXq5jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_180924_008601_D7BE6395 
X-CRM114-Status: GOOD (  15.88  )
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

On 1/29/2025 2:58 AM, Karthikeyan Periyasamy wrote:
> Currently, peer extended Rx statistics are not supported. Peer extended Rx
> statistics are collected form the TLV data reported in the monitor status
> Rx path. Therefore, add support for TLV tag parser handling and debugfs
> to configure and dump the collected information. Additionally, this series
> does not impact the WCN7850.
> 
> v6:
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>  wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>   - modified the return type as void
> v5:
>  Removed the patch "wifi: ath12k: Add EHT rate statistics support" since it
>  is already merged
> v4:
>  wifi: ath12k: Add peer extended Rx statistics debugfs support
>   - fixed the kernel test robot noticed build errors
> v3:
>  wifi: ath12k: Add peer extended Rx statistics debugfs support
>   - avoid ext_rx_stats filter overwrite in default filter setting
> v2:
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>  wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>   - fixed the length calculation in the EHT radiotap procedure
> 
> Balamurugan Mahalingam (2):
>   wifi: ath12k: Add EHT MCS support in Extended Rx statistics
>   wifi: ath12k: Refactor the format of peer rate table information
> 
> Karthikeyan Periyasamy (6):
>   wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV parsing support
>   wifi: ath12k: Add HAL_PHYRX_GENERIC_EHT_SIG TLV parsing support
>   wifi: ath12k: Add HAL_RX_PPDU_START_USER_INFO TLV parsing support
>   wifi: ath12k: Add HAL_PHYRX_OTHER_RECEIVE_INFO TLV parsing support
>   wifi: ath12k: Update the peer id in PPDU end user stats TLV
>   wifi: ath12k: Add peer extended Rx statistics debugfs support
> 
> P Praneesh (1):
>   wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV
> 
>  drivers/net/wireless/ath/ath12k/Makefile      |    2 +-
>  drivers/net/wireless/ath/ath12k/core.h        |   10 +-
>  drivers/net/wireless/ath/ath12k/debugfs.c     |   97 ++
>  drivers/net/wireless/ath/ath12k/debugfs.h     |   20 +
>  drivers/net/wireless/ath/ath12k/debugfs_sta.c |  337 ++++++
>  drivers/net/wireless/ath/ath12k/debugfs_sta.h |   24 +
>  drivers/net/wireless/ath/ath12k/dp_mon.c      | 1033 ++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/hal_rx.h      |  433 ++++++-
>  drivers/net/wireless/ath/ath12k/mac.c         |   18 +-
>  drivers/net/wireless/ath/ath12k/mac.h         |    4 +-
>  drivers/net/wireless/ath/ath12k/rx_desc.h     |    9 -
>  11 files changed, 1924 insertions(+), 63 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/debugfs_sta.h
> 
> 
> base-commit: b5aeca2e66899430827b8afcad061201f3b7861b

Unfortunately some new debugfs code was promoted to ath/main and this series
no longer applies cleanly. Please rebase & repost.


