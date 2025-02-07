Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF73C02194
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESceAsTExudZ77XUfniEGvmGfJT6Utl2V5clq/2RCOg=; b=yaQqhET+VVNTrXjFuHXMuE+SYH
	ne4Av9/velpp0Pg4igPXiML1yo7zzPqyE8s/YzEppu50M9wb714X9cX/I+T4GUQj1F/HqzsdlTcbk
	ojkPwqpUvxr5ZPPfa1OSfPkUddvxbQlCAmUf6+SC6Og45koYUyCWiDaRwF20jpT71EyiVttFedHrX
	dCqi0b9TAjZhZXNBspbJy5p+BcQu1tQv5NyJRPLSyeEQPQI/lLMBajMB1LSsGtVQBvq5FponY7euI
	f0K7cWpDcEMojRcLxyzdw1fyOh40LR1J6qCVTWc6YQBSITdSWmC0hXS9Id9jiwRSWc5HL9YNW8Tth
	/jCx53Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSNZ-0000000AX7x-0Stt
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 17:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRxm-0000000ASBJ-1dsY
	for ath12k@bombadil.infradead.org;
	Fri, 07 Feb 2025 17:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ESceAsTExudZ77XUfniEGvmGfJT6Utl2V5clq/2RCOg=; b=JkzYT7Rb7LWCJhWcCVxhiZt0vH
	033LBHbmpUyWjLXBNAAjmiYISN4n47JAcfzsAoUZ3bmdzjgkeQ3/fj1gki2BV3E9A97jw6xVlgP4r
	gI5+nCfockhB6NqOlV1v3+PgXroX8wH6RiCWKb3fUU+CYGh7adum8yxncMSqQd7HaxScM7uI+L+Oi
	6CJgkc5Trxm6SI9FwWrNsoGkhn1AgQAk+GPCQo8VR7bPukenxQmRCPbhzzEBL3ZS9R7F9a7FiNECw
	XOdc8tlDMpgCQQ+PTY2HjvXC/OXRf5yI1Ef8/EGuH7UWGDae3Q4QlwbxS62pyTX6r0VcqA083YZvq
	ucwUvXPw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRxi-0000000HGRc-2Lgj
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 17:16:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517B2k2N003240
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 17:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESceAsTExudZ77XUfniEGvmGfJT6Utl2V5clq/2RCOg=; b=p0i1NofZ2EawwZ1S
	VuacnV3/e6o1ztoXUHmrkLOUe8Q5RwzXSH70Y58tNs3g2QC3k98exPi48vWlehzb
	Uwmc23+G49QrrTwRunXQvdnEel5zxTRYmWa6S0rMG68xwEYGYpJ21SX6Issr5Chw
	VjLS03hdIKulezQt2rhJ5ICzdYAQ8AB7UcF4vTWG5O8Kiz1y9+GpFhIWc3gBEDfJ
	Y9jsAYWZEDamEsLqXeO0vEmhCLlk8tG3B1t1cmSUxJ88pgjQK1hptxhjn9H1yGTQ
	thGNMSKcSwNQ0jLGNEDVt4zJ59YiI8NJFS0c7tpK5YTL1qF6U313Sad93WAJp5zd
	OW96ag==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ngy10wpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 17:16:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f81a0d0a18so4955458a91.3
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 09:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948571; x=1739553371;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ESceAsTExudZ77XUfniEGvmGfJT6Utl2V5clq/2RCOg=;
        b=aWrMGgHzKH5qciAEmHh8wkb8vnJKoDIMx0YXW0iO4yuWEcIaXlF7Mj/QO28Rta+eVF
         P48QGWOBYKDIzrxaLrlIpNM5dX2hUieezpIKacHKxApFAxOeULJDzxo1lA2ADO1t5a3f
         PEb9CUAozErQYd3WVhyMI+eeCnxKEjoOFBZMrw3Q8kL5wTyEfRWH2KctrL+1DtXNIzEF
         yvcNo76HDwbTLgDa2tnBxUS8FNfF2aY+jxrYlDik4Wld/4GzQYvUSo3YFy/3pvAdeXZC
         NLmiRRZ2hp1W7QQnseDYukryvlUG1ieqcKxl7N0IId4/7WfF6HnqBUe/y4rji3UOmma4
         FGoA==
