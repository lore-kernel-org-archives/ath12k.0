Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC24C3600E
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 21:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFSW+y+O3hp9uRAbVlBqXUI5+0dk9owsM69HnTAbWDw=; b=dxSnRwRA3eEiBXSDEOaA/EXPvA
	d+IXq/UdMIVSGsJlFX9rEOHNFz1BPtLdPzwNhlmCioyyseVIfvRPNDfF0twJzeCJieyPf7KAefcj3
	um3OCu+AjyiPJrrlK0RhIEpv/EN2Cbr7e5Pwxe8is3ckEj3vCMoJBMgIFzvBnwPNBxdcaAKh772ru
	mTRoB/yCmE4nJdZegWrrzVh8U++YMMHSriIDGz5nz7TBMO38z0qKB1aNDRAx2LYwIqW3Yu8YLygDJ
	aSJU+eQ8ysmxPees1e0kex2PH7Z1e8DDjwhNFVaxRkpcfc+yacjFjel8nQt0gBEl35tqtN72D1wYl
	zheiBpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXzN-00000009cP1-1drC
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 21:08:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXzK-00000009cOK-0HKD
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 21:08:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFJ7a0026884
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 21:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFSW+y+O3hp9uRAbVlBqXUI5+0dk9owsM69HnTAbWDw=; b=USaMbtdc8BMrTXS5
	d5cWpu8TjWojCO5RljFpSz4vBv45OUTfO29Yf4RCkZwI7ambwxKMUlz5iLo4BmYm
	ywsAzZ/whMU+vaOchody50q7ugaT/H4Yfv3PZ6H1tij+y0jm/SW0TudP/gCGJxKp
	J5ikHg80RbWhCmLOAudFQqiOxsOPAl7r3kjm0U+vlKLp9eHJLhE4CFKngKbwbU9+
	G6Vb+NXt5o1g5WBEfq7CJQbam0iP7f3ACLESG+Lt29tI/P/GmqzCw2NFlqYOt14X
	LG35fMnnDDKkKMOGQbk1HSp8IgqmRfSQYRbNGzTC3neFYFy3tFuX6XolubzAJ0o6
	qWR5GA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdv0ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 21:08:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff4b130bb2so405349a91.0
        for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 14:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743023316; x=1743628116;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFSW+y+O3hp9uRAbVlBqXUI5+0dk9owsM69HnTAbWDw=;
        b=k6ZPJqSWmD/cCCCRLmiHxdYzccBQp9gvz0KVvow+qFO4chTENPEyjUkuzSC+qPDMp6
         MBPTIy5U/6QbnidCDNGUJPe9rD/ZFQQQ2G8F+yGXXwZJM8m4bsPX5y903m3f5dDwvGN7
         M+NkdqxsY0tMgw7d1krD9cxu2Kxs8GCTmAWKXxXqsTuRLrlKOjsQUNxVZzBvfAtwuUNU
         KfqRSA+aEIctrnl/lPKKyDBIocGuPx2M+OsPGkqjsVjnlO6FNpE9hl4q7trDjQhaP8vW
         w4TjTuqjb/VtOa0yXiybnUlYBrWg21841j8G/LytWpsLPrFslaWm5l5FcqbaO/WkQqZi
         hVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp7ogZ+epEdfyAjiHeo4nnTUfLJduna+LgfO1hBnu9FViMRaPgeBq1/FddGu3c/6IEq1+lo78=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh7aldGicKyGgHlp4RR862dS81K7UjXhaSKS0km+1sOFA+4V2d
	rHWWYHO9tLgfOVk4DnrvHd00D6Q4bOckZJ0Z43zMQc5nVr6Dk6K0d2dsJkS3FrvQJXSqw7yQ2cb
	RjdB7K1RYFE8qYL+7yvaT/ObqsiXDkK3cJLel7DBknMQWUhINZWMFZg3GRNAB
X-Gm-Gg: ASbGncsU1XBbDcTZp0eoFQoDhKH8VAVlMPxXqULjnhdOmPYZGpw5Z1r7+ZvMIiVcwb0
	crCG9hSThG7t6dfX9Gjx12KHFnsJI3/RJKG/UKgGEq+7VQ+G6xkF0tX9JLMT/KPNjFRmiYar0D/
	jyxURx8DC/t0TfPk9HSdaFqezc4mh1/4M0RbEKXWMVo/zGkHf11ykneNvry3OyE1t4HZ+8jCZ8l
	JjjX0DYDhxWlQkCKLystY2nOcinn3LzEuefBOM86Ly0BVM/0mLbV58x5MhTZHnf0bXuhWmp7ZNi
	CSE+xMwPM9xKB6tCLx3ZNa6TPfXS6IjcJ6S0C0nmmprMS+jfMGj07JsRKkoPHAK1DPReJ2paDCG
	F5+FQ9DcM
