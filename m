Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC24C3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rPJvbK708nKLqv7QHHGj//BT/jZMd+wf9IwoNFeDmZg=; b=Pei+0DkkLodDy9
	pN+Skyd1335VfIadeLJAXKiNUhxMK0P0Eq86ZKBxW1KLM3DvZ/h+ayex9Y7+biBhtxVpQT2JfNPQW
	tO/S6hB8DuZEvWkpPBuvC8iL6I5sqXWaQKD6Q1zPU0SDGgUFhiS3KTC5xoIj62tZCiGBmM75xADZx
	PJ7S9b5AzptU5ZLQjd2yGkmQRFqNb9ntuT0WpIHtV3iSrNddfSJv7vWS8ms5x4cVS+ljar+slOoVC
	jpQ/yZ2/49i4iwt8WxO0VNuEAcIYVOrWnQVrP93OKBr8qZLHVeKRgy5PfO2gqItFVZ0ArE+r4eyXR
	GzVNH4Tlct5bMO+K2Opw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226h-00000002qiz-1hNS
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:06:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226e-00000002qi6-3giD
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:06:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GN3S014995
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rPJvbK708nKLqv7QHHGj//
	BT/jZMd+wf9IwoNFeDmZg=; b=AdrrdRgdaTlk/sJkmnZqf4pX74Rp6uWoz2dahR
	WUDh7bvIPxySJUMZtrcWa/OXD1vvAEemkxsosINC93hkTUPYuYTTHc9wF2v29FFr
	VY7KTtOcDUB0qcj2+HBoB1T07EF82oS7rQ0fHfpgcycNdmJtlvQ9FKfDjDmKHMc5
	N/kWNi8XC1gFG0jQ7+sh1oXMKvUswl8lQHBp/IluJrR1vGoCLMKVMw4ZFjC+RkWu
	jr0etUqOkowc4SwNAp+E2IxkQ0CHrE7ktDL/EQ6dTrIPcCnFV8fDeqXBU5Mt7mOj
	wpXzd9lyCSiu4vAE7iD0j0Cq+N2wgjyf+SIbYVqFqI7Goi6g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuepcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:06:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-739525d4d7bso4061828b3a.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092402; x=1744697202;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPJvbK708nKLqv7QHHGj//BT/jZMd+wf9IwoNFeDmZg=;
        b=PWcadTnZqw0bhNa68qkyqAM2nWh00X7zJwHAPB7GmBO9hwZ5+ck1cfp1bM2fJ909bT
         R5Ji8CTRGSEzrY6kdrGCNL92o2cnhU7VKXc2rXJ6j4WLta4Er62fcNkt0EVjvCkn9ItG
         C9OZ4CXEsn5qZfAG6HWl1emSW5LwmT833TdiYDmBiFkpHv2SglVleOVi4hoQIKEw/wtZ
         saHaz0wdPVE+eMJskzvAKqCk10tdUE7529l3odvxDd5e21iSHJKLmGRw628vgMRHf1lG
         bry5XtfzDbz71ndYm1DLnQJCEcW/z9jcoFWS+cHCo3Rwbb04iylrj4lt8yR2NEDpy7Ja
         yq5w==
X-Forwarded-Encrypted: i=1; AJvYcCVZkHAzcYDKnvnxaQ0XBhMeuNcaLyMYE5j//SlnImk39ivAMI44z68CF7I0ZoZa5euLKT/GDaw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTmbsnCV0yne97N/zyb8z4M6rFOLj805XdvBnK6rY+tsBX0a3S
	rXljl5lF7BfW5j5j+udAU6B9CeUEWIL2QeFAYGVINGfoiferOlxOq3NtXTPJcxD/kA1DZ/msg0p
	rYobz33NxgRpC3E83JLlyCvku9sUTf4tCTCwj/MDo/h/MovRiFlBXxh1ffEJ1vk5ALEHc
X-Gm-Gg: ASbGnctlF2qdz0e3hpPUS3A8dcbLMvLYf+SPG2fz9CD8nm2fx8ATgOfLOqBERCpTF+V
	IWZT8SbcpdLYoMkQflMluwUb/mkuMZ3EOi1/KJfAlh4AoWYRqwxNNA2jifCjbzgPo4FziEkTCRz
	4fTVrOBS/WJ8UAMiAk2cK1vuYffH5Z4T6zdDmeZu/WSwIoXvJ1NbriQWwdz1dJaTpJ63KitnPdF
	pe8xEm+jWMbSqnzEjELvyaTYttx3oIg/xsrgjh4jeoa/zbV1k0UB2u76sTznmqhbln3igKzOki/
	tvzKgZAyMBCjBS3a+6lmHJTxtpL324PMQzR03ZvIuD9J+uc5OLZXrZWsTUV/JUASdbBNh9t6SuT
	F+rVvN5UQMv7GLyWIi2e5XQLZ584TZZFPbHZNhvcW
X-Received: by 2002:a05:6a20:c78e:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-201047315d9mr18142216637.42.1744092402509;
        Mon, 07 Apr 2025 23:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDQGkfHHXHzQnzn2S7sZR/SlqyFD4E76f4ItSX8gh3a16V1yPXO+CG98vBVOmnzhJbyAvBCQ==
