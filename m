Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92FC3DA6E
	for <ath12k@archiver.kernel.org>; Fri, 23 Dec 2022 05:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFFVt9bjdsEdrhMJYDqV12Qi952lK2AjXxBR02koSbE=; b=Ypo5rVLS4B3/UK
	R8Au/1WOEBjf9bF+hfdDH2VZ5kPoVk0uD5Y3xZabZ5C6mVBTPbh90wg/3k53WFPSiNg+7Xj/fendY
	mcu+JzqYIjGjdLtbf3BMwaup2DCpg+zundfu2i3UZ+7uzWFGZ69KsjNkl37+S1yDk58ZMQmiWi04v
	c7i2lFZzre+5rlMZ0x0PzVtl8Ma5R0B8txTIRM2mqu5JWoCz0OhaukvrpzXosFLa9xZdqFDrWFlQW
	SjiyAXFIl84ZpQVUykxolIKSCoUkfPwu+e0U737tu7Sxpa5LP6k93TayEX+yIYavEBmFHdfZ3ZkST
	EDUSDbmDthlWgniSQo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aHQ-003jg4-Si
	for ath12k@archiver.kernel.org; Fri, 23 Dec 2022 05:07:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aHM-003je2-Ud
	for ath12k@lists.infradead.org; Fri, 23 Dec 2022 05:07:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BN4Iufl004005;
	Fri, 23 Dec 2022 05:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LsFoXZKgBXAdvYrevb8UrOi2Mu70YVJRek8DvPhqlVQ=;
 b=ZfMNDOqDuzdLbBe8MDSWR994WLZfaA1vaVMlzM4O4yOLY2YTrt8He5+oE9ygxfUMkMUu
 jo5/vK+VKJ/YOx+Wcmgtl76jUsT3r/TKxqjlVqSlCGdQ9szUuoBSEHff1LwcG4OVed9y
 xMf6SauCYBLY3P7wGZ9d3E3JPkuI4yNVBgC0RUV4caOc+8/tHuvyguyo8JLOi3LEfBCu
 U51prb/dYcYcu8ZfCsfI8kefG3DC/0FcOoyvO+TKj39bhhVV6LIXZxt1dhiJZTjc7OpU
 6wA47xBd6dJoWQlsqb+YRl2A+nr3bA+Pl0YADo1JWSJ2ql7+6o37TCP1KyTrSE4fIzzq Ng== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brvbrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Dec 2022 05:07:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BN57VMp027164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Dec 2022 05:07:31 GMT
Received: from dinek-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 21:07:29 -0800
From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
Subject: [PATCH 2/3] wifi: ath12k: Add new qmi_bdf_type to handle caldata
Date: Fri, 23 Dec 2022 10:36:45 +0530
Message-ID: <20221223050646.27785-3-quic_dinek@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221223050646.27785-1-quic_dinek@quicinc.com>
References: <20221223050646.27785-1-quic_dinek@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5qoMxYsC_Y9yeGyenTcOzWfBs13K0hDa
X-Proofpoint-GUID: 5qoMxYsC_Y9yeGyenTcOzWfBs13K0hDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_02,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_210733_169149_E925B383 
X-CRM114-Status: GOOD (  20.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

With current implementation, the calibration data download request, is
sent twice incorrectly because the request for ELF_TYPE and REGDB_TYPE
are handled in a common api ath12k_qmi_load_bdf_qmi.
Add new type as ATH12K_QMI_BDF_TYPE_CALIBRATION to send calibration data
download request as a separate case. With this the firmware is indicated
to read caldata from EEPROM.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 115 ++++++++++++--------------
 drivers/net/wireless/ath/ath12k/qmi.h |   1 +
 2 files changed, 52 insertions(+), 64 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 56df607646fa..a69307bea596 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2419,6 +2419,50 @@ static int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 			goto out;
 		}
 		break;
+	case ATH12K_QMI_BDF_TYPE_CALIBRATION:
+
+		if (ab->qmi.target.eeprom_caldata) {
+			file_type = ATH12K_QMI_FILE_TYPE_CALDATA;
+			tmp = filename;
+			fw_size = ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE;
+		} else {
+			file_type = ATH12K_QMI_FILE_TYPE_CALDATA;
+
+			/* cal-<bus>-<id>.bin */
+			snprintf(filename, sizeof(filename), "cal-%s-%s.bin",
+				 ath12k_bus_str(ab->hif.bus), dev_name(dev));
+			fw_entry = ath12k_core_firmware_request(ab, filename);
+			if (!IS_ERR(fw_entry))
+				goto success;
+
+			fw_entry = ath12k_core_firmware_request(ab,
+								ATH12K_DEFAULT_CAL_FILE);
+			if (IS_ERR(fw_entry)) {
+				ret = PTR_ERR(fw_entry);
+				ath12k_warn(ab,
+					    "qmi failed to load CAL data file:%s\n",
+					    filename);
+				goto out;
+			}
+
+success:
+			fw_size = min_t(u32, ab->hw_params->fw.board_size,
+					fw_entry->size);
+			tmp = fw_entry->data;
+		}
+		ret = ath12k_qmi_load_file_target_mem(ab, tmp, fw_size, file_type);
+		if (ret < 0) {
+			ath12k_warn(ab, "qmi failed to load caldata\n");
+			goto out_qmi_cal;
+		}
+
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi caldata downloaded: type: %u\n",
+			   file_type);
+
+out_qmi_cal:
+		if (!ab->qmi.target.eeprom_caldata)
+			release_firmware(fw_entry);
+		return ret;
 	default:
 		ath12k_warn(ab, "unknown file type for load %d", type);
 		goto out;
