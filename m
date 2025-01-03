Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D30E77188
	for <ath12k@archiver.kernel.org>; Fri,  3 Jan 2025 06:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6eap41FSXrGGIp+9P7B5aqT1/UKYZFFUNQzmQk6Iuc=; b=Djd/Vze17SgKK7AIZVx55LOESh
	gsX6UHePA/0JY3IKsdTHV0t0vetyOwcrIg+7dwT4VT90SbWoCMl3qnWk+437xMl01CblJJ5nfNKMK
	kI0TUY/czBfTL2eMdf3JHM5hmoJj6a6POMtIBJyvnEc8HXZqgTycCktKU6oNw8oWZweFUQeQRsVJv
	kH7OdRnu/iP9DaS5wdU3gKy63VS9O4IOrIq6rBvsyhJSssm2h4HxzbY6COi1zCvCj2QDnjhQMD5t7
	BSyBISW/nxCY/sfDUK6TclRtDXVS1cTxoFK9GNDm0CkfclznVkjbxafQtCr9UkGp5u4uEqdpaiV9I
	sKVJ4VAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTb3o-0000000CC3M-1oMp
	for ath12k@archiver.kernel.org;
	Fri, 03 Jan 2025 06:21:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTb3m-0000000CC0I-0BB0
	for ath12k@lists.infradead.org;
	Fri, 03 Jan 2025 06:21:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5031hYtY016503;
	Fri, 3 Jan 2025 06:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j6eap41FSXrGGIp+9P7B5aqT1/UKYZFFUNQzmQk6Iuc=; b=BaXt7mECblN0AB63
	mdJnR9wIUNMqEA/0sOw+vyj/4andjsO9IA/k8AlzPn+RsByPR5JJqzIfwgrnHk1K
	5aP8scI2mb4Vzbf+nL/AyANne/gX4TjcdG5nFuiiB6Lk0a+GooF+5om2usNR9sR2
	6BfwGhgfSZiXd/n0MFNNLz3JS7Np2/ax37q/C0dCjd/4w8ZATmFSVA6h5pNF3uJJ
	52CLotR6WsaOpXHcQr0ijVNpj/mQXUxx5dU3FLcZNP1urblXd540ahtsHuCxaOB9
	zWeUe6iPnd2tPOchen42RXYUaGN4a1GwTAltSvY9JYWo3YhYA5l10J1ZEcpqjLwO
	fauXyQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x6g0gg9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:21:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5036L8Ns009942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:21:08 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:21:06 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v5 2/3] wifi: ath12k: properly handling the state variables of monitor mode
Date: Fri, 3 Jan 2025 14:20:40 +0800
Message-ID: <20250103062041.1857-3-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250103062041.1857-1-quic_kangyang@quicinc.com>
References: <20250103062041.1857-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _08OuLvyVaulY9dpRk20rdq_mezrcJw7
X-Proofpoint-ORIG-GUID: _08OuLvyVaulY9dpRk20rdq_mezrcJw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_222126_086676_115188AB 
X-CRM114-Status: GOOD (  12.31  )
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

Now monitor mode has some status variables, such as monitor_started,
monitor_vdev_created. They are not always handled correctly.

For monitor_started, it should be true when driver works in monitor
mode, and should be false at other times.

For monitor_vdev_id, it should be -1 when driver doesn't work in monitor
mode.

For monitor_vdev_created, it should be true after monitor vdev is
created successfully and should be false at other times.

For monitor_conf_enabled, it should be true when mac80211 sets
IEEE80211_CONF_MONITOR, and should be false at other times.

Handle those state variables according to above descriptions.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  5 +++++
 drivers/net/wireless/ath/ath12k/mac.c  | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 0c6b35aac96e..cf471acb75e1 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1261,6 +1261,11 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 				     ath12k_mac_tx_mgmt_pending_free, ar);
 			idr_destroy(&ar->txmgmt_idr);
 			wake_up(&ar->txmgmt_empty_waitq);
+
+			ar->monitor_vdev_id = -1;
+			ar->monitor_started = false;
+			ar->monitor_vdev_created = false;
+			ar->monitor_conf_enabled = false;
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 6f10813d9378..8b99d01b32e6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7947,6 +7947,9 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 			goto err_peer_del;
 		}
 		break;
+	case WMI_VDEV_TYPE_MONITOR:
+		ar->monitor_vdev_created = true;
+		break;
 	default:
 		break;
 	}
@@ -7993,6 +7996,10 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 err_vdev_del:
 	ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
+	if (ahvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
+		ar->monitor_vdev_created = false;
+		ar->monitor_vdev_id = -1;
+	}
 	ar->num_created_vdevs--;
 	arvif->is_created = false;
 	arvif->ar = NULL;
@@ -11057,6 +11064,10 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	ar->num_tx_chains = hweight32(pdev->cap.tx_chain_mask);
 	ar->num_rx_chains = hweight32(pdev->cap.rx_chain_mask);
 	ar->scan.arvif = NULL;
+	ar->monitor_vdev_id = -1;
+	ar->monitor_started = false;
+	ar->monitor_vdev_created = false;
+	ar->monitor_conf_enabled = false;
 
 	spin_lock_init(&ar->data_lock);
 	INIT_LIST_HEAD(&ar->arvifs);
-- 
2.34.1


