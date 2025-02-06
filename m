Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6203AC02194
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7wjLP+yTM02I49I8Ek7TaQyeo1dCCYOyY+5OGI9Wsk=; b=edMZJGif0vlAUue5dpI0M5Ma1E
	2g3b+f90UdQFsUHNetfj8+hAWsq246oUiUKBxvBld1W28X1tFrzEVyhDoebymOZtA2kunXLjayMhz
	L89fozoET1BTityxjoWVFUN5sUWVP75tIhzjOnUtSGiw+rk/HzGbSllbRb8vYQbD7nHno7Q99EGGj
	ujLo/aE0nXKOISRXFtgWk38m9skSrktlp5dSiwx3TA+efrXPmy8CnxNh90pTLI2o7AF9Tep4Naa3C
	f0Ow5MMe4z6nwfsfNPuIrk2zQXb9hiS4H6ceVl+vZuT7A6FI5fyeLfQRKkNy1sjCsVHN2CSyMS2TU
	A+LA9HSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9Ys-00000007awK-0Evx
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 21:37:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg9Yo-00000007ave-4APe
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 21:37:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516Iraov018948
	for <ath12k@lists.infradead.org>; Thu, 6 Feb 2025 21:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7wjLP+yTM02I49I8Ek7TaQyeo1dCCYOyY+5OGI9Wsk=; b=ND2ISF3cvYwGfyQ0
	jt77DAeLb2bazcd+X6L+wBI+RRCi4s7jrVU9rL7nIk4CBSYmqfOveN65tWcF4sTa
	QQWUCUcYrO1jlW4PxGFDCZtevrULXy5cpj9jq336xRa6gww2Lnb7wbp9x0ybRb70
	fY98XPhZRzHijlb7h18Vt6J8l1yRULDNwRgFbwYXPImQHa4J7U8sjSU/hqArNDmK
	/AAwd03cohFN0fZugNky8XpQO2d2wBIhzW2lDus8SUJml0DsjHs0en7BBPaxupcQ
	NsxXjHlyQ3CWVh3mQGIcJclFgrrRdWp2p8W2goA3yTf1W2Vvw+N1CHrUh3/VnFyx
	9id1QQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n2rt8b6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Feb 2025 21:37:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216387ddda8so30455595ad.3
        for <ath12k@lists.infradead.org>; Thu, 06 Feb 2025 13:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738877841; x=1739482641;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7wjLP+yTM02I49I8Ek7TaQyeo1dCCYOyY+5OGI9Wsk=;
        b=FSemMBq8qgnN7U8tOIELxi8AD01CXn9/YuZef+zWJ96DQmqAYJPkQDXmOw7xO3H0iy
         RtnnYtLLfJGppb/O0nhmPqvXO7pnz5FYYI3SN/IyhqyUl9shtp9r2X7aA3iTwn/5+lxd
         IxFnTcyu4koUWFm5xdDk854E9o+FTbtQAF5a8Xrf7ZhNF1A3HUnvIk5AvFpM9GE8LVj2
         5pu9xl5tngWXBbBvjjTdYFuiF9FtFE9MIqx2wckpL095A1gBmvigS471zlmfZcCVHVGa
         g8nbjh6Lj+5G6KiPdwmDldVYjFJo/PY3Qw7IJESTTxgJ9XE4oKQFv8ZG8O9F1tTYQ2Fw
         Vztw==
X-Forwarded-Encrypted: i=1; AJvYcCW9CcnwqnUTj9cHEzQ/o7MGZWXROzY4SlFM/KJPoLYx+BSi+e42G9TYouQCdfFgYLEg6AyYiaw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1+6Bt7cVQbTisN9bAZykcZo+6AOrHGHSaYgsQ+YyReBcZH+rI
	DtozfMWw12r/+joO33hVZ3pANuBljaMpv2iMaaLB7oVIIrD8wTIjnDxs4j4BjZT5OkhyRDTWB4w
	gQgQ2XE94nXuASC8DzPZ2ldiCAGXns+7RvmhRaQCwX/OXTn3CK+hoLclTCC8o
