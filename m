Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF5EC83F1B
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dG+nMKWZ6wjAGzgGQE8bbK0jnDA48BfrJlJt6VGsyR4=; b=GbDSzHj6D7XbcT09rqrkQyDM8A
	FtjR7HK+I6D07LVjfpvG2Co955B7Sqx1dun5ar6YfkAr8VFL6fF930ic6LfLRlw8HENzU17/ovOVm
	5d/QyBSVFmyvhOj73iSGXXrU251DkQgKUfJfV5bktte7So7HBZN1TCZ0Y0G9hYko/U3m+1XHqo2g4
	rd+mc8E/0CpgATWoz7Q15Z1Jl3qPFKWmMHXEx1BxqcwllxH9bm8FbaYqdkvgLfDNBvY6PUjQVxQA0
	XIS+Y14QXS2q1nkrtbBRE1TwrInwR/3tfUOZoG6ZOyqO/CC97eWcyKIwPspbHaeUeMgocrC5dz/kp
	XsMRM5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHCV-0000000210Z-2R8b;
	Mon, 14 Jul 2025 11:18:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHAG-000000020jP-3Skv
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 11:16:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA515k000421
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 11:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dG+nMKWZ6wjAGzgGQE8bbK0jnDA48BfrJlJ
	t6VGsyR4=; b=T4tQwfc5EFSbNPp3P68WrDLXJFVtvJA/ol33mP1KXE/aqK4CHBm
	WPxQmHgqhYKuW7r5usoCJTNHx15+70lHogGqeP/m6M2EZnDF2o8+LAoNVObWLSgX
	3WBoCST53hQiZPZ3oBFF5krKFDaplRxJR4RJkPCvN9zFpnzlZBKQW0feoQIcQHLI
	fkArF5FyjBXlyiQB45lmqHoLDvUToNs5iVY0v4qdx1k59cAhZEGUqTgumLMZ8JWC
	jByRRKodEXEHhkZcb/Lb9Zw7Z1B1Z2UPF94An64f6QU9NB2RKqnqTdj/yus2P/Dj
	iPWb0hYZ1DQtiQWtuuRCUupfKOdhOL/OKWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu84dx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 11:16:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3130b82311aso919235a91.1
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 04:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752491765; x=1753096565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dG+nMKWZ6wjAGzgGQE8bbK0jnDA48BfrJlJt6VGsyR4=;
        b=UPkouqFVNyTiyzKQ7pmaJ0BE/EXzfwsJ4CucBXha7I7vchVkQEcfQ8u1Y+GCHlDpHq
         jBwzB/Z6b3JJMIKDYMxqZK0LChq2B2JhxLpaGNHXuitrfydxCNpf+yRbxdWhHlF9ulMb
         zXHU+0gMKWwC0UFrsQDYryUjq3FLJS5eQv9YusPO8fTO67bujZWiaPT8H83zTceZoiQd
         J5Z6qp84eVnMxJSEi/SlQ1hiRe6LF/Cl1MykaTA3dgMmiyeUSmFUah5t/VXdQ32c5NB3
         r3nyuzxryTxjmK8YpKszV61EZoD0xhiNU/VllSBBGdUmyf5KgU2YvYeOvkDLKtteCqJx
         kXNQ==
X-Gm-Message-State: AOJu0YyoYZd3Dqa4KkJgKMNQYGsqynaBK5nvVEa+egvPbitHHIhQ97IY
	fREx+exBbE2e9/xEbV4c05MaCVEiNss+8aTFW7blC8pTdgAIz1RuJoCpm93ZeU5KhqLZyQW3F9+
	MJHsVMbNRDRI1vi1PZSBmXYlTikrX4SWG/S4L1tmmRjKGMrB1ZzjwHcaHo+f5elIa3RGKYrMB
X-Gm-Gg: ASbGncugMdpbc9iUJTqOdHOC+SNQXeEFEF8Kms2mYvfvCeJtIr9z6puBKfE6ReCavC5
	ipmHejPJZmAkFEufsH/LuhB68rwWHeyCtCiT7EqFKQzOGbTW14wWEO7TFIw0sYLk1jnQxe/Eyo0
	brb2y3u3ZbZTcdVYIMiDfXMdd3bI+7JHnbF+wl5KCUj0mgUVBjZs/Ku2nQSAIgPgIGEwPBJ4svv
	BBNBOF4QpyUHSXbaiHAjTSzmtI6OVc+ojD0267TFU+2KH2lu3xzAZSQ2azCV+sCbnhD4nW9/44z
	Sg85386CHhyZOhQzCjqz/qeEDppJbUmzvG5r0AmBAjOu7QculCcFDYtpCrCGRUezYhd+6NYMd9s
	GN7AoE6HpMd8z/UpazENYagPrOLkJXlC92GXFcXjGIpT2BWuaOWiMeqJmM2JB1w==
