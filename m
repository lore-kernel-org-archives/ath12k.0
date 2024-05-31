Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0208DC25B74
	for <ath12k@archiver.kernel.org>; Fri, 31 May 2024 02:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WIJ3LBCrK0EpHcJ4m1/nQVmXfst4QqoPOaaoka2iaRw=; b=Y1OwFSml2ardRnRmrh9STl++/m
	1k7CJb8wzQhTWR5zSYH72lAnmuZy94cwtMLrLeC6LE16bHgApCD050E+hhUK0cGHaW+6pMTWnDe3l
	l2ovjh0je6ICIag+rHwOGWKq5KcNkbgHMn2ud4D7ike2+MZW4zZad9EMc4mB4LMMfQ7mGna1cvrSV
	QiQR2/4SuYtR08fQUd9/7y7zLHtAD8KOl/Gr8WOAWGjTQX6GtqXJ3uZqvmEKdAsn7ICVTgAw4Cbua
	kF9V6zOPmRRyvEOOhr3xRPbDz8NPP8nxeWTlYpjcJ53Kk2BBdLCDe59jaCt0gzdE9h5FpZ+OlNBgg
	GrtRq9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCsBl-000000092ww-1sDl
	for ath12k@archiver.kernel.org;
	Fri, 31 May 2024 02:40:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCsBi-000000092wW-0nYm
	for ath12k@lists.infradead.org;
	Fri, 31 May 2024 02:40:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V1m07a003487;
	Fri, 31 May 2024 02:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WIJ3LBCrK0EpHcJ4m1/nQV
	mXfst4QqoPOaaoka2iaRw=; b=cAayvBnLrqk5rnfM+XXAj2wgIm+N8OmGsyK6EI
	iP7zmEccBED1kgWUKz5p00+ogHnuHEAfNggVaNP/Wnmq+gVQnoq8v9/b8dDdcJXV
	kshYYKFk9FGYzrmTkSaw549Hvh2P6WD6500VNzJffwo4UqxVAy+jwPrVGK7vUyb/
	eW/C0zM6sg2jJ6Yev6lxjqOSnUxmXeQ3rsjsXUZdJ5R23jTGyF0zyRqRWI8b44aF
	ckNXkaqdc1L3TesRpBEsMfmDzXqlD0Hh7SXrLXaWsGGV9FWf4SRGxBq8Um3AudtY
	S5GDg/aOckJqEiBRpUwsvypY/Us/kRGitnzCh1AB+eOdLlCw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5hmj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 02:40:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V2eBeP019630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 02:40:11 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 19:40:10 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix ACPI warning when resume
Date: Fri, 31 May 2024 10:40:00 +0800
Message-ID: <20240531024000.9291-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XlvVy4vUr7IVBBvdQlKV3N0gkxPjJkEy
X-Proofpoint-GUID: XlvVy4vUr7IVBBvdQlKV3N0gkxPjJkEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_21,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_194014_673931_5158BA8F 
X-CRM114-Status: GOOD (  10.57  )
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

Currently ACPI notification handler is installed when driver loads and only
gets removed when driver unloads. During resume after firmware is reloaded,
ath12k tries to install it by default. Since it is installed already, ACPI
subsystem rejects it and returns an error:

[   83.094206] ath12k_pci 0000:03:00.0: failed to install DSM notify callback: 7

Fix it by removing that handler when going to suspend. This also avoid any
possible ACPI call to firmware before firmware is reloaded/reinitialized.

Note ab->acpi also needs to be cleared in ath12k_acpi_stop() such that we
are in a clean state when ACPI structures are reinitialized in
ath12k_acpi_start().

Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 576771c9fa21 ("wifi: ath12k: ACPI TAS support")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/acpi.c | 2 ++
 drivers/net/wireless/ath/ath12k/core.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index 443ba12e01f3..0555d35aab47 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -391,4 +391,6 @@ void ath12k_acpi_stop(struct ath12k_base *ab)
 	acpi_remove_notify_handler(ACPI_HANDLE(ab->dev),
 				   ACPI_DEVICE_NOTIFY,
 				   ath12k_acpi_dsm_notify);
+
+	memset(&ab->acpi, 0, sizeof(ab->acpi));
 }
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index e7f628e935e4..92f442f8e03a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -83,6 +83,8 @@ int ath12k_core_suspend_late(struct ath12k_base *ab)
 	if (!ab->hw_params->supports_suspend)
 		return -EOPNOTSUPP;
 
+	ath12k_acpi_stop(ab);
+
 	ath12k_hif_irq_disable(ab);
 	ath12k_hif_ce_irq_disable(ab);
 

base-commit: 6e7a5c6d5e38b93f9cc3289d66a597b9a4ca0403
-- 
2.25.1


