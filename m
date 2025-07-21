Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C2C87FC5
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 06:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZlJN5oVr90dWiBcVCfHAuYI5gu9mcC0C9zQK095a8dY=; b=BjEJhXMHSKT255plqkhFQUcdYA
	o48ZDzogiOMEu195Sfnx3DUlUFwUO9s05ISffzZux8BcmPoZ4JkoerPgtHBGegfpm0WzvrCnE52qU
	lm5hXJnc1yHUMtkLi63mbQ9hTMQuJTgmKcBobBn89V8IDD3TS3l9yu7U00dA0mmQ4EkKNClkItMX/
	91YfXMlk//5lXl7zJXDUohLUxuEX4p3mjXNBBOjWgwc7X8JsloeUgxRgQNpqMQ0xJ73pnafZEMwj2
	UZfQAf06G46moinK1IWPguu2+jYYQw5umccBIoHGFSTWtRsI0I91n9pzIlNQyG5tZstjolxlJma0P
	Y/R1F9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udjqs-0000000GLpK-3V0M;
	Mon, 21 Jul 2025 06:18:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udjqp-0000000GLos-46Ld
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 06:18:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56L40en3029341;
	Mon, 21 Jul 2025 06:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZlJN5oVr90dWiBcVCfHAuY
	I5gu9mcC0C9zQK095a8dY=; b=jE2Xe5sdHz4ACDo0aGzp5OMnVx/EC/PZwMKoDJ
	1Bb+JsgGfLaQgnEQ++U9M0/XeTCw/2pQYP2U8klNrcvkP8bagalPOwh+KlWAtt+7
	UCkqWpYaT2SU3r2qsp/HA+S35XJrdfhBs8hBqerCm3cMH8q7g7U64en9fFJ4E4Wk
	COm3zaZ8BWJsAzzBeJhexaflx98YERxFx/9Z5VIuzr7BzKu1vGDWt0tUybpbX25O
	sjghl+LxhG+pPSHwBYLU+bM5Js0dAJo2rkFemuqN9JA1AoZt8ER3m8mVY5ZQ3nAq
	ohfSz3H85gX/4pBUMBZcywaaodL2KT2H5Xg/yAlPgiX8RTqg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tbhnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 06:18:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56L6IDwQ030155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 06:18:13 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 20 Jul 2025 23:18:11 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Correct tid cleanup when tid setup fails
Date: Mon, 21 Jul 2025 11:47:49 +0530
Message-ID: <20250721061749.886732-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDA1MyBTYWx0ZWRfX4wFnlH8qouHW
 7L9KI257M3ShtWwrX3EpW0xvTHrMTr3DNH5DpUQydaL2X3WPa9gNdL//9aoiE9zMVzv0WwpWU+O
 NQAlgg3d9+K6da8i+hT7MUQvylM9Jjqkb+3AmIEF2i8zhvYc+shYf3EvN0mXGoAHFsBjKaWS2Pn
 4sAKTo1lnPBD3KFc274w8AMrELamhzDO0u23/KNgZrk5X1O29thfEHI3saHeyDgfCABGlQhPcY9
 r0H5Hqo/f4aNnzhdBdMUFzvPX0OWt3hUjtOaeEj2BZm7M8Kz8Qd8O887zS5eGSVFmBZZ5bNw5/u
 cCfqTlVHDfIom1KNmcgM3loL3siZi337Xq12ua8FGYdsMUxKV/63sMY5rxcHXAdGUETuy81yoac
 dAwS90HOOb6wSFHuXT6DotkcMOOPH7fNwSHhmtME/iTp+my0YYTLhhQqCqnLuT4ZoX3Euv7c
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687ddba6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=CWTa0t8FBOVfgmuD0OcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q5B426fDISiwyLMe-35ihibODd_rLntw
X-Proofpoint-ORIG-GUID: Q5B426fDISiwyLMe-35ihibODd_rLntw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=994 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_231816_151011_F8B92217 
X-CRM114-Status: GOOD (  11.11  )
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

Currently, if any error occurs during ath12k_dp_rx_peer_tid_setup(),
the tid value is already incremented, even though the corresponding
TID is not actually allocated. Proceed to
ath12k_dp_rx_peer_tid_delete() starting from unallocated tid,
which might leads to freeing unallocated TID and cause potential
crash or out-of-bounds access.

Hence, fix by correctly decrementing tid before cleanup to match only
the successfully allocated TIDs.

Also, remove tid-- from failure case of ath12k_dp_rx_peer_frag_setup(),
as decrementing the tid before cleanup in loop will take care of this.

Compile tested only.

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index d80af435959a..9ea1eb3fa17d 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -84,7 +84,6 @@ int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
 	ret = ath12k_dp_rx_peer_frag_setup(ar, addr, vdev_id);
 	if (ret) {
 		ath12k_warn(ab, "failed to setup rx defrag context\n");
-		tid--;
 		goto peer_clean;
 	}
 
@@ -102,7 +101,7 @@ int ath12k_dp_peer_setup(struct ath12k *ar, int vdev_id, const u8 *addr)
 		return -ENOENT;
 	}
 
-	for (; tid >= 0; tid--)
+	for (tid--; tid >= 0; tid--)
 		ath12k_dp_rx_peer_tid_delete(ar, peer, tid);
 
 	spin_unlock_bh(&ab->base_lock);

base-commit: c65cf1cfe591fc86d23b61c0394d6e015dc1430d
-- 
2.34.1