@@ -2429,72 +2473,9 @@ static int ath12k_qmi_load_bdf_qmi(struct ath12k_base *ab,
 	fw_size = min_t(u32, ab->hw_params->fw.board_size, bd.len);
 
 	ret = ath12k_qmi_load_file_target_mem(ab, bd.data, fw_size, type);
-	if (ret < 0) {
+	if (ret < 0)
 		ath12k_warn(ab, "qmi failed to load bdf file\n");
-		goto out;
-	}
-
-	if (!ab->hw_params->download_calib)
-		goto out;
 
-	file_type = ATH12K_QMI_FILE_TYPE_CALDATA;
-
-	/* cal-<bus>-<id>.bin */
-	snprintf(filename, sizeof(filename), "cal-%s-%s.bin",
-		 ath12k_bus_str(ab->hif.bus), dev_name(dev));
-	fw_entry = ath12k_core_firmware_request(ab, filename);
-	if (!IS_ERR(fw_entry))
-		goto success;
-
-	fw_entry = ath12k_core_firmware_request(ab, ATH12K_DEFAULT_CAL_FILE);
-	if (IS_ERR(fw_entry)) {
-		ret = PTR_ERR(fw_entry);
-		ath12k_warn(ab,
-			    "qmi failed to load CAL data file:%s\n",
-			    filename);
-		goto out;
-	}
-
-	if (ab->qmi.target.eeprom_caldata) {
-		file_type = ATH12K_QMI_FILE_TYPE_CALDATA;
-		tmp = filename;
-		fw_size = ATH12K_QMI_MAX_BDF_FILE_NAME_SIZE;
-	} else {
-		file_type = ATH12K_QMI_FILE_TYPE_CALDATA;
-
-		/* cal-<bus>-<id>.bin */
-		snprintf(filename, sizeof(filename), "cal-%s-%s.bin",
-			 ath12k_bus_str(ab->hif.bus), dev_name(dev));
-		fw_entry = ath12k_core_firmware_request(ab, filename);
-		if (!IS_ERR(fw_entry))
-			goto success;
-
-		fw_entry = ath12k_core_firmware_request(ab, ATH12K_DEFAULT_CAL_FILE);
-		if (IS_ERR(fw_entry)) {
-			ret = PTR_ERR(fw_entry);
-			ath12k_warn(ab,
-				    "qmi failed to load CAL data file:%s\n",
-				    filename);
-			goto out;
-		}
-
-success:
-		fw_size = min_t(u32, ab->hw_params->fw.board_size, fw_entry->size);
-		tmp = fw_entry->data;
-	}
-
-	ret = ath12k_qmi_load_file_target_mem(ab, tmp, fw_size, file_type);
-	if (ret < 0) {
-		ath12k_warn(ab, "qmi failed to load caldata\n");
-		goto out_qmi_cal;
-	}
-
-	ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi caldata downloaded: type: %u\n",
-		   file_type);
-
-out_qmi_cal:
-	if (!ab->qmi.target.eeprom_caldata)
-		release_firmware(fw_entry);
 out:
 	ath12k_core_free_bdf(ab, &bd);
 	ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi BDF download sequence completed\n");
@@ -2851,6 +2832,12 @@ static int ath12k_qmi_event_load_bdf(struct ath12k_qmi *qmi)
 		return ret;
 	}
 
+	if (ab->hw_params->download_calib) {
+		ret = ath12k_qmi_load_bdf_qmi(ab, ATH12K_QMI_BDF_TYPE_CALIBRATION);
+		if (ret < 0)
+			ath12k_warn(ab, "qmi failed to load calibrated data :%d\n", ret);
+	}
+
 	ret = ath12k_qmi_wlanfw_m3_info_send(ab);
 	if (ret < 0) {
 		ath12k_warn(ab, "qmi failed to send m3 info req:%d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 37af9674b89e..ad87f19903db 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -54,6 +54,7 @@ enum ath12k_qmi_bdf_type {
 	ATH12K_QMI_BDF_TYPE_BIN			= 0,
 	ATH12K_QMI_BDF_TYPE_ELF			= 1,
 	ATH12K_QMI_BDF_TYPE_REGDB		= 4,
+	ATH12K_QMI_BDF_TYPE_CALIBRATION		= 5,
 };
 
 enum ath12k_qmi_event_type {
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
