Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514CC71141
	for <ath12k@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=; b=xAuzShCWfmdtA+4BYQMVfNtgD3
	cm6sJ5U/1i1ppevsl5y5lAuzK9TVjPUBgr+vSMY+CsuDYh389AaLrL/QKtLjupOMjsf1x5M5M7knz
	wocHG6l2wrhXgIWSy2Qm2aV8Y91UQQ6zICI1O+lfXFU+f9aRnu+NY7DNd3IFNVSDLkXbVdRARC+c4
	6lMP3KBRTieMzigRAySLo74So2nMvYsVOjY9cScqKGrNtEk9Tg1X1uSbvcZMiZJwqznHIPK++5NAu
	751fxIyR0UPES6g9oEv6ULYls2OdendcIlQ1nMG7Fyq5WbQoHgEbmgMZtqtX9jVv1wqNM6HI/+I9e
	M2OQMAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW9-0000000B0om-060v;
	Wed, 11 Jun 2025 19:53:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMFk-0000000A4hR-1EkJ
	for ath12k@lists.infradead.org;
	Wed, 11 Jun 2025 14:16:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFUY027198
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 14:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=; b=D5rR6Lo4tH82NjFO
	zo93parf46fMAkn3Ef8nfSo4pkKB1jWec2eL2rAceQayQMoPmusaAAPCXOOVphka
	NO4HWsiBQkmWXKsttGjMsPl8s0y1NczDz3vGOWrFbLKGiFH5kBaPrPq+8rpaXPdh
	5pTLsLgNlZu3JxrkkKKLh/5YfS1zHwCuTE40BXqW+vt22TqKeatk4Uv4gjUrRRHC
	uCYpxNlh6QvhfkoSMf37xr7grzMuWsFp5WLtd+ka4h0g5buP/1ZNr6P1hb3qpVvg
	7ZM++kv1T8HFahGUXWlSolJTUycLX5LoHVc/7qTylJKFHCtLtU5DsmsT91S9UNzK
	qXAWSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvd591-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 14:16:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f6b829cfso48490885ad.2
        for <ath12k@lists.infradead.org>; Wed, 11 Jun 2025 07:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651390; x=1750256190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=;
        b=M/EslQcdMynwam3WnTbDLQv+QCcq4fgRvvew8AjZhbxw8sD07NlHlg1jvrg1aO06Ql
         eA+1eUJ/SIt5IJYHMwIkPCAybh9DmKWJyfgYBROM+unWHHSVIoBG+8FMxwWSTVCF+S6c
         /VbM5Ri5ZgOiR/svhEz73F2eXSHL1RYOhiJiwi26V3mGTmHwNZ9bsNHTDfskX1IwcOqz
         yQjcqT2nVF6CZKAqoxjCMAxowk8R/pq1Zg2IXoEiXnpX/kuP+pl8X6jj3iaFn7OcOEL/
         9K9UolANGVxmn4ogLVM/8VSAFRT60y1+VtfMGZqfYAQKMLvsgnHqJNPC4M9cMvL3wxHM
         XHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl98JaPmDluaKu7dCDebp8evU6Om0x7l3HwztnqpyH79AslP0ivETG17i1VYuAj4HEYYhNyNk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxThtLE7Lp80yngCuu9VGThLRnu93Wglkdhdi2FE00Xi6p5x8pE
	FhqpNPqmhYTS3ziOFu8HGykgCrwpcJoXTj3rEJUNjphK5Mge6orSuiEFlQLgFFC49k/vZiyzUFT
	I/OtU1HEbkMUwsAy3zyy2FTPdO48Vrbn+QICQgjB7zdptCk53XLGF15TyUhxwGd1D
X-Gm-Gg: ASbGncs1Mqpd8KCaxZvm1DZGr8f24yKcGKojhoy3SIoA7N1fZnjMVYMVt1r78sYuvdr
	k/52mKPIqOzDBA046loaDpTgwz5qxQCs+azpOvURz1aFVyp6/3FAJVX3wnKoH9mRGtScvkFUWZ0
	+kU9SzqdT1Qmo0a8PPuZc2wfCeBVoVLFsxSvt/Cn3VEbZ3CKQ004sfu4ZCFp0Q6vk2kpACO4sfq
	wIXDCBBx/DK+Q4QQ1nPKepAMraMu/vf66nWJ+uMn3hCq7QY0HOslo7/axxMIIeaLLGOppZYdG/s
	jJt7o7zVgOl2euYNzmeQeZkVrE89SLuJOXt2v3u2Qc47vm5xWGXUUqz9A5AYKhY+m6h3XBagvA/
	46A==
X-Received: by 2002:a17:902:d592:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23642683e35mr36093385ad.33.1749651389465;
        Wed, 11 Jun 2025 07:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2uDBQ8igKkYBTsTg0Ikh+u0ovDEWJVCVLhqrSErAiNGtYCfNi9+9t1iCO2ygTczxCDh5jCQ==