X-Received: by 2002:a17:90b:3b52:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-303a906c3f1mr1702250a91.28.1743023315577;
        Wed, 26 Mar 2025 14:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWDNLjHocTdVUP2kL0YyRGZP3qzCAY7FwNZE9w5sWivK1L1uAaiVSgQwqo4kMozQ+ZzqF+mg==
X-Received: by 2002:a17:90b:3b52:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-303a906c3f1mr1702200a91.28.1743023314886;
        Wed, 26 Mar 2025 14:08:34 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dfd3851sm722007a91.1.2025.03.26.14.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 14:08:34 -0700 (PDT)
Message-ID: <e7776b2f-56b5-4024-b878-13053e57227d@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:08:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v12 0/4] wifi: ath12k: add 11d scan offload
 support and handle country code for WCN7850
To: kangyang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250321084518.1619-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250321084518.1619-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rpwVyQS7FNTgd58LgZPoNq4gKH5mCEYR
X-Proofpoint-GUID: rpwVyQS7FNTgd58LgZPoNq4gKH5mCEYR
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e46cd5 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=uhMqMWLRpLrNCD56NxgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_140838_234148_A3CF534C 
X-CRM114-Status: GOOD (  17.16  )
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

On 3/21/2025 1:45 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> This patch-set mainly does four things:
> 1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
> 2. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
> 3. Implement 11d scan offload, and update new channel list to firmware
> when 11d scan finished.
> 4. Store country code, and update it to firmware after device recovery.
> 
> With this patch-set, WCN7850 can do 11d offload scan and update country
> code to firmware successfully.
> 
> Note: This patch-set is an old patch-set in public review written by
> Wen Gong. Just resend it for him.
> Link: https://patchwork.kernel.org/project/linux-wireless/cover/20230914090746.23560-1-quic_wgong@quicinc.com/
> 
> v12:
>     1. add reviewed-by tag.
>     2. rebase on tag: ath-202503172347.
> v11:
>     1. swap the order of patch #2 and #3.
>     2. rebase on tag:ath/main(ath-202502181756).
> v10: rebase on tag: ath/main(ath-202502111625).
> v9: update copy right in patch #1, #2, #3.
> v8: rebase on tag: ath/main(ath-202501172342).
> v7:
>     1. rebase on tag: ath/main(ath-202412191756).
>     2. rewrite commit message for patch#2.
> v6: rebase on tag: ath/main(ath-202410161539).
> v5: rebase on tag: ath/main(ath-202410111606).
> v4: rebase on tag: ath-202410072115.
> v3:
>     1. use wiphy::mtx lock instead of adding a new lock(patch#2).
>     2. rename struct according to wmi naming convention(patch#1, #2).
>     3. update copyright in reg.h
>     4. modifiy patch#3, #4 due to struct name change.
> v2: change per Jeff.
>     1. change alpha2 length from 3 to 2.
>     2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.
> 
> Wen Gong (4):
>   wifi: ath12k: add configure country code for WCN7850
>   wifi: ath12k: use correct WMI command to set country code for WCN7850
>   wifi: ath12k: add 11d scan offload support
>   wifi: ath12k: store and send country code to firmware after recovery
> 
>  drivers/net/wireless/ath/ath12k/core.c |  34 ++++-
>  drivers/net/wireless/ath/ath12k/core.h |  17 +++
>  drivers/net/wireless/ath/ath12k/hw.c   |   8 +-
>  drivers/net/wireless/ath/ath12k/hw.h   |   3 +-
>  drivers/net/wireless/ath/ath12k/mac.c  | 167 ++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h  |   7 ++
>  drivers/net/wireless/ath/ath12k/reg.c  |  72 ++++++++---
>  drivers/net/wireless/ath/ath12k/reg.h  |   2 +-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 158 ++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  38 ++++++
>  10 files changed, 482 insertions(+), 24 deletions(-)
> 
> 
> base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4

This series no longer applies, please rebase.

