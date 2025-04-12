Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26219C369AF
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA63O+SGzPuj7ME2Ygbyh5CntFBF3jcXZzfIUfC/zHQ=; b=ekcx1/+0N1TscCLJefNpfiLaCM
	HvKMz2RfuBJAxrybkD45o7hdGItN6HJTopPvpZVZcHpmKx9nvH5JLnNCgk7EE29zLaMwfan9qRb/5
	+S41XEdXaiiHnAfEAiNMn0XTmK75XlJy7ZKauDwAcP0zfpRNK5aPu6hCB7gVqyrNTEQbPyYfl/niY
	DQfhmTWDIxKzMnJYbIwvUUhphEv/OF/gzNj84PgigCZMsevtdA73oouxlB0ynDTUaR9Xa8fTTah2T
	AYLrlhLlyMWvtRKManG6Vo363GMWh5V8Kw+xBehUftQyrzzPjuE3uYLKm+JsWTcNPIvjYnWCpqZ70
	ctVHXpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPk-0000000FPTF-3jFK
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPi-0000000FPPg-37va
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3x9sc007151
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eA63O+SGzPuj7ME2Ygbyh5CntFBF3jcXZzfIUfC/zHQ=; b=HVOt5lCI6tlgeu8f
	MRsU+yQALLqwN1r5h05juR+hycYsNxYm3XuvsNFS4+7R9I6moG/4p2MzGD1xz3t4
	A5RxDDsr8/Ay7W8uI0p4H7j5iUZFIO2H/KB4lwOYgrDIfRdNgi4e5zX1Zel4VbJc
	IA3E/qbEPpcsliBZGPSOzA6X2RkQdyZyCTAMIaGwG6yhoGMM40WxSLv7TG3UJ740
	/rJ/yzKrQ7qzytX79uRqOy7KtIyi0qmtZ0yyGAIxC1Om4+1oc0q59dHLClYh4rBX
	MTEZ0KIOvfFOtObFyObC+iF3C9zREyF4nT3lt8EPPEvrzk9DGK91oqoFQieycHkn
	u72cMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgj8474-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223fd6e9408so23769205ad.1
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431856; x=1745036656;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eA63O+SGzPuj7ME2Ygbyh5CntFBF3jcXZzfIUfC/zHQ=;
        b=waP4gPiXs/GOi1bvvefEwKGSR1M+PDPT62UbtxWe1ulBjTynh+iuPdUbUnWwYyUhYI
         fRF7QcdbO3dXJe3NJNxI1j033KL7TUqL+K00JMg2X7dFUg4pE/rgYyK/1O/bTXHwO83q
         bvuwtUysXEmYln9+V2p+KKVp2HbjPBfElgibd/kbZwUz7bHy1SGLA0zCu/cpLAbKeSa+
         LKEUNmBtsRlhPoc0nM5TfNZKtQHJFt6QxcQS1FTjLloWU35akWN/oVzC5mwwa+WWAiw/
         20JDgUUowZxrhwkiDVaFXBgJXsVulFfNGQ7lSvrG/8aWy1THxF27aGKTlEcefk0P5zOv
         ckNg==
X-Forwarded-Encrypted: i=1; AJvYcCUXLImof1phygPnvPN6YgUuuMsUNP6bER7HUVfwRu/qGrhqfmLAs33LjJhLHsIrdixePHSMG9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVtuxkKjtEaqbAKWkWQ6gAdu12xh+XcVmJfX8iC5NR/zy8XouI
	wbTCp6XHP3Bb0n7vb9topq3foxPSdLgCXw6+3iRHDy4++21oRIdhoG5mZvXPUY8tYe3M4RpT5Kz
	nvxgb6WD2wChaR1keO+mUK1X42Wor7NEwK5Iy7BvHsYe9VHmL/QreG+fV2wmc
X-Gm-Gg: ASbGncsL81ym2AODMAzi8Ntb84026O+nZs7A/tDixMAvAGSW/uRBzpIwiOgcAIkhZV4
	2Xu9Ftx7uwF+JUnULnQBXj28DKesnMcgVQc2jdxInlBOONcOj04SicjhNmK8oNTamqAiTTbUOtd
	y/p740mKHFjZiBjSbVvEi9fx78glkVnauGC6Kx2PpSNepulyKc58yh4uKs3BckEAvyfac35ZAjY
	EK8dWGaBr8RLC/dYKec2RBKTzACILNYnyrb62SE1YThXXj2amS46eYhM3RS7hvSPXKwnFc2JdRC
	YK99z9jHIO25ZVF62ycWcrKKY6txnbUjm9WVAxxekFC4WlG9