X-Received: by 2002:a05:6a20:c78e:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-201047315d9mr18142189637.42.1744092402103;
        Mon, 07 Apr 2025 23:06:42 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:41 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v4 0/9] wifi: ath12k: fixes for rmmod and recovery
 issues with hardware grouping
Date: Tue, 08 Apr 2025 11:36:28 +0530
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOS89GcC/43OwW7DIAyA4VepOI/JmGRJetp7TBMKxA0+DDoga
 acq7z6UU7VdcrQsf78fIlNiyuJ8eohEK2eOoQ7Ny0k4P4aZJE91FgjYKFS9vPDdJLIxFsM5L5T
 NjYs3/mbmFJcrh1mCw0m/dWPbd1ZU6JqoXu2RDzEWLwPdi/isG8+5xPSz11e172uoBQXDkdCqJ
 MiL1QM50E2r6P17YcfBvbr4tQdWfEIRDqFYUdtN0GlrcUT8j+pntDmE6opqHECDVf00/Pl027Z
 fRrvTnIoBAAA=
X-Change-ID: 20241218-fix_reboot_issues_with_hw_grouping-0c2d367a587b
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 0ZbVcMcVu_oLdlYQihyj2S-sKBIGahVI
X-Proofpoint-ORIG-GUID: 0ZbVcMcVu_oLdlYQihyj2S-sKBIGahVI
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f4bcf3 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=3fJN4-It2fq8u9xqJHoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230644_938410_FC8FEF95 
X-CRM114-Status: GOOD (  11.77  )
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

With hardware grouping, there is a kernel crash with signature -

$ rmmod ath12k.ko
Unable to handle kernel paging request at virtual address 000000000000d1a8
[...]
Call trace:
 ath12k_reg_free+0x14/0x74 [ath12k] (P)
 ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k] (L)
 ath12k_core_hw_group_destroy+0x7c/0xb4 [ath12k]
 ath12k_core_deinit+0xd8/0x124 [ath12k]
 ath12k_pci_remove+0x6c/0x130 [ath12k]
 pci_device_remove+0x44/0xe8
 device_remove+0x4c/0x80
 device_release_driver_internal+0x1d0/0x22c
 driver_detach+0x50/0x98
 bus_remove_driver+0x70/0xf4
 driver_unregister+0x30/0x60
 pci_unregister_driver+0x24/0x9c
 ath12k_pci_exit+0x18/0x24 [ath12k]
 __arm64_sys_delete_module+0x1a0/0x2a8
 invoke_syscall+0x48/0x110
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x10c/0x138
 el0t_64_sync+0x198/0x19c
Code: a9bd7bfd 910003fd a9025bf5 91402015 (f968d6a1)
---[ end trace 0000000000000000 ]---
Segmentation fault

This series aims to fix this stability issue. With this now, 100+ iteration
of rmmod and insmod works perfectly.

Also, firmware recovery with grouping is not working fine. Randomly, some
NULL pointer crash or another firmware assert is seen. This series aims to
fix that as well.

With this in place now, 100+ iteration of firmware recovery with one 3 link
AP MLD up works fine.

---
Changes in v4:
- Rebased on ToT.
- Fixed potential deadlock warning.
- Moved to oss email from quicinc.
- Link to v3: https://lore.kernel.org/r/20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com

Changes in v3:
- Rebased on ToT due to FTM changes conflict.
- Link to v2: https://lore.kernel.org/r/20250120-fix_reboot_issues_with_hw_grouping-v2-0-b7d073bb2a22@quicinc.com

Changes in v2:
- Rebased on ToT.
- No changes in 1-4, 6-10.
- Removed regd_freed flag in 5.
- Link to v1: https://lore.kernel.org/r/20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com

---
Aditya Kumar Singh (9):
      wifi: ath12k: fix SLUB BUG - Object already free in ath12k_reg_free()
      wifi: ath12k: add reference counting for core attachment to hardware group
      wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
      wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag handling
      wifi: ath12k: fix firmware assert during reboot with hardware grouping
      wifi: ath12k: fix ath12k_core_pre_reconfigure_recovery() with grouping
      wifi: ath12k: handle ath12k_core_restart() with hardware grouping
      wifi: ath12k: handle ath12k_core_reset() with hardware grouping
      wifi: ath12k: reset MLO global memory during recovery

 drivers/net/wireless/ath/ath12k/core.c | 110 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/core.h |  15 +----
 drivers/net/wireless/ath/ath12k/mac.c  |   6 --
 drivers/net/wireless/ath/ath12k/pci.c  |  26 +++++++-
 drivers/net/wireless/ath/ath12k/qmi.c  |  22 +++++++
 drivers/net/wireless/ath/ath12k/qmi.h  |   2 +
 drivers/net/wireless/ath/ath12k/reg.c  |   4 ++
 7 files changed, 156 insertions(+), 29 deletions(-)
---
base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
change-id: 20241218-fix_reboot_issues_with_hw_grouping-0c2d367a587b


