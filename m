Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79499C3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nf+YD0JUduHNY62GZnwhY//dQoWGXvLoHNfYX/qspzk=; b=vgpnGxmk4n41O78IDfs8FB2K4V
	x4cvdYR+EMWlog0tmjY5EbnwIzlDmGSp6Xw8bBGuZngx6Gq4JCbQ9Fi116diqxZyhsrIEheGI13Pa
	oyGpZm0Lijgu7UFNmvWhStONdtsoj1dlm7h5JiGKTM8jMT0zz07cTKee7u8clsHNNujTpjEccZLyo
	TjJzhPhgDKws+WT5s7u0KYEJEYFgdcNkTRv0yqiRBvnlxrpOZ/ieD5tACVSFDvzeKO8p5rHXypEYL
	Ry23oWFDBjeamSzAzYBeRCa5WV7RgA3zrOZEJKd/EiEw5jcYpAZlpRhj0XltRBSR0AyBMlI+zNk0w
	GITu+zsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25dX-00000003WJf-0uEo
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 09:52:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25bR-00000003Vky-0euM
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 09:50:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GLo9000841
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf+YD0JUduHNY62GZnwhY//dQoWGXvLoHNfYX/qspzk=; b=ZpgxqaDmhAJUGMyM
	ydcH6xdIqK39cv5NeNH8bng1vnDCun6CF0Ta0zwvWWIBsVq7IPQ4ZDpcaMtPdESC
	CjLOOFkonYOx2UCtvCX1El0CtGko64V3hqfeIRTBjN4v6LDDYr1EF6SjRv7MqV+h
	zqS1WUeBHinsZkbWUZjWYCf4jgjb/tuYWH+tlvV0J3FcWP6bqPLX2jCtyRCTVhsD
	OjDWtWiQYKLJzkf2GqdPqSwN9UXBFZyCxSsI8DQhADWfw2evUI/9l3HWpn3c3q9Q
	8ZbRwU9uPu1WLIFRz4CEI/wU1aBNB3ZJSVVr2BlUNALVt5W8IztyZsYToDVKQNX1
	Nyh5KA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7bek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 09:50:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so4366425a91.1
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 02:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105834; x=1744710634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf+YD0JUduHNY62GZnwhY//dQoWGXvLoHNfYX/qspzk=;
        b=icT8iFNuWmJBqKWXAxcIksERc5Kjpfvdc851t4adwtyV6HQCPPrcwdrNop+3U4AoIg
         a3NFklsHh+UXnkq4lYR+eTHL+6BmAHyJh3EU2GNSNcXAdEGprPACykXSEKG2KsEaaNmr
         GIf0YgvOVMOYm2g8hmGc4aZ2AqVcxq9l/kcFfJUmwo6kvNdhCpEwL/c/T3kfJWye5AX0
         qx0pHsL5454LbIWDTe6WJm6Sc1Z8zYwm88TowYAkMGpl4RJDxjFN13aFfeGsZtQIsOEx
         0X130Jg/fDxhKvhkMoxJ6wwonKMca2NpbcPPfHgXeWeYVH284CGIOfigB+j/FvV9zd+w
         UQig==
X-Forwarded-Encrypted: i=1; AJvYcCWNyQxtx+N5kp69kRQOl1Ig1rMrMaOgykDc2OwNeMDGSvwF0O6j2m7pPEwh9r1xi6h92HjcxQM=@lists.infradead.org
X-Gm-Message-State: AOJu0YylAEuzWEFwTlYjF7r/XfZrdsEP6MVf3o+HFQe0w+axiXYCCw7x
	VRLOGuyBCCWkVCBML+Iw5IPw/YMoBD8OUUEYMRBDvNUkCNlOvxqQDi210bRf4Cd7tg4sXKcKiRn
	A0uDlYACbVVY/qe15QF9rL/f7Nl2K1rSEn5Fq65dyMxH2L3HFI1ClNRgzuRf7
X-Gm-Gg: ASbGnctiSMZDk9BaPysoF6Mxqh33anIws5+o4mGd3cF44DYO28iDNAt/BkTKnTBm4e5
	+qmHbw4w20wgoZ3hesTUCqFxDDsXkTHGrNcYB72jHF4LJ7gIBtn/HXbvkzUKas1HXTf7dW/N7Rt
	8fMsQQ+IMWdHyCbzed+AKDA4flGSo+FzKTRYia0g2zcBYsWc9JP+y586gSLpECU6n8vSUHXYamR
	sogxVxYQULqQwdEDbGoitZ8OfKQYUrAH+v8KgBk1P2Bj0UuYZ959Xgp0PFnwDBAIartw8LdBBE6
	uqAB+61tyOeAMGpDL4uenbCA7/8pAZJF3VKPMUSRSd2M97yiSEamDRBBZA==
