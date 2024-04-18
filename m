Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9904AC4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ0ecB+l75cGxRwY7lVJkc0jzGVqtrTgSsEDd83ZqFU=; b=UVcduOBFmujMJGgt/MVnChtCrx
	F3FKi3ixuyr5h709ahs8ddkCQtGGLLVpGZNVXkUkII48fqn5gXdu//yOzQi2A7+6+YqFx4t/Jbeja
	XXdkPwTWClcLFnn4yUW8QHz05BZpixxJRJPUj+0RGaP04AtCjmVd1g51gI83F2pPYqlYCfrBd3+W3
	n80xgBCJitRlldjZ41/l8Lx8LtCQaO+gQ6Ff8qiUJTtXW7vznQCFXf6CFV8DstPrcZZFRhuPdsXhb
	CIidYmQhkGAkfljjKM8ZdxmJD4GhZj+O4JWhVTlz+oJM7fAfYmRpcqIsGJDAUr/TIm1PJ39Sk3B3f
	gD2aA5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUUw-00000002zjW-16LP
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 16:20:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUUs-00000002zhh-2EMf
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 16:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9FA96188D
	for <ath12k@lists.infradead.org>; Thu, 18 Apr 2024 16:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2F1C113CC;
	Thu, 18 Apr 2024 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713457225;
	bh=dRUTCKzTiFbxyH8ftvDEo2GPr1jUEjLwlCbTFyrD7Gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a6mcjY7HcAV+BC9qfjAhQUDAknbVj1ctnleB6Zs9+zHWpDHvmSTizc4BJJVwcH9Sx
	 3aIMYrhRTBTU0SNWunLE1sSoPjGcIpc3Zij0nri/7onFIswNGfckbwP/Ce38wH6Jfs
	 /2qwAAG98ynAF2QKTLPRcMBIOgXvl4jsNTN59yfFpZRSPfdVBaDg21L5hlJHe9FU7d
	 GXqiI1CLk/JtJ+JfJA3MQNlyaPGWeHoPT87DRlswsq1p1TnwGRoUtJeJRNKQLwnOBk
	 W+dsMdbMXT1BBrpd5hWxJaDUBK8uQ3RmVP2MOXH5ELPZzqubuxAXpRNO8yVapmZ24q
	 92jBBbQ45tjew==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v8 3/4] wifi: ath12k: ACPI CCA threshold support
Date: Thu, 18 Apr 2024 19:20:18 +0300
Message-Id: <20240418162019.1246749-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240418162019.1246749-1-kvalo@kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_092026_726747_0C9248B2 
X-CRM114-Status: GOOD (  13.92  )
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

From: Lingbo Kong <quic_lingbok@quicinc.com>

Currently, ath12k does not have the ability to adjust Clear Channel Assessment
(CCA) threshold values to meet the regulatory requirements. Get the values from
ACPI and send them to the firmware using ath12k_wmi_set_bios_cmd() function.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/acpi.c | 37 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h |  8 ++++++
 drivers/net/wireless/ath/ath12k/core.h |  1 +
 drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
 4 files changed, 47 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index b6d6187bc347..2fb8d53de68f 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -79,6 +79,18 @@ static int ath12k_acpi_dsm_get_data(struct ath12k_base *ab, int func)
 			memcpy(&ab->acpi.geo_offset_data, obj->buffer.pointer,
 			       obj->buffer.length);
 
