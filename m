Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AE7C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQPdjud9patTgXI8gE16zhbDBone3Y9dB2K7l4OATiU=; b=GowutOb+m3manYcU6JG3goPnRQ
	W+LvoIo6NSJ5sAVnM/7w5aH+K6AjbtpWfmy3C74gGWd2TR714Gvz28NSDZDKOuiKc4EbmuQo2Elqc
	fbBrNmErAl8d272RaF53KtsPxnukypgozlVoX49h41ShCb708XkH0zSP8w2Uj19VswkddOuFbNpKv
	SEug966IgbN0peIzMQsIlenY4krr91mhuLznpY857kWm0A/zPNh/2ERjZZHCxzZsblzEGYSdFD/Jt
	1hdZRbmoUkQDNRnTjL6DjdTbAHryOcrG0UShM7w6lzpYXzq1C2ejnbqkQWONovYElRmfmFZDWF0qs
	m8om5gjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LK2-00000001o5C-1Xo3
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 07:21:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1LJz-00000001o34-3Buf
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 07:21:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T5g6vl001538;
	Mon, 29 Apr 2024 07:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=jQPdjud9patTgXI8gE16zhbDBone3Y9dB2K7l4OATiU=; b=Z3
	yxRWLse5sqztRs0l50L52Fo4arZFMPfTtmDjzO6xpwgdYgUtDuI4HhqP4JB7yr3U
	atzYH9OhUjsO3ZTu+kRdTNFrdieBoUYd4n1fBseJAZavSwVFaMRV4WrYUEFkhYUu
	hpsniYnxZE6czc9R1jHvajrg1j9vkn5mAfp/3aHGgmJq/DmcTnTD0eoRBYUQdXFz
	QVcHLmDXrEfyaIhOXxSSYBlNVJf+6E3HrgEqjz84QUmZgWiHY6QVPHIepxb2TliN
	thMd5aYxMUrra+7jyd97HxBg7fx9j+ETAV75KExpeYTQ8xPxTZHITI9KVvZjvS9n
	+bkUNyaijfUynKJaqdcw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrrcck32e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 07:21:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43T7L4lF009384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 07:21:04 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 00:21:03 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCHv3 1/3] wifi: ath12k: fix calling correct function for rx monitor mode
Date: Mon, 29 Apr 2024 12:50:37 +0530
Message-ID: <20240429072039.711706-2-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240429072039.711706-1-quic_tamizhr@quicinc.com>
References: <20240429072039.711706-1-quic_tamizhr@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6skTxESX3aAxnVgoK506_aDu5z78IYVe
X-Proofpoint-GUID: 6skTxESX3aAxnVgoK506_aDu5z78IYVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_04,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_002107_956514_39DA0040 
X-CRM114-Status: GOOD (  10.87  )
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

Currently in ath12k_dp_tx_htt_monitor_mode_ring_config()
ath12k_dp_tx_htt_tx_monitor_mode_ring_config() function wrongly called twice.
Fix that by calling ath12k_dp_tx_htt_rx_monitor_mode_ring_config().

Currently monitor mode is disabled in driver so the change is compile
tested and boot sequence verified.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 9b6d7d72f57c..d002de0fd5a1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1050,7 +1050,7 @@ int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset)
 		return ret;
 	}
 
-	ret = ath12k_dp_tx_htt_tx_monitor_mode_ring_config(ar, reset);
+	ret = ath12k_dp_tx_htt_rx_monitor_mode_ring_config(ar, reset);
 	if (ret) {
 		ath12k_err(ab, "failed to setup rx monitor filter %d\n", ret);
 		return ret;
-- 
2.34.1


