Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20ABC02194
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BT7DXHGHa0zEjrmQrPCEWvJNmClmGtUduvzIInTQO7M=; b=l7bghbstARwIlq
	Z93RvBwlLg5xAY/8ReN5d1tk86HMw+NeR38QM0cKLTjNCvhkORVhKa907WoklOkkzs9W3vGSHxTD1
	A/ImG4RGvuSf6LyyOfMiDZWJHtX53i53EBCOF6RtShHK2xL3SRuaf/eGOAiHXaGdXoLTJYuSpdHKT
	yN4YJjPHaGvyzqEUi5bOsDOYpDJBfYNP2XolZAy+Ns8apejbxecGB3TJ9rlsWJeCBMyMWuXJjkKyC
	lavGhQ4NgHp1+uV8s/9pxEzPVF6/kdPxCyV+Ck12i2QaUqqfufy5et2hwHNbOOG8Jr47k/tWCYRB1
	QW7AlXvvyItLjc64fRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMV-000000012CA-1cAI
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMS-000000012Bl-2Bb2
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Guvag024791
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BT7DXHGHa0zEjrmQrPCEWv
	JNmClmGtUduvzIInTQO7M=; b=Q58w1E2dpFUbKgrhcah0e2V/ckonktGv/4SdHY
	2eF8YWtf77wFXutIPocpQFyxSFOfkaO8cu88KBMcrNy836aYI4mmyfMbKxK3nLNk
	UkT+Y1+e6+CGprJ89j6qM9Izza1owiq+7HOhPl8DSSKdlhL0zem93vv1Bls7Ukl5
	VXHarVMr8VsTwnWjEyflirOK4Iza5HmPIRbzQhlsLH344FP9UJF0McYbCOQ7Cow/
	YEMHri0CFcMJSxiIKLNFEt2upDaVrUkveo9o1KzoPpsQUqS1jW4LLbcj7En0Imt9
	rt6TB92l89+ePVEwZg00NPNARrxl0IfMd0RNmzHrRX4MpTyg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kpuy80um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee86953aeaso10714585a91.2
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688719; x=1739293519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BT7DXHGHa0zEjrmQrPCEWvJNmClmGtUduvzIInTQO7M=;
        b=qIGYjF2lpZFq6rTKQvmdd9BiE6LUt2J1CUpV4NDuxnYSSwbVQjTmD881Lfi6PR5L00
         prCKfkhCEaG3lnK6sZQKCAD4Ml19E3P4CYc45Y9Sn0AsvXrjDrAHwZJ3Sn8toDtSu1xd
         n6Utm33EFjTsawq2rUAte3kOYBVHZqHR2Dsw+sqtgD5WuRGcgrP5FDxx6buQElDonyjd
         3GOt95qibCS232WP5X+geqkpcG81R0qTsh49MtvuAvsfpmK7mHRxja1HiIGOJo+6mSTj
         hByg/sKQ5qhD4m8ERRcF85NjaGIG3E/L/9Tf9BJ7aXHqJGAIgyqXrRebDmY8l8DFeV6j
         WTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3cDNg1YpWA1R1OY5hrKP+b9UDcpkhsPiEk2Waj8LlFc67X7T/4Osz23xatGP5NkogNUEQ2Ew=@lists.infradead.org
X-Gm-Message-State: AOJu0YwakQXK6+V2/cErUibrKQ1y53P3E/s1j+tlbXIqG9MRqPmSPeBM
	oe8sPUcPbtjAW1TfBMmsn5Onw6qOlDumqAQ5oxoY8e48+EEUvp99/wfHHyqHRVnuo5kTS8YJWAs
	8cJ60S6QIzR/uoduYSB6KxVWOB49WzRTQVTeu6wm12mRl8xPO+7YGFyoWjNn6mkUpC8ko
X-Gm-Gg: ASbGncuxrFgvHWcQ1AgNudt+SKcutH/+DX2OMIeQqeevwMHg+hXmdupTNiNUdRomGeI
	Wxj7tQiMtCpfMmiQi966k74HyTowXGfUpGsWYV7krOxt2OKNFPHvKyTngmX9GzSmZPDWSuqRjvw
	PoW/1kE+3AyOJ1LkEDKyz4ABWzAkNHqJP+WXtS0nNk6tzzFIOKRp+skxVv7ngiA2xWFS4VK5SOx
	uDnr+X9hABZ30tf3sS9ZUwhGzFkzuWMyZu9UEcK0M+EaVYHgBd1IfBWvJwCYv8uNDWZyT2x0V6s
	UuqGb97t0paw5kVHJfp+IveZAm4ZEIkDbWHUHUSdEd8PezhgxtaqUuEKoOTU6jfcO32Q2r3Lxbb
	F+EqY0oH6vjvjVBdI3dUTO0glS6TW0Q==