X-Received: by 2002:a17:902:d592:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23642683e35mr36092995ad.33.1749651389013;
        Wed, 11 Jun 2025 07:16:29 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410b4csm88301575ad.212.2025.06.11.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:16:28 -0700 (PDT)
Message-ID: <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 07:16:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20250608
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 24kRVsN3t2pAtV8v3fIaUI5xYxsNhG9N
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68498fbe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=mf2Hrz4NSIj861Bm59oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 24kRVsN3t2pAtV8v3fIaUI5xYxsNhG9N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOSBTYWx0ZWRfXxB3AsUdHkLKA
 lwcA1odop6Hu2lijEBf4bUE2UosjIQwf/5U9YbPLYBnZssJWzkx9Np7t596bpV7wsX1jnMXPBca
 YosZAk3n2w8gt+lO5ai7/sDrZClp6Q4xwdttaJG8tKe/94JQZNWWKbh+MyI6j5XVW4HlO8hCVhH
 cr1NOaQqG+yZGDqgKH3avx2v4d3W8qynQgcnDRW9LfU2tAhl7+lXiqfNSsKrxcoDSPG/CXG/a5X
 GAkjRk46j8Q/wcKmDnP7RloLzR9qB5ckTom72VAzyShyg5RC1oPk7SMGQZZ+9K4aJBJ9Bxp9iao
 ZmKPqf8llmytxu/49i68U6ZvNmqb5SqrOqlg39uag5Dc0NA6sIIGVp+IVpWUBEZAqKW17gCM0+0
 HI6Lw2Y64+crGdrTaiTpNiBGY0BhatDQmuhESClg5ZszQdgcRXsq84BzrQEV+kAENRFZMRkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071632_332027_711E8E38 
X-CRM114-Status: GOOD (  16.13  )
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

On 6/8/2025 10:07 AM, Jeff Johnson wrote:
> The following changes since commit 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21:
> 
>   Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2025-05-28 15:24:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250608
> 
> for you to fetch changes up to f3fe49dbddd73f0155a8935af47cb63693069dbe:
> 
>   wifi: ath12k: fix uaf in ath12k_core_init() (2025-06-07 07:41:50 -0700)
> 
> ----------------------------------------------------------------
> ath.git updates for v6.16-rc2
> 
> Fix a handful of both build and stability issues across multiple drivers.
> 
> ----------------------------------------------------------------
> Baochen Qiang (8):
>       wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
>       wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
>       wifi: ath11k: don't wait when there is no vdev started
>       wifi: ath11k: move some firmware stats related functions outside of debugfs
>       wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
>       wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
>       wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
>       wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
> 
> Caleb Connolly (1):
>       ath10k: snoc: fix unbalanced IRQ enable in crash recovery
> 
> Jeff Johnson (1):
>       wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
> 
> Loic Poulain (1):
>       wifi: ath10k: Avoid vdev delete timeout when firmware is already down
> 
> Miaoqing Pan (1):
>       wifi: ath12k: fix uaf in ath12k_core_init()
> 
> Rodrigo Gobbi (1):
>       wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
> 
> Sebastian Gottschall (1):
>       wil6210: fix support for sparrow chipsets
> 
>  drivers/net/wireless/ath/ath10k/mac.c        |  33 ++++--
>  drivers/net/wireless/ath/ath10k/snoc.c       |   4 +-
>  drivers/net/wireless/ath/ath11k/core.c       |  29 +++---
>  drivers/net/wireless/ath/ath11k/core.h       |   4 +-
>  drivers/net/wireless/ath/ath11k/debugfs.c    | 148 +++------------------------
>  drivers/net/wireless/ath/ath11k/debugfs.h    |  10 +-
>  drivers/net/wireless/ath/ath11k/mac.c        | 127 +++++++++++++++--------
>  drivers/net/wireless/ath/ath11k/mac.h        |   4 +-
>  drivers/net/wireless/ath/ath11k/wmi.c        |  49 +++++++--
>  drivers/net/wireless/ath/ath12k/core.c       |  10 +-
>  drivers/net/wireless/ath/ath12k/hal.h        |   3 +-
>  drivers/net/wireless/ath/ath12k/hw.c         |   6 ++
>  drivers/net/wireless/ath/ath12k/hw.h         |   2 +
>  drivers/net/wireless/ath/ath12k/pci.c        |   6 +-
>  drivers/net/wireless/ath/ath12k/pci.h        |   4 +-
>  drivers/net/wireless/ath/wil6210/interrupt.c |  26 +++--
>  16 files changed, 228 insertions(+), 237 deletions(-)

Johannes,
I'm accumulating some more patches for "current". It would be nice to get this
first set pulled so that I can cleanly fast-forward and apply the next set.

Thanks!
/jeff

