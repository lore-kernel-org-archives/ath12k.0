Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB34C3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 06:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRh4aDWzSVC8Ic0j6UCADc43xdjA1WQ09ueDbR4CgJ4=; b=dOJvmEDkB3UylloVoiucM54qH/
	RhbolPmD+og0jHmeIwDyM52qPcMQlODM9i282PqYSf5DDhdrfB5MesZkFMB9c2sl6XVXxquULJZGU
	bcMp1PkX3FbJ29kJhmyMx0unyRtgY5eeVIfqvq9YVwae6RvyobGruJCcg35HWenj82FXnvaWC8pXE
	8WYgwq9P0sfCWpVggtcEvr7vH3oVeYzdERhSN2uDEuvb6gLa3V8NlzAwbwSe/IcX8by8AsYPB6uUN
	DekIMZWBWtNvide75yKbtsXzSfzjpJ242sQumoTPsD2AkpdhbGSXvCwFzgV5vkZv4gfsit4SXjzcx
	2thMq6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u228T-00000002r4I-2t1k
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 06:08:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u226h-00000002qik-0Vlg
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 06:06:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382JKix014111
	for <ath12k@lists.infradead.org>; Tue, 8 Apr 2025 06:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRh4aDWzSVC8Ic0j6UCADc43xdjA1WQ09ueDbR4CgJ4=; b=RjR5P/NCFhe+D0Q5
	2Tx7W4ozMJ116r/3m0wRblUucZXdy/+WMiVyyFIRRdEDexbC/WIAN/CFgSAWhHTb
	0+kjXKs2z2E/5r37/0RfYyIWKqTGGp2+d/cg1XOTMm9ULWjO2oYJ5Haab8yKeDu1
	Xz1SW+FgmwxcgrtBjwDbVw7HxSk2Fqe4uKh0YdpXtcGWUT7fZlAvES1myb6hMvkY
	V7IFZtuqzDPg7c2xDlp3qu/u9XC/33rL4N+7RxsRAD7MYew79DO0LnV5nNAuqSLe
	wwyd80gLJIelh0E0CxfB/4feojWH5zXU3/qSRPqc50VLaBGS6ljvN2fvJlXFySzQ
	ywIGbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm6ng8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 06:06:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395095a505so4026544b3a.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 23:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092405; x=1744697205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRh4aDWzSVC8Ic0j6UCADc43xdjA1WQ09ueDbR4CgJ4=;
        b=nQH4eoa1+bNuj3JblE94BwapjDwatwIRuOAq0OgGWtU3+awVbOWm9qSRyvtKhP1VWW
         8d6qShlFUniclbUlP27g0PkFLg9j1onuQDtifBKY3EDu0baj3OfxHh2YXuYbHzrC8e9Y
         UoNc4N5pw+qz8kHbmMsYvkRcJh+MjVkB+iCZ52CS4g4cqC2f4ld3VPuQCYHmjfp/LQkC
         /pqiFglTrMqo5gwpLmsVaXObiDldLspYQhfHKBvO+Mj8yO9j03h+ccPCSU9PLLcAoLwh
         Vk9hTM2QLNJySBm4zaGU79qbejc48w0C7kIqoeSR40QXuKqpjhFNtuAp2q2Sf9loybXY
         QeHA==
X-Forwarded-Encrypted: i=1; AJvYcCWlmDHYkUFftsiCj9uwzAzHkst3ACsVcneXSFoz4d/olvmueiPsvhaGRAV7YfT1rkLnU/ONQx0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6NeIybMYIUh6JnZGGotHc7Cj+LVW9DX1lbO15jJDecWC4a1md
	4KA2pWBwaIOiyU4JY31bXhmj5ar6lPKWL8K2Lh0rT4NDy+H1tPUSV0Oj47n2mupMb/T3zfE6EU9
	X1a0uqXP1KvUapJjO3NKx1hLhVT9T4P0qJ66nsq1mBk7f4WuVZ7qiwfulGG3yTub3KzdE
X-Gm-Gg: ASbGncsPk4O9r+SjXolLBDcHCYBKwVG+Ok5BzaLh6iJqQdRcUJH+vRlxfTABIGuqj3Q
	IQwod/4/XkwcLb8hl+bAJM9SXmRRt/O997eQx2XHAW6o8pySKVIPYpV6cj0tN+Q/MMu1Rxk+5YI
	oomZGLTP+/tCCQjAzI/4E2VRM53szJQevRTKw4JuviYaaMJ5FId6lkLkqqvEjPaICEuNsi2lPWp
	us82WUGbcvwcnEKAa5ESEWmAlx7WdrntSSOAWrGJWsSs9+80dY9aAmX6w26ZoR9dcIwes/+Tl0N
	rQm3quk/XvoFEmqXxlLGwOog9x0hFDHRC1mD32A3KyTJRyfVGi6Qm/tEQsh2TQQyQbd0AV2JdGc
	2w+N9opsS/UHHz5OVZ5l0C204pbf9WwbIcv1Mm8Q1
