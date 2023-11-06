Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8421DC4332F
	for <ath12k@archiver.kernel.org>; Mon,  6 Nov 2023 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OvgzBiWN8qh8loiPS1lb/gDzN1KQ/Sr2cTx5wrcU4Y=; b=qg2iBlZVW7xhjF
	vJOkzYe9cPH0+edT3Xz4rFcnkkkxrbQGT1OAgwdOknQqjTegzzONNKX9sWXx/WMOCnokAeVuH7xI0
	yOINlz/Z3VjFkYBqNC34V45xH+ZapCIjKYRcRim8IDyt9iTl+31k0aG/SvEzwSlsYKbNwXYoAJZsz
	w+p67iJ1kbO8IjBos+LL5BKmx93uvb21iTitFHFrv1agrkXN7aGS2SFcvdf6fGdKe8yq3WOiNTmMy
	kA8T5V4LPr6sKVGADqbYGGZjGzPGh99CoJtH70gE4xQ26yJLHQGjAarJe7PPxiYt117rT6weLRGmY
	NrOso3VnDo3AQRaD31MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Dt-00HJBu-0k
	for ath12k@archiver.kernel.org;
	Mon, 06 Nov 2023 18:21:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Do-00HJ9K-1Q;
	Mon, 06 Nov 2023 18:21:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6D8Fai021364;
	Mon, 6 Nov 2023 18:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=KXhTaYqFaKXTr7+mcAYcRVmQtxxoVueu+E2/hfA2RQs=;
 b=OnYhsNFVWdgD+5c63G+YMjcIyWcBHG3YgV1k1DT8EPzZ1jmUTqB6fcESX7Wmquvu9IuM
 enrwEBQ2nQYoptlsQuvkOwUHdeeqiVowywE88rxZT1/q+H81PLNgGq3UXsXYblIjwgDP
 iMM4b5pFbLEGqLPsSfGxmlwpcUrJB+H60WpLxMsE+Bcg41y1xwk/P8KcZVOgEk2f3cJF
 iKGWUwotMBHDieVQOudFlQK1xEVInkwutpogoMTSelIkyLK1JxQXnmJvMf9C/lv0Clfg
 d8ByqXteqQ2Bglh8dn2hkxjDzV+4zznshegXT2qlLmdzh1PFy3BP5Z+Yq8hD2pZ8gNQh UA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u6wer1dnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 18:21:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IL5Fi021760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Nov 2023 18:21:05 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 10:21:05 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 6 Nov 2023 10:21:04 -0800
Subject: [PATCH 1/2] wifi: ath11k: Remove struct ath11k::ops
MIME-Version: 1.0
Message-ID: <20231106-ath12k-remove-ieee80211_ops-v1-1-d72cef1a855b@quicinc.com>
References: <20231106-ath12k-remove-ieee80211_ops-v1-0-d72cef1a855b@quicinc.com>
In-Reply-To: <20231106-ath12k-remove-ieee80211_ops-v1-0-d72cef1a855b@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LxNsz99jzpYWetG5oIxXXWm9Ea_55EZi
X-Proofpoint-GUID: LxNsz99jzpYWetG5oIxXXWm9Ea_55EZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_14,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=481 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311060150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_102112_486522_32182255 
X-CRM114-Status: GOOD (  14.26  )
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

Currently struct ath11k defines the following member:
        struct ieee80211_ops *ops;

This is being flagged by checkpatch.pl:
WARNING: struct ieee80211_ops should normally be const

The original plan was to add the const qualifier.  However, it turns
out this is actually unused, so remove it.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index f12b606e2d2e..7e3b6779f4e9 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -599,7 +599,6 @@ struct ath11k {
 	struct ath11k_base *ab;
 	struct ath11k_pdev *pdev;
 	struct ieee80211_hw *hw;
-	struct ieee80211_ops *ops;
 	struct ath11k_pdev_wmi *wmi;
 	struct ath11k_pdev_dp dp;
 	u8 mac_addr[ETH_ALEN];

-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