X-Received: by 2002:a17:902:f54f:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22b694abda1mr128293635ad.14.1744431856123;
        Fri, 11 Apr 2025 21:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEN6Mj6RXSGK2mkeAcX/+KDJ9rUyesfPv+0L4J1LE/cX9jrDBcP9xfm3Ns1S6lyYK8p5YElg==
X-Received: by 2002:a17:902:f54f:b0:220:ff82:1c60 with SMTP id d9443c01a7336-22b694abda1mr128293305ad.14.1744431855586;
        Fri, 11 Apr 2025 21:24:15 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v4 0/9] wifi: ath12k: fixes for rmmod and
 recovery issues with hardware grouping
Message-Id: <174443185481.2972989.8690863777364308065.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: Z3MSjJpe41RPd4ynN-5LJHneeklFqNHI
X-Proofpoint-ORIG-GUID: Z3MSjJpe41RPd4ynN-5LJHneeklFqNHI
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67f9eaf1 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ZRrjOVPENkOEQUbP29kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212418_989445_51CA075B 
X-CRM114-Status: UNSURE (   8.65  )
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


On Tue, 08 Apr 2025 11:36:28 +0530, Aditya Kumar Singh wrote:
> With hardware grouping, there is a kernel crash with signature -
> 
> $ rmmod ath12k.ko
> Unable to handle kernel paging request at virtual address 000000000000d1a8
> [...]
> Call trace:
>  ath12k_reg_free+0x14/0x74 [ath12k] (P)
>  ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k] (L)
>  ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k]
>  ath12k_core_deinit+0xd8/0x124 [ath12k]
>  ath12k_pci_remove+0x6c/0x130 [ath12k]
>  pci_device_remove+0x44/0xe8
>  device_remove+0x4c/0x80
>  device_release_driver_internal+0x1d0/0x22c
>  driver_detach+0x50/0x98
>  bus_remove_driver+0x70/0xf4
>  driver_unregister+0x30/0x60
>  pci_unregister_driver+0x24/0x9c
>  ath12k_pci_exit+0x18/0x24 [ath12k]
>  __arm64_sys_delete_module+0x1a0/0x2a8
>  invoke_syscall+0x48/0x110
>  el0_svc_common.constprop.0+0x40/0xe0
>  do_el0_svc+0x1c/0x28
>  el0_svc+0x30/0xd0
>  el0t_64_sync_handler+0x10c/0x138
>  el0t_64_sync+0x198/0x19c
> Code: a9bd7bfd 910003fd a9025bf5 91402015 (f968d6a1)
> ---[ end trace 0000000000000000 ]---
> Segmentation fault
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: fix SLUB BUG - Object already free in ath12k_reg_free()
      commit: 6d019abc402f58b25a7cab30b2d9af2f3173e4df
[2/9] wifi: ath12k: add reference counting for core attachment to hardware group
      commit: 62f3878fa290cb21535459311fe1dc008cd381da
[3/9] wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
      commit: dce7aec6b1f74b0a46b901ab8de1f7bd0515f733
[4/9] wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag handling
      commit: 6af396942bf132a1a49523e8fe2f816dc1ebd913
[5/9] wifi: ath12k: fix firmware assert during reboot with hardware grouping
      commit: 1d55625bc2a1c2a8c68153b020e1e097ea27f1b0
[6/9] wifi: ath12k: fix ath12k_core_pre_reconfigure_recovery() with grouping
      commit: 718ead261feba32b00f8ef1d3dff7527106b9458
[7/9] wifi: ath12k: handle ath12k_core_restart() with hardware grouping
      commit: 3e1312f01b508d3f77147bec5286caef074e5d9e
[8/9] wifi: ath12k: handle ath12k_core_reset() with hardware grouping
      commit: 929069c1bdb70c6332c15f3978d4c8830bc43efd
[9/9] wifi: ath12k: reset MLO global memory during recovery
      commit: f5755c23ed8a4603194f6425828a2760f814e117

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