X-Received: by 2002:a05:6a00:1411:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-72fd0c60405mr34524837b3a.15.1738688718657;
        Tue, 04 Feb 2025 09:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGycQOxaUw26jx2t1l1m1gaa7VJ8kN4iUr7ydQDkLeDLysG/ehAID5o72Qqi2wmqGDsOu70Gg==
X-Received: by 2002:a05:6a00:1411:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-72fd0c60405mr34524791b3a.15.1738688718037;
        Tue, 04 Feb 2025 09:05:18 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:17 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links() callback
Date: Tue, 04 Feb 2025 22:35:06 +0530
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJIomcC/43OTWrDMBAF4KsEresgjTz+ySr3KMXI41EjGtuNZ
 JuU4LtXdglpocXdCN4gvvduIrB3HMRhdxOeJxdc38UATztBJ9O9cuKamAVISBUomYzd2XVv1fo
 YPzlbWd+31fKZhmuiFSosCQ1lWkTk3bN117Xg+eUre76MsWd4HE8uDL3/WEdMarne+9RW36QSm
 dRlSbVFMKzoGHFyHe2pb5cBEUIJMv0XlOVYNymx0bo89iHsL6M5R6hdtWXqBN/nwaYKUc3rBog
 aRrT8Y94K6juIUkG+CeoI2szKBo21dWb+mJk+VJB6U02jioUE1jYvuMh/Ued5/gQExm0LLgIAA
 A==
X-Change-ID: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: SIfI8Rah4XcmLtwnJy_jSs1O9NhrtZ2M
X-Proofpoint-ORIG-GUID: SIfI8Rah4XcmLtwnJy_jSs1O9NhrtZ2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090520_576646_F432EDA8 
X-CRM114-Status: GOOD (  12.88  )
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

Currently, links in an interface are allocated during channel assignment
via assign_vif_chanctx(). Conversely, links are deleted during channel
unassignment via unassign_vif_chanctx(). However, deleting links during
channel unassignment does not comply with mac80211 link handling.
Therefore, this process should be managed within change_vif_links().

This series aims to add support to handle links in change_vif_links()
callback.

Patches 1-2 are making debug infra to work without device info.

Patches 3-8 are the ones changing the code to handle as mentioned above.

NOTE:
* A new ath12k-check warning comes which probably needs to be added to
ignore list

drivers/net/wireless/ath/ath12k/debug.c:69: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...

This is because, since device info is not known can not use netdev_ or dev_
dbg family. pr_debug() is an option but that will require DYNAMIC_DEBUG
and then ath12k needs to be probed with dyndbg=+p which we don't want in
ath. Hence, only option left is to use printk() directly.

---
Changes in v2:
- No changes in patches 1-5, 7.
- Relocated ath12k_mac_remove_link_interface() as well in patch 6.
- Properly handled peer create and peer delete symmetry in patch 8. This
  unsymmetry was the root cause of the DFS channel bring up as reported
  with v1.
- Link to v1: https://lore.kernel.org/r/20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com

---
Aditya Kumar Singh (8):
      wifi: ath12k: eliminate redundant debug mask check in ath12k_dbg()
      wifi: ath12k: introduce ath12k_generic_dbg()
      wifi: ath12k: remove redundant vif settings during link interface creation
      wifi: ath12k: remove redundant logic for initializing arvif
      wifi: ath12k: use arvif instead of link_conf in ath12k_mac_set_key()
      wifi: ath12k: relocate a few functions in mac.c
      wifi: ath12k: allocate new links in change_vif_links()
      wifi: ath12k: handle link removal in change_vif_links()

 drivers/net/wireless/ath/ath12k/debug.c |   6 +-
 drivers/net/wireless/ath/ath12k/debug.h |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 302 ++++++++++++++++++--------------
 3 files changed, 180 insertions(+), 135 deletions(-)
---
base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
change-id: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63


