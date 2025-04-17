Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB71AC369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 06:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1GQHy6cqMBQhYP1koW6prJaZyjnNx0mkx1JtvKBy0I=; b=43GCHNM1FFvGd2S9tmyUK8Nqrb
	gJg8KVK7dhbiNL1JILITenK7IfgPW5reiNVQ+YDhRMUq1syDGbuFxO/ofye8IJ7bJv3bPwgPPDBZE
	YF/sz4DJU+8dl3CGnMWHLHhrdFbQCiueY2zVtFfumk+PqJxiYmqelX9Zr0YIXeaDIlgVqzxbJsU5C
	XNsu13mRzQH/ha0fuGqZT25SuK6K3x+K31AYoWRiQM8AWK+NyDDyhcKAHeMUPoM0uHcmTl1ngPTLv
	p0ezfb/37AfG5639aAAGIv/STgLMhKqC1CpZjD1BaAupssUSRELOYdlvbvQvyI0kKr6FtU0sYKP5r
	yV9b6rtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JAV-0000000ByeS-2MHp;
	Thu, 17 Apr 2025 06:56:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5J7D-0000000BxmR-09We
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 06:52:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l33L022767
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 06:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=y1GQHy6cqMBQ
	hYP1koW6prJaZyjnNx0mkx1JtvKBy0I=; b=Kwn42MhWBxFMkX3PDzJ+qmap+tO0
	Zm9IJZ43DdHvNF8UD0hJYFPDzfxMOqEi1v4820CpnVxBAzQvnJ1foABiw6EIi63q
	YP1pqX3cBDOc6e6hN2KwGYXWDNmAheLVI5vLFyrKhDDqs5f7bTz7bQMEuzi1C9lE
	mO/KFkN1Y0SKkziO+qMoDiOYK2LZ7r9xAoWoEdZJ2BU+xnSv4j0LqbQloAq93qRe
	p7pg8PDQBPU/xgNpB+/Rzv+7gQgbi5cH55xjTdXuWdwu3ngo02CXCLsXB/ifDW6w
	NKowe7OoqpRhb/wv+nUkxAAtIn5x07P48+CwdUa9/nQqCss4ax4CyY4XWA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9dx33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 06:52:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af9564001cbso296081a12.3
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 23:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872768; x=1745477568;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1GQHy6cqMBQhYP1koW6prJaZyjnNx0mkx1JtvKBy0I=;
        b=I/eyfSN9aa0vCktSQe2O+LK+4ZQhOwZvDM9Bykr3TCpBEe2aw7H5tBxUFCFwv1liwT
         IDhkd9/HkfjHP62QDCvilTWjCXqXZljAjCu0r8LnHzlA8PCNincfFjFTabYKwm8yxDZd
         d0akfwTe3425zlMu8ShVFvRTfeiPyx5YCwaaY+ht8j8BIcQBkmh1jqfhCaUbKSJNjI+w
         LkzgZ3fZxg5w7yKqPGzmE9s8gBUnqMeNggZ1l6vtyeLCM+O3GpI7ortoOpB3xR0qwhp1
         oZgv7Y2MVhYQcp6AYWfja9fOJyu8NAxPj03tqrqIqiD6Qhjy7WvgTVjXl1/bLXOkSI4i
         En1Q==
X-Gm-Message-State: AOJu0YxW9Abmx2DRchif+KvKzyGLROe/lFGI6KjQxKL2NmTH0k/kuFxh
	MmVPu+8vkT/r38dhSgnmBSLor45V0adfCMXKBT3MWOa+GeE2E3ROASr5f5s5XJhf1WFgJxXnXqj
	QVX+HCsOcXHNfuxMt4X322eLL13aXYPIlNLDZmpDMfm6wZXhQm4fC9Rl82k80JYHncltB
X-Gm-Gg: ASbGnctaJvhckXujh1H6jSeS6aAzfsEiw9drdfRMAe6uXUfDrJ1jmgvtyvLxmzpGU4C
	Nogb2/Cm2ez2N1tYuzK3NYDrJdVNsMnFNsILMksXlPxmIOV6pjuchAYDFs/mIRfyOfaE44uGv9K
	Bwo5FQEQ2OALgjanz87EEiNwGi965JKsAayV37ejYDLBk3qHuxFhw7P47jobiuIBiiNo+Fqg/bL
	PhDqMPMAiAOV7A8A6xSKpm+xNrL9Ie4nImMhYTBIauatptSLAuUtKsSfWTjJekrp67u5gbqn+4V
	zsXKm0y9oJo2zP0JtxNBKfT2/yadP5Nktw2hJXDDMxXE5hsG0mjgFmWsgsBl/z9jUTmxBwRiE83
	CCjAAWbEBabsGz2K17hya0i05L8FgJqPCz7XErM5xBDWXaA==
X-Received: by 2002:a17:902:c40f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22c358ead7cmr60265695ad.30.1744872767615;
        Wed, 16 Apr 2025 23:52:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLt4QsJ2nKuq0fjcgEugFnOrWyESmkX/yGp1OXSXb7VG+MSohudXSATxpF0u28pesxfhNA8Q==