X-Received: by 2002:a17:90b:2707:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-306d0bec159mr4286459a91.8.1744105833811;
        Tue, 08 Apr 2025 02:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc8riaw/43fthr3kZrTyHTspAfvT7Hvw0cgykTvgUbS5FIXnM7tvSbldKnJOZSfB56vzweSw==
X-Received: by 2002:a17:90b:2707:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-306d0bec159mr4286417a91.8.1744105833433;
        Tue, 08 Apr 2025 02:50:33 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad943sm96212295ad.23.2025.04.08.02.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:50:33 -0700 (PDT)
Message-ID: <ce8b30c9-45bc-740e-156c-dd51000d2982@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 15:20:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v4 1/9] wifi: ath12k: fix SLUB BUG - Object
 already free in ath12k_reg_free()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
 <20250408-fix_reboot_issues_with_hw_grouping-v4-1-95e7bf048595@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-1-95e7bf048595@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e7GaBJxHCvW2T2qTrJSgl_PcFpURs3Wi
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f4f172 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QSDNZ9PZ-Eu8teISbnYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: e7GaBJxHCvW2T2qTrJSgl_PcFpURs3Wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=528 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025045_206826_AA473B75 
X-CRM114-Status: UNSURE (   9.94  )
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



On 4/8/2025 11:36 AM, Aditya Kumar Singh wrote:
> During rmmod of ath12k module with SLUB debug enabled, following print is
> seen -
> 
> =============================================================================
> BUG kmalloc-1k (Not tainted): Object already free
> -----------------------------------------------------------------------------
> 
> Allocated in ath12k_reg_build_regd+0x94/0xa20 [ath12k] age=10470 cpu=0 pid=0
>   __kmalloc_noprof+0xf4/0x368
>   ath12k_reg_build_regd+0x94/0xa20 [ath12k]
>   ath12k_wmi_op_rx+0x199c/0x2c14 [ath12k]
>   ath12k_htc_rx_completion_handler+0x398/0x554 [ath12k]
>   ath12k_ce_per_engine_service+0x248/0x368 [ath12k]
>   ath12k_pci_ce_workqueue+0x28/0x50 [ath12k]
>   process_one_work+0x14c/0x28c
>   bh_worker+0x22c/0x27c
>   workqueue_softirq_action+0x80/0x90
>   tasklet_action+0x14/0x3c
>   handle_softirqs+0x108/0x240
>   __do_softirq+0x14/0x20
> Freed in ath12k_reg_free+0x40/0x74 [ath12k] age=136 cpu=2 pid=166
>   kfree+0x148/0x248
>   ath12k_reg_free+0x40/0x74 [ath12k]
>   ath12k_core_hw_group_destroy+0x68/0xac [ath12k]
>   ath12k_core_deinit+0xd8/0x124 [ath12k]
>   ath12k_pci_remove+0x6c/0x130 [ath12k]
>   pci_device_remove+0x44/0xe8
>   device_remove+0x4c/0x80
>   device_release_driver_internal+0x1d0/0x22c
>   driver_detach+0x50/0x98
>   bus_remove_driver+0x70/0xf4
>   driver_unregister+0x30/0x60
>   pci_unregister_driver+0x24/0x9c
>   ath12k_pci_exit+0x18/0x24 [ath12k]
>   __arm64_sys_delete_module+0x1a0/0x2a8
>   invoke_syscall+0x48/0x110
>   el0_svc_common.constprop.0+0x40/0xe0
> Slab 0xfffffdffc0033600 objects=10 used=6 fp=0xffff000000cdcc00 flags=0x3fffe0000000240(workingset|head|node=0|zone=0|lastcpupid=0x1ffff)
> Object 0xffff000000cdcc00 @offset=19456 fp=0xffff000000cde400
> [...]
> 
> This issue arises because in ath12k_core_hw_group_destroy(), each device
> calls ath12k_core_soc_destroy() for itself and all its partners within the
> same group. Since ath12k_core_hw_group_destroy() is invoked for each
> device, this results in a double free condition, eventually causing the
> SLUB bug.
> 
> To resolve this, set the freed pointers to NULL. And since there could be
> a race condition to read these pointers, guard these with the available
> mutex lock.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

