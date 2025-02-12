Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F5C02198
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuHUbmMvZ1JOoqy63EABj8zAskjeEZWCiTW+fw42xDg=; b=JX/Uy3OPd/NLKJ0a4+PEwJTCSg
	2IHkIxuu6QckZZMIeW+/w0fXDgYsJGmYsuWhHmcKokaL86/aAaogbVu6Wg27rckpNW5rVypq+Mm8t
	xalyaZr3/BFwMQ0IBigBr1VeZzWtjR9YzfFWqD9Ifr30fvWWsZjCFROyK78s1xq4AUZmdZSyGWtrI
	hjQVfEe46GOH3j6DV7OfEz88ximfF0F0au+vFy+00eCAwLlmSyRiDeEm3tFpq/zF8D+k18cgLuz6E
	mwnGJBeWBFj6ALYeW0Cjk96VXK7MNZlB8xCAzYVH3Tnd1FXNz+dcyj7niw0Zpj0LVi2AThYLssiFG
	0ccO/Ixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti41k-0000000683a-3s4M
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 04:07:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti41h-0000000683B-4AIW
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 04:07:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BMeIZr031920
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 04:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuHUbmMvZ1JOoqy63EABj8zAskjeEZWCiTW+fw42xDg=; b=Iax63rTWU3D1u7qS
	KCw6kR5qAvoGcNTM9Hj/P+Sf+GH67nGno77Ucuso5ZqOiWBN2BT5WykQO4uTgdcs
	DWaP5/E90VmaSAAA9fP4uNdJx2/MoEJ6ICf+Tluu8AUlEND+vjcN5rQyrrqEUVq1
	Gyonv/SChB7GHxMdSQNpLUwjgq5MH3e6A+ho0cKxEtzRHEr3viSograz56cwr2xs
	Sra/2j7Dp/to7WGGJc7ueFfkO82xKLnEGAGNwbT2yoKZlb85b5cMbywEMjeu11hH
	TGB/Wd2bNq8cLkVlDscwt9MMplihjJ40Vpt2a0r4MZYwrRkb/dfgGuLKnSbsoO35
	bHo4SA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk5se7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 04:07:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa1c093f12so16493187a91.2
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 20:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739333224; x=1739938024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuHUbmMvZ1JOoqy63EABj8zAskjeEZWCiTW+fw42xDg=;
        b=l99VtcJwRS92lSuaqx1ZVjHOQWvA2Hy0DrmSzQ2wiv98JV4HK1I+8sLYATwXWqJgXV
         b/GwfcoGStFsFFvqrcnsrhhA8IBGTAgxX1AUgYwkMaNFeAPWTsq94lTiF9kE78MTgRXo
         rgwlz6I1Vgd8mk3hPSB04N0667rn6xj78RyAZj6HrZDZowjm9O6IHJrGh/NuD0EUaeoy
         1nAPG4YI7eKHchzih6p47PqxcTCbyP5/Rv3uQUiT6ssl99Gf547H/b1CHKOHxUv4BQco
         i9Tg31lBNMLCqVaBpo7tBw7tMqyTk9tJBb0hwUUVXnOJ0Ws7z5oowvFvXbG17Yey9ClR
         DiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqWr+PvRH10wrrj2x4J/NVN8+23T4OjXaGli3cw4gFLdk/4u7SOBxHiKaOk15+8TIxS9HNTm8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx5cDLTXgdT7uTHc4ivw/nRu+GUcsFCxkkKXgvITs0W83e7tZc
	Vi7gqL62aRdpHwZZHBMqlX3FOiXUEycqQWRrAHL2UiLCmSDnsDblQSJ/PXjtYN3BGGMNflEWduw
	0PQSqyfLGWX6IaBmWfb6qtwG1gX5NOpXnJNx1PQsZJGQHZPkhfL3NoyS5//X7
X-Gm-Gg: ASbGncvIXIF3uwBiIFlAe/rp6CDXQPpDgj2QBPrRvCodHhqvvlfr178NYbwbjGnQYqv
	TpgCtodvZBcZMt6FjQ1asUCrGlgw2k6Qg88SzQZmcp8Z+t4k5pKq75wOLlUE+G1rFIKv6s0PEwL
	9e/xDp6sWz3PAYs6FihpZOM0hAU8kXKk+Hi+MZnhIG6Pyt+aGuEv7wd3O9A2oW837j0a9s8ZhIm
	ldjMdOr6lF2hH5DO16E3nHLnGjIYECcNFjo4GWGzHINcEzjW+/DNhGBAeMFw47iopsugWeOg0az
	8WNZejTmXXBSDNOdYhrsy8cILHLjp+DDMt95kqLinohLKe0=
X-Received: by 2002:a05:6a20:258e:b0:1e0:d6ef:521a with SMTP id adf61e73a8af0-1ee5c732f01mr3192662637.1.1739333223988;
        Tue, 11 Feb 2025 20:07:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQBsz0NP1gFlIyij83Vi2OQvRjDyJYV0mhsemGVq9Z5Jf7wCrtMmGzbP0x4XLuCjCYV9hh6A==
X-Received: by 2002:a05:6a20:258e:b0:1e0:d6ef:521a with SMTP id adf61e73a8af0-1ee5c732f01mr3192628637.1.1739333223576;
        Tue, 11 Feb 2025 20:07:03 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5434dc097sm6497494a12.7.2025.02.11.20.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 20:07:03 -0800 (PST)
Message-ID: <48cea2db-c6a7-63f1-5e3c-1db77a6fb84e@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 09:37:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250124113331.93476-1-nico.escande@gmail.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250124113331.93476-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XHXE2M7gKBXzaJhxsNxgFEnrBGubM42D
X-Proofpoint-ORIG-GUID: XHXE2M7gKBXzaJhxsNxgFEnrBGubM42D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=826 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_200706_233580_B3A5535A 
X-CRM114-Status: GOOD (  10.39  )
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



On 1/24/2025 5:03 PM, Nicolas Escande wrote:
> When AP-VLAN was added, we did not add HTT_TCL_META_DATA_VALID_HTT flag to
> the tx_info's meta_data_flags . Without this flag the firmware seems to
> reject all the broadcast (ap-vlan) frames. So lets add it same as ath11k
> did it in commit 5e8a373c8699 ("ath11k: Add support for dynamic vlan")
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Thanks for the this. Can you pls resend the patch without fbx in the
patch title? The rest looks good.

Vasanth

