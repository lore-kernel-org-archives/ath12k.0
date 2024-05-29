Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E5AC25B78
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 01:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w43RXtj0fskVD1BKrCnAzhv3jEu4k3N/sLt4ARq8x0E=; b=oIDkRuyibrAqnjyAOOA15s1sIZ
	1yaFtYI+NTamvt5OeVd5YkuSk2YvR/ypQKbKzkqmzXuvFePu0HQV8h9dKhDp/Tpdmr4rrMkwGOGqO
	EVfLFDZrO2ywhcM6Ol10tmOeXGXIy0W6MOM+hQ+FaZXkzcmaytXx7SdresH/yLcMzVHjju6RWwjqk
	FOu0YNBlsllfNGISZH7ZDkKhflV5gBnpNjiJGBqtCtoqcj2u1Jr4bGtpmlMuk5wk6nw0rqnIUEQEk
	Fwf+y2U0g92P5g61t3yA7u9EG9SXwCCvbLC65n3SiiMFpGPA0px0uR7pYMjE/FB0V1WSV/dtUmxVq
	Lw6ML+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC8WD-00000002Wo8-1jTm
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 01:54:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC8WB-00000002Wmf-01Gf
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 01:54:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SLZoiI017358;
	Wed, 29 May 2024 01:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w43RXtj0fskVD1BKrCnAzh
	v3jEu4k3N/sLt4ARq8x0E=; b=QoajoswWOF/oEX5XWjARNuuywDT3V9v3/IcUVc
	sCJ++tV5KlRY+sZriDGLBGNPc/VgWDpx2pVwWhmWzBNZnMjQ6A6iIjDbtTueAKgL
	RzLhybuQm6CmDFyNbAylfEWMAEV6wAMoyh93KhaD110+8dmvjGs7TWpMpSgxP0ct
	X1HAhEFk1sgKCb6MSjiiHEIO0UfGjMhzzuo/MjxANneoUH5PA4Zl+C3nFnhQA+Rr
	aQwExEcfbnjzfDxxHz+PHJ7b7aqqX6/XMyrBlO8f36g5OLXQIOqmK0naPmfrYKUf
	x1QoIpdoYh3IZtQN5cftfltHIaTJ5AMKCO9dSBo64l91Kt6w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pqnba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 01:54:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44T1sENs024047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 01:54:14 GMT
Received: from bqiang-Celadon-RN.lan (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 18:54:13 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: do not process consecutive RDDM event
Date: Wed, 29 May 2024 09:53:57 +0800
Message-ID: <20240529015357.9846-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7-vOt_44nEetHkYe-HBpyOj-re-xZthC
X-Proofpoint-GUID: 7-vOt_44nEetHkYe-HBpyOj-re-xZthC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_185419_127117_83E52E6A 
X-CRM114-Status: GOOD (  15.64  )
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

Currently we do reset for each RDDM event from MHI, however there are
cases, see below log, that we get two or more consecutive events, and
it is pointless to do reset for the subsequent ones. What's more, it
makes reset process more likely to fail.

[  103.289864] mhi mhi0: System error detected
[  103.289871] ath12k_pci 0000:03:00.0: mhi notify status reason MHI_CB_EE_RDDM
[  103.293144] mhi mhi0: System error detected
[  103.293150] ath12k_pci 0000:03:00.0: mhi notify status reason MHI_CB_EE_RDDM

Add a check to avoid reset again and again. This is done by tracking previous
MHI status: if we receive a new RDDM event while the previous event is
also the same, we treat it as duplicate and ignore it, because normally
we should at least receive a MHI_CB_EE_MISSION_MODE event between them.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/pci.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index fef2f7622033..df96b0f91f54 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -16,6 +16,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	90000
 #define OTP_INVALID_BOARD_ID	0xFFFF
 #define OTP_VALID_DUALMAC_BOARD_ID_MASK		0x1000
+#define MHI_CB_INVALID	0xff
 
 static const struct mhi_channel_config ath12k_mhi_channels_qcn9274[] = {
 	{
@@ -268,6 +269,7 @@ static void ath12k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 				    enum mhi_callback cb)
 {
 	struct ath12k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
 
 	ath12k_dbg(ab, ATH12K_DBG_BOOT, "mhi notify status reason %s\n",
 		   ath12k_mhi_op_callback_to_str(cb));
@@ -277,12 +279,20 @@ static void ath12k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 		ath12k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
 		break;
 	case MHI_CB_EE_RDDM:
+		if (ab_pci->mhi_pre_cb == MHI_CB_EE_RDDM) {
+			ath12k_dbg(ab, ATH12K_DBG_BOOT,
+				   "do not queue again for consecutive RDDM event\n");
+			break;
+		}
+
 		if (!(test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
 		break;
 	default:
 		break;
 	}
+
+	ab_pci->mhi_pre_cb = cb;
 }
 
 static int ath12k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
@@ -313,6 +323,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	if (!mhi_ctrl)
 		return -ENOMEM;
 
+	ab_pci->mhi_pre_cb = MHI_CB_INVALID;
 	ab_pci->mhi_ctrl = mhi_ctrl;
 	mhi_ctrl->cntrl_dev = ab->dev;
 	mhi_ctrl->regs = ab->mem;
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 6186a78038cf..31584a7ad80e 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -104,6 +104,7 @@ struct ath12k_pci {
 	struct mhi_controller *mhi_ctrl;
 	const struct ath12k_msi_config *msi_config;
 	unsigned long mhi_state;
+	enum mhi_callback mhi_pre_cb;
 	u32 register_window;
 
 	/* protects register_window above */

base-commit: 2580be9ee6f5d97d6763b5d4ae4f9c0383fdf130
-- 
2.25.1