X-Forwarded-Encrypted: i=1; AJvYcCWA6wQ3iX6Azb2BGjrU3wGEROOeKYTf6s647a6UNodAeE5WqME9csz1GgIeVxjsSEy8dWwqxPo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPj0ufxoENTy219Cp1ECzAVPtCLQ9Fe4gceT+DA1f8Sgub6NS7
	pa0lHWHJfMXIa95HZtIRio+oRQmYjBx9d9US5r1Upt3aVdccPFqEIGsQRUr2R9sIFy7dzXrklmw
	iP8bt873TIqP8LB3ZoJBgvUO0QnfqGcfpOmdyLkz09dwmvp+DKyg1Hr1Qo8Fz
X-Gm-Gg: ASbGncscs4Ndzo55k+2DxAYj/8XVmlffsV8q6Ha0SL+9Wt3c1OrQyjfuzWya7xQjnPV
	i6n041lj52pHj/7i0mH0b1TUkgEN/WS2JisLJbuxCQwaBCG+O5/wHNIxw9EpWoF5S1NegE9gCND
	ijAPHYPIxvKJoHrEO46iHCnbi1R+6CnVV2x3cLZlXKaYGNlxYuDxM1XwS9ZMf8oU/XHO1S/g2Uj
	DiRvx+mm9+j9jf355mUhqljcSCrbidwo7ZLdEnm+nLQR4nTKJoQvZJgMqKhrVJHUwAOB5OngmJx
	F/YeCq7JiNrMdYlMIXhnxkJnQwm9r6IQpoC9psjKPZDFvD0iXAbDw5P4smeh4KhUZxKN+kblEw=
	=
X-Received: by 2002:a17:90b:1e41:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2fa24064ed1mr6244361a91.9.1738948570918;
        Fri, 07 Feb 2025 09:16:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEC5gdVSnOo1ypRib+HlmiI4S2pQzXBdCb0LkjQhzhHuhLcbkgl0mCCCizqBBSy8508ItXkg==
X-Received: by 2002:a17:90b:1e41:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2fa24064ed1mr6244325a91.9.1738948570512;
        Fri, 07 Feb 2025 09:16:10 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa0942d30esm3622451a91.0.2025.02.07.09.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:16:10 -0800 (PST)
Message-ID: <5ffa4396-b6ff-4eea-9d44-fac5df2a47ac@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 09:16:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links() callback
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OMgLrhRdalGlQ5MCWEeyKE8wW1BoHF-C
X-Proofpoint-GUID: OMgLrhRdalGlQ5MCWEeyKE8wW1BoHF-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_171619_118026_EF661AC8 
X-CRM114-Status: GOOD (  14.28  )
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

On 2/4/2025 9:05 AM, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links().
> 
> This series aims to add support to handle links in change_vif_links()
> callback.
> 
> Patches 1-2 are making debug infra to work without device info.
> 
> Patches 3-8 are the ones changing the code to handle as mentioned above.
> 
> NOTE:
> * A new ath12k-check warning comes which probably needs to be added to
> ignore list
> 
> drivers/net/wireless/ath/ath12k/debug.c:69: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
> 
> This is because, since device info is not known can not use netdev_ or dev_
> dbg family. pr_debug() is an option but that will require DYNAMIC_DEBUG
> and then ath12k needs to be probed with dyndbg=+p which we don't want in
> ath. Hence, only option left is to use printk() directly.

A new version of ath12k-check has been pushed to
https://github.com/qca/qca-swiss-army-knife

Please update