+			break;
+		case ATH12K_ACPI_DSM_FUNC_INDEX_CCA:
+			if (obj->buffer.length != ATH12K_ACPI_DSM_CCA_DATA_SIZE) {
+				ath12k_warn(ab, "invalid ACPI DSM CCA data size: %d\n",
+					    obj->buffer.length);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			memcpy(&ab->acpi.cca_data, obj->buffer.pointer,
+			       obj->buffer.length);
+
 			break;
 		}
 	} else {
@@ -226,6 +238,7 @@ static int ath12k_acpi_set_tas_params(struct ath12k_base *ab)
 int ath12k_acpi_start(struct ath12k_base *ab)
 {
 	acpi_status status;
+	u8 *buf;
 	int ret;
 
 	if (!ab->hw_params->acpi_guid)
@@ -297,6 +310,30 @@ int ath12k_acpi_start(struct ath12k_base *ab)
 			return ret;
 	}
 
+	if (ATH12K_ACPI_FUNC_BIT_VALID(ab->acpi, ATH12K_ACPI_FUNC_BIT_CCA)) {
+		ret = ath12k_acpi_dsm_get_data(ab, ATH12K_ACPI_DSM_FUNC_INDEX_CCA);
+		if (ret) {
+			ath12k_warn(ab, "failed to get ACPI DSM CCA threshold configuration: %d\n",
+				    ret);
+			return ret;
+		}
+
+		if (ab->acpi.cca_data[0] == ATH12K_ACPI_CCA_THR_VERSION &&
+		    ab->acpi.cca_data[ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET] ==
+		    ATH12K_ACPI_CCA_THR_ENABLE_FLAG) {
+			buf = ab->acpi.cca_data + ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET;
+			ret = ath12k_wmi_set_bios_cmd(ab,
+						      WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE,
+						      buf,
+						      ATH12K_ACPI_CCA_THR_OFFSET_LEN);
+			if (ret) {
+				ath12k_warn(ab, "failed to set ACPI DSM CCA threshold: %d\n",
+					    ret);
+				return ret;
+			}
+		}
+	}
+
 	status = acpi_install_notify_handler(ACPI_HANDLE(ab->dev),
 					     ACPI_DEVICE_NOTIFY,
 					     ath12k_acpi_dsm_notify, ab);
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 24a4c981e8de..9900fe3b1b1c 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -11,11 +11,13 @@
 #define ATH12K_ACPI_DSM_FUNC_SUPPORT_FUNCS	0
 #define ATH12K_ACPI_DSM_FUNC_BIOS_SAR		4
 #define ATH12K_ACPI_DSM_FUNC_GEO_OFFSET		5
+#define ATH12K_ACPI_DSM_FUNC_INDEX_CCA		6
 #define ATH12K_ACPI_DSM_FUNC_TAS_CFG		8
 #define ATH12K_ACPI_DSM_FUNC_TAS_DATA		9
 
 #define ATH12K_ACPI_FUNC_BIT_BIOS_SAR			BIT(3)
 #define ATH12K_ACPI_FUNC_BIT_GEO_OFFSET			BIT(4)
+#define ATH12K_ACPI_FUNC_BIT_CCA			BIT(5)
 #define ATH12K_ACPI_FUNC_BIT_TAS_CFG			BIT(7)
 #define ATH12K_ACPI_FUNC_BIT_TAS_DATA			BIT(8)
 
@@ -26,13 +28,17 @@
 #define ATH12K_ACPI_TAS_DATA_ENABLE		0x1
 #define ATH12K_ACPI_POWER_LIMIT_VERSION		0x1
 #define ATH12K_ACPI_POWER_LIMIT_ENABLE_FLAG	0x1
+#define ATH12K_ACPI_CCA_THR_VERSION		0x1
+#define ATH12K_ACPI_CCA_THR_ENABLE_FLAG		0x1
 
 #define ATH12K_ACPI_GEO_OFFSET_DATA_OFFSET	1
 #define ATH12K_ACPI_DBS_BACKOFF_DATA_OFFSET	2
+#define ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET	5
 #define ATH12K_ACPI_BIOS_SAR_DBS_BACKOFF_LEN	10
 #define ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET	12
 #define ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN	18
 #define ATH12K_ACPI_BIOS_SAR_TABLE_LEN		22
+#define ATH12K_ACPI_CCA_THR_OFFSET_LEN		36
 
 #define ATH12K_ACPI_DSM_TAS_DATA_SIZE			69
 #define ATH12K_ACPI_DSM_TAS_CFG_SIZE			108
@@ -41,6 +47,8 @@
 					      ATH12K_ACPI_BIOS_SAR_GEO_OFFSET_LEN)
 #define ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE (ATH12K_ACPI_POWER_LIMIT_DATA_OFFSET + \
 					    ATH12K_ACPI_BIOS_SAR_TABLE_LEN)
+#define ATH12K_ACPI_DSM_CCA_DATA_SIZE (ATH12K_ACPI_CCA_THR_OFFSET_DATA_OFFSET + \
+				       ATH12K_ACPI_CCA_THR_OFFSET_LEN)
 
 #ifdef CONFIG_ACPI
 
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index dac4a6cd60f1..0e33cf783f62 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -913,6 +913,7 @@ struct ath12k_base {
 		u8 tas_sar_power_table[ATH12K_ACPI_DSM_TAS_DATA_SIZE];
 		u8 bios_sar_data[ATH12K_ACPI_DSM_BIOS_SAR_DATA_SIZE];
 		u8 geo_offset_data[ATH12K_ACPI_DSM_GEO_OFFSET_DATA_SIZE];
+		u8 cca_data[ATH12K_ACPI_DSM_CCA_DATA_SIZE];
 	} acpi;
 
 #endif /* CONFIG_ACPI */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8ace566f7eb5..6db15a0a4735 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -4805,6 +4805,7 @@ struct wmi_pdev_set_bios_interface_cmd {
 } __packed;
 
 enum wmi_bios_param_type {
+	WMI_BIOS_PARAM_CCA_THRESHOLD_TYPE	= 0,
 	WMI_BIOS_PARAM_TAS_CONFIG_TYPE		= 1,
 	WMI_BIOS_PARAM_TAS_DATA_TYPE		= 2,
 	WMI_BIOS_PARAM_TYPE_MAX,
-- 
2.39.2


