Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47211C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQPdjud9patTgXI8gE16zhbDBone3Y9dB2K7l4OATiU=; b=E9MQR6UehSdXOPyU1308hwiBCX
	ysRHc9RLXrjB3BmbCQFew95P6nqTpl1fVH8xHrq996IADuEhsec3rFSnWimzlLtHljDXh6mG/Poj4
	W2c3Xjt1Dvu7F1wfijVBBCuCoVRWNad9F8L4iLQLgdL2gl7l5ZEXQOr7DmOhq/jwGCIjedfUGdKD8
	u9MqC3r9odzS1eSL071KicC8vC7FC1XK0W4ZVjvRRqBGFGozuvvYOk4Rs8Vk8TcJKH6UHID6DIA/U
	p/O9Nt2O6aRqbIsldWlDElMVs7+j/fAsnVDeI657lmwCXXkzPdXfDLR8m3sHNMCEP0jWlwBNfRjSV
	s90SW7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jZS-00000005mNO-3sgt
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 09:14:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1jZQ-00000005mMU-0q54
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 09:14:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U8IGiR032156;
	Tue, 30 Apr 2024 09:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=jQPdjud9patTgXI8gE16zhbDBone3Y9dB2K7l4OATiU=; b=gq
	KkQvG6Ouy16iF+lbGJKJIL1S3ygC9F/MYRM2KLH1Ur4v9m4VctSeQ7ebCrkCfX7Q
	bgnrwlgBUMLcJVYgDN8chKDq+6MaNql1IymCncmW1vVCPT9YLoAXq+fawvTjnTji
	/5JWk9WTeWlwmkWdh9WwPeYE4/LB12LMqEq/LOS9qvYAHyDdLxhZsyM4xn+NMdU0
	VkRQ9Mj8LSkFz+KCBAIEeL04BGBtvstPgQaNf/Wg2d2hd0cu241mv8gHxenlltnf
	2BzmdtPx4lzP9gBk1ba3LCKBqsZxufai2d9kMKTQCJxM8rzrN0nkdiut1Pwd8GLw
	3u9zbJHPXHRR3kvdV7Ww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xttw3gdm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 09:14:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U9EWXx026707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 09:14:32 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 02:14:30 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCHv4 1/3] wifi: ath12k: fix calling correct function for rx monitor mode
Date: Tue, 30 Apr 2024 14:44:12 +0530
Message-ID: <20240430091414.2486196-2-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
References: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hx8K41ixpr0-zJlwddV8oNPwuIte4rMK
X-Proofpoint-ORIG-GUID: hx8K41ixpr0-zJlwddV8oNPwuIte4rMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_021440_365166_AD142861 
X-CRM114-Status: GOOD (  11.37  )
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