X-Received: by 2002:a05:6a20:430e:b0:1f5:9aac:64dc with SMTP id adf61e73a8af0-201046669b7mr21491144637.20.1744092405535;
        Mon, 07 Apr 2025 23:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE49W85eT/fLzhiTWBG/SxZbu6DecyAqbza+jaSMRXdtL50P/KdWMEi40rhdrIzkfKQ5rqfw==
X-Received: by 2002:a05:6a20:430e:b0:1f5:9aac:64dc with SMTP id adf61e73a8af0-201046669b7mr21491106637.20.1744092405175;
        Mon, 07 Apr 2025 23:06:45 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc35079fsm6863981a12.41.2025.04.07.23.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:06:44 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 11:36:29 +0530
Subject: [PATCH ath-next v4 1/9] wifi: ath12k: fix SLUB BUG - Object
 already free in ath12k_reg_free()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-fix_reboot_issues_with_hw_grouping-v4-1-95e7bf048595@oss.qualcomm.com>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: KiMH2OTRuv46mZWarXUBwHYa91BIfWGy
X-Proofpoint-ORIG-GUID: KiMH2OTRuv46mZWarXUBwHYa91BIfWGy
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f4bcf6 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Qd74P0o9topwJXlKkrcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_02,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=4
 mlxlogscore=804 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=4 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_230647_171013_B5C03BD9 
X-CRM114-Status: GOOD (  12.21  )
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

During rmmod of ath12k module with SLUB debug enabled, following print is
seen -

=============================================================================
BUG kmalloc-1k (Not tainted): Object already free
-----------------------------------------------------------------------------

Allocated in ath12k_reg_build_regd+0x94/0xa20 [ath12k] age=10470 cpu=0 pid=0
 __kmalloc_noprof+0xf4/0x368
 ath12k_reg_build_regd+0x94/0xa20 [ath12k]
 ath12k_wmi_op_rx+0x199c/0x2c14 [ath12k]
 ath12k_htc_rx_completion_handler+0x398/0x554 [ath12k]
 ath12k_ce_per_engine_service+0x248/0x368 [ath12k]
 ath12k_pci_ce_workqueue+0x28/0x50 [ath12k]
 process_one_work+0x14c/0x28c
 bh_worker+0x22c/0x27c
 workqueue_softirq_action+0x80/0x90
 tasklet_action+0x14/0x3c
 handle_softirqs+0x108/0x240
 __do_softirq+0x14/0x20
Freed in ath12k_reg_free+0x40/0x74 [ath12k] age=136 cpu=2 pid=166
 kfree+0x148/0x248
 ath12k_reg_free+0x40/0x74 [ath12k]
 ath12k_core_hw_group_destroy+0x68/0xac [ath12k]
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
Slab 0xfffffdffc0033600 objects=10 used=6 fp=0xffff000000cdcc00 flags=0x3fffe0000000240(workingset|head|node=0|zone=0|lastcpupid=0x1ffff)
Object 0xffff000000cdcc00 @offset=19456 fp=0xffff000000cde400
[...]

This issue arises because in ath12k_core_hw_group_destroy(), each device
calls ath12k_core_soc_destroy() for itself and all its partners within the
same group. Since ath12k_core_hw_group_destroy() is invoked for each
device, this results in a double free condition, eventually causing the
SLUB bug.

To resolve this, set the freed pointers to NULL. And since there could be
a race condition to read these pointers, guard these with the available
mutex lock.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/reg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 893650f76fb2d9f24177d524c5a979693b543657..3260df2ad60059117d5340c27a3b82fdcfabd02b 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -817,8 +817,12 @@ void ath12k_reg_free(struct ath12k_base *ab)
 {
 	int i;
 
+	mutex_lock(&ab->core_lock);
 	for (i = 0; i < ab->hw_params->max_radios; i++) {
 		kfree(ab->default_regd[i]);
 		kfree(ab->new_regd[i]);
+		ab->default_regd[i] = NULL;
+		ab->new_regd[i] = NULL;
 	}
+	mutex_unlock(&ab->core_lock);
 }

-- 
2.34.1