X-Gm-Gg: ASbGncvU9GrOp+17YchF3MT33T46PHFpmYR9maIPZ9t/MeCe6/12sjegwWrvX2dSdR1
	2Ny9XgUVvZfatfcsKl86m1nDDYDGjrBFlI0jXvnMs1gMXIdsnsBhi4JgJ9iqfmLzp/DF09Dxq9g
	jMPWUKQcg/prpxErbf08RN1wiJUSms6ezfukXKGW+neC92ohh7kZIIMx82mgsQMyiScICfNCzc4
	gs6Qlgo2GRI09lcg6dAy/NXI+UbhQVgi6zXyb+Ik0y31DET2kXVEe2bqd9GRXfL0NeFnnc6jVle
	Y0DoBghDY2FPHU2MYYQkXIKWox3K+80QEuRiY3fxve7/E6OjXSuhB6CQNHBfgrVaYGpdY9wD4g=
	=
X-Received: by 2002:a17:902:e802:b0:21f:4aaf:60fa with SMTP id d9443c01a7336-21f4e7595c7mr12834325ad.38.1738877840969;
        Thu, 06 Feb 2025 13:37:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1x892Iv1IAr+zxejJwny+BJ000+ouOGHUAikBS3EHIAbcztyS84NEIkfqIGZ2mbl002x/Zg==
X-Received: by 2002:a17:902:e802:b0:21f:4aaf:60fa with SMTP id d9443c01a7336-21f4e7595c7mr12833965ad.38.1738877840575;
        Thu, 06 Feb 2025 13:37:20 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653ad8fsm17743325ad.61.2025.02.06.13.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 13:37:20 -0800 (PST)
Message-ID: <9759db76-c805-48df-a17b-b913c430b2b5@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 13:37:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] wifi:ath11k/ath12k: refactor tx_arvif retrieval
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vmauPxIflpk_dAUYFJ__uGwsuVbAWy0A
X-Proofpoint-GUID: vmauPxIflpk_dAUYFJ__uGwsuVbAWy0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_133723_055140_4ECB42A9 
X-CRM114-Status: GOOD (  13.12  )
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

On 2/3/2025 1:44 PM, Aloka Dixit wrote:
> MLO MBSSID series for cfg80211/mac80211, which is in review here 
> https://patchwork.kernel.org/project/linux-wireless/list/?series=902914&state=%2A&archive=both,
> changes the way transmitted profile data is stored for each link.
> As drivers currently retrieve 'arvif' for transmitted profile at
> multiple places, MLO MBSSID changes will becomes unnecessarily
> bloated with RCU operations for every retrieval. Refactor 'tx_arvif'
> to avoid this.
> 
> Additionally, fix an issue in ath11k_mac_update_vif_chan() where
> tx_arvif is not reset to NULL inside 'for' loop during each
> iteration.
> 
> v3: address comment from v2 and removed NULL check for
> vif->mbssid_tx_vif from patch #1.
> 
> v2: fixed kernel test robot error in patch 1/5 for tx_vif.
> https://lore.kernel.org/oe-kbuild-all/202501160626.Jbb3GHnk-lkp@intel.com
> 
> Aloka Dixit (5):
>   wifi: ath11k: refactor transmitted arvif retrieval
>   wifi: ath11k: pass tx arvif for MBSSID and EMA beacon generation
>   wifi: ath12k: refactor transmitted arvif retrieval
>   wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
>   wifi: ath12k: pass BSSID index as input for EMA
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 75 ++++++++++++-------------
>  drivers/net/wireless/ath/ath12k/mac.c | 81 +++++++++++++--------------
>  2 files changed, 76 insertions(+), 80 deletions(-)
> 
> 
> base-commit: 1ed13fdf7d8284742c8ede36dd553387839e5163
can you rebase? this has a conflict with:
    wifi: ath12k: fix handling of CSA offsets in beacon template command