X-Received: by 2002:a17:902:c40f:b0:223:66a1:4503 with SMTP id d9443c01a7336-22c358ead7cmr60264875ad.30.1744872766054;
        Wed, 16 Apr 2025 23:52:46 -0700 (PDT)
Received: from che-siroccolnx03.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0fbasm25966145ad.19.2025.04.16.23.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:52:45 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Add support to simulate firmware crash
Date: Thu, 17 Apr 2025 12:22:37 +0530
Message-Id: <20250417065237.2507613-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-ORIG-GUID: I948taoQANre_LbPBvAxGWxt34xAWiJs
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6800a541 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=639jykY1kkF2cMweqlIA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I948taoQANre_LbPBvAxGWxt34xAWiJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_235251_219936_5DBD116E 
X-CRM114-Status: GOOD (  18.58  )
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

From: Dinesh Karthikeyan <quic_dinek@quicinc.com>

Add debugfs support to simulate firmware crash to test firmware restart.

Usage:
-----
echo assert > /sys/kernel/debug/ath12k/pci-0000\:58\:00.0/simulate_fw_crash

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---

v2: Jeff gave ACK for v1 patch and later conflict was seen with latest TOT.
    Hence, rebased this patch on latest TOT.

 drivers/net/wireless/ath/ath12k/debugfs.c | 76 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/debugfs.h |  5 ++
 drivers/net/wireless/ath/ath12k/mac.c     |  1 +
 3 files changed, 82 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index bab7be9c5a38..1f0983c33885 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -33,6 +33,82 @@ static const struct file_operations fops_simulate_radar = {
 	.open = simple_open
 };
 
+static ssize_t ath12k_read_simulate_fw_crash(struct file *file,
+					     char __user *user_buf,
+					     size_t count, loff_t *ppos)
+{
+	const char buf[] =
+		"To simulate firmware crash write one of the keywords to this file:\n"
+		"`assert` - send WMI_FORCE_FW_HANG_CMDID to firmware to cause assert.\n";
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
+}
+
+static ssize_t
+ath12k_write_simulate_fw_crash(struct file *file,
+			       const char __user *user_buf,
+			       size_t count, loff_t *ppos)
+{
+	struct ath12k_base *ab = file->private_data;
+	struct ath12k_pdev *pdev;
+	struct ath12k *ar = NULL;
+	char buf[32] = {0};
+	int i, ret;
+	ssize_t rc;
+
+	/* filter partial writes and invalid commands */
+	if (*ppos != 0 || count >= sizeof(buf) || count == 0)
+		return -EINVAL;
+
+	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
+	if (rc < 0)
+		return rc;
+
+	/* drop the possible '\n' from the end */
+	if (buf[*ppos - 1] == '\n')
+		buf[*ppos - 1] = '\0';
+
+	for (i = 0; i < ab->num_radios; i++) {
+		pdev = &ab->pdevs[i];
+		ar = pdev->ar;
+		if (ar)
+			break;
+	}
+
+	if (!ar)
+		return -ENETDOWN;
+
+	if (!strcmp(buf, "assert")) {
+		ath12k_info(ab, "simulating firmware assert crash\n");
+		ret = ath12k_wmi_force_fw_hang_cmd(ar,
+						   ATH12K_WMI_FW_HANG_ASSERT_TYPE,
+						   ATH12K_WMI_FW_HANG_DELAY);
+	} else {
+		return -EINVAL;
+	}
+
+	if (ret) {
+		ath12k_warn(ab, "failed to simulate firmware crash: %d\n", ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static const struct file_operations fops_simulate_fw_crash = {
+	.read = ath12k_read_simulate_fw_crash,
+	.write = ath12k_write_simulate_fw_crash,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
+{
+	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
+			    &fops_simulate_fw_crash);
+}
+
 static ssize_t ath12k_write_tpc_stats_type(struct file *file,
 					   const char __user *user_buf,
 					   size_t count, loff_t *ppos)
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
index 74a255a27886..ebef7dace344 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs.h
@@ -16,6 +16,7 @@ void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
 				     struct ath12k_fw_stats *stats);
 void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
 			       struct ieee80211_vif *vif);
+void ath12k_debugfs_pdev_create(struct ath12k_base *ab);
 
 static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
 {
@@ -144,6 +145,10 @@ static inline void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
 					     struct ieee80211_vif *vif)
 {
 }
+
+static inline void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
+{
+}
 #endif /* CONFIG_ATH12K_DEBUGFS */
 
 #endif /* _ATH12K_DEBUGFS_H_ */
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfc803879028..c5b0ddb5ed85 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11976,6 +11976,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 		if (!ab)
 			continue;
 
+		ath12k_debugfs_pdev_create(ab);
 		ath12k_mac_set_device_defaults(ab);
 		total_radio += ab->num_radios;
 	}

base-commit: 176f3009ae598d0523b267db319fe16f69577231
-- 
2.17.1