X-Received: by 2002:a17:90b:3cc8:b0:30a:80bc:ad4 with SMTP id 98e67ed59e1d1-31c4f37b71cmr7265738a91.0.1752491765369;
        Mon, 14 Jul 2025 04:16:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv/OlClj0gEg6nmhE3nbbzGQ6uf0+3P/T4VFdgktuSZauGzDCYeKjceM50MdLjmzzd9ZSqbQ==
X-Received: by 2002:a17:90b:3cc8:b0:30a:80bc:ad4 with SMTP id 98e67ed59e1d1-31c4f37b71cmr7265722a91.0.1752491764819;
        Mon, 14 Jul 2025 04:16:04 -0700 (PDT)
Received: from hu-nmaran-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c301ae5fesm13225269a91.38.2025.07.14.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 04:16:04 -0700 (PDT)
From: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>,
        Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Validate peer_id before searching for peer
Date: Mon, 14 Jul 2025 16:44:38 +0530
Message-Id: <20250714111438.1134438-1-nagarajan.maran@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2NiBTYWx0ZWRfXwk4ASy3kv4e3
 mfjNVCyilcyFmIfr6vZADLhiYB4u7zZFq2UoxpKTee6PKaaOTBFNcFuGUXnc7OD9BHzXKDNcBlF
 NW+CRghh34jXmEEEXnlCMsIpABphFXwZI/wIsd/fxoo9CumCyzvxjZEIokvd64rDol9KI3rwLYD
 9EMVKrMGB03AVxJInyrBuaPLRxoNt2NDJ3XshgjOyzjcBiFLawcWiqtNnY5x4PjJSEHNU1gKcZX
 oK64t1hHnCIZ0cjcJ1k+6Dpusld2PllzpiG83/ddgc9AU23Uz7Rmi5k4kG/SpapsqbJnebo2m7K
 POXeiKGc98B2u/cbOjAt/b8+A0nwGESrO+MUr5IRfOwWvK/1zfFqdNiwmmbHFOVt1U7JKvjt343
 do06HMV5SkaC/bRbYll09AEhGFbBfYEm0mfdGdhFmMeawdKouZqsWSFFmmWgJds8/7EPcwyG
X-Proofpoint-ORIG-GUID: I3p0MW8kU7Yk7dvMgMPH9Fd-n48XxMms
X-Proofpoint-GUID: I3p0MW8kU7Yk7dvMgMPH9Fd-n48XxMms
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6874e6f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0KvMerAzGZTWNi1JVVAA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=804 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_041608_991771_6E9D37ED 
X-CRM114-Status: GOOD (  12.18  )
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

From: Sriram R <quic_srirrama@quicinc.com>

In RX WBM error path, error packet is received with invalid
peer_id (0x3FFF) as there is no peer associated with that packet.
However, this invalid peer_id coincides with the ML peer_id valid
bit mask, causing an unnecessary search in the ML peer list.

Prevent searching the peer list for invalid peer_id and return NULL.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
---
Changes in v2:
	- Corrected Signed-off-by tag
---
 drivers/net/wireless/ath/ath12k/peer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
index ec7236bbccc0..1a098cb22933 100644
--- a/drivers/net/wireless/ath/ath12k/peer.c
+++ b/drivers/net/wireless/ath/ath12k/peer.c
@@ -100,6 +100,9 @@ struct ath12k_peer *ath12k_peer_find_by_id(struct ath12k_base *ab,
 
 	lockdep_assert_held(&ab->base_lock);
 
+	if (peer_id == HAL_INVALID_PEERID)
+		return NULL;
+
 	if (peer_id & ATH12K_PEER_ML_ID_VALID)
 		return ath12k_peer_find_by_ml_id(ab, peer_id);
 

base-commit: 7e22b60a8af12b81ff3d416ed4e7d21fb98e9f25
-- 
2.34.1


