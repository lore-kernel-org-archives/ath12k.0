Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129F0C25B75
	for <ath12k@archiver.kernel.org>; Sun, 26 May 2024 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yYgAqwB0GE+MYff2t8X32ihu/xrKUChLjthQqWLcC98=; b=C5vAF7EBX96tHFUBfsYsPXpR24
	bmr0PBVAc7bF4tqndOu4apl8soyUNktOCSS+h4jGgnDP8o+/NpjgeMEySQg27KtWQlimZe7vg20rz
	cYS025yQu9CWEQvOcqRKhoUZnUI3mf60D32ap4aklIavvqd4wnLFsBYpYBaxL7JKNVs14rVxN5wTW
	gswTh4FkUnXnXkSQ3wtE25mifYi2wXQF/kUpwMLENo66HFkULXfn0cpiEplNXO3Vyk7eXzv3/kDa7
	/zUuP0KFveXNnLMBSjn/BFqacqbhlTX8YI3iARxDdxDxrOjVs2X7xeD8sUdtuwH6B8C40z5L1a8a+
	TnLIuREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBDD5-0000000ChcZ-0oKK
	for ath12k@archiver.kernel.org;
	Sun, 26 May 2024 12:42:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBDD2-0000000Chc3-2RNf
	for ath12k@lists.infradead.org;
	Sun, 26 May 2024 12:42:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44Q9KfxT016949;
	Sun, 26 May 2024 12:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yYgAqwB0GE+MYff2t8X32i
	hu/xrKUChLjthQqWLcC98=; b=aSOs8wsbayoCRdhAZdGr0ubv2FDc3iYyWg0SDv
	8gx6aPNfw1YcfH4asLKKNJ4BU10ZY3yTHlwGWq6FM7wA2kZ4Hp7HYuCy41jYJ3sJ
	p+1GrfoxVdHwxEB9my4OHaE5pAD+KZ2p+kAgu6C8srmylHU5vweKfQxBJO3VOk4e
	dlMtj7WksQb+3MfZNTv3FbH6cb2lSQsox/fadkH7dFVDJKuZpd42PNZs+X1vZ+wv
	atsLjECGnBqfqi2TtDlWQm6TcRTTILu5qB/t/uP91V/C2Ln0HKr4mpfMNVUc+OCF
	F9GbPiR2OYXeZdxz/9+iHJuNCrvCf6C6p2Qj/ohO1eTrEm1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0q9qp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 May 2024 12:42:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44QCgcVf006228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 May 2024 12:42:38 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 26 May 2024 05:42:36 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix memory leak in ath12k_dp_rx_peer_frag_setup()
Date: Sun, 26 May 2024 20:42:26 +0800
Message-ID: <20240526124226.24661-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ALhTeVlk_etlRo1kBnmFUEmKqRwE4HQS
X-Proofpoint-ORIG-GUID: ALhTeVlk_etlRo1kBnmFUEmKqRwE4HQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=957 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405260106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_054244_774992_CEDAF24A 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Currently the resource allocated by crypto_alloc_shash() is not
freed in case ath12k_peer_find() fails, resulting in memory leak.

Add crypto_free_shash() to fix it.

This is found during code review, compile tested only.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index a52b7b273540..cb1f308f096b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -2742,6 +2742,7 @@ int ath12k_dp_rx_peer_frag_setup(struct ath12k *ar, const u8 *peer_mac, int vdev
 	peer = ath12k_peer_find(ab, vdev_id, peer_mac);
 	if (!peer) {
 		spin_unlock_bh(&ab->base_lock);
+		crypto_free_shash(tfm);
 		ath12k_warn(ab, "failed to find the peer to set up fragment info\n");
 		return -ENOENT;
 	}

base-commit: f8320064a28242448eeb9fece08abd865ea8a226
-- 
2.25.1


