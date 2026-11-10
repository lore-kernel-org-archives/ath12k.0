Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E72606A32A
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BU9r6f5C;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y2MQrBmC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eDYnS+fw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=; b=BU9r6f5Cyttbdh
	8unSbKfaT4+SCvJ5TsbBTHgg10Z8Zoju6iPtjCuelaa8VTx9R3qt8tnaHTZGoBH9vkcefwMN3O6RC
	eqTYALkgGuAQUirgfdRvtkX0rAMo3dc14e8gy0YMbTDytFPRfH7dNOKoOAAPORssw1lFLXWLhqJtq
	V3eYO/N6elOlo27Ifa5URkyck/oBfl/SGZiA5f3xWLpvVVRmS89fKTMvJQkG6OGtqoCJkrKG4o7Q0
	leVFS4UHo9HDegOEtXTGuSMCoVr9aTRr9whIn5KZB+6/xqY5Y6BNuOv7O8CicvUB7giD9guxZJm7I
	5BpLrp8mUTLZI5DOqwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXG-00000002fqW-3YFR;
	Tue, 10 Nov 2026 06:40:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXC-00000002fmj-2dGg
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA554632414830
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=; b=Y2MQrBmCSengxvn7
	yxiy1SeOi4Gl/Pmx2Yz+KdQiXjL6Qw/WMePCbtuoKZxUFuvCGr1Y17jJT2QXCPO1
	MOiGBEvfQxcPiNjqadkG692RJ40sxoQq9ItOIE9DuTL5QxkQj+GwjAZGcyCuyY3R
	vNcsAPfxEAW7ovxlxbAYqfqKEBmcq0tYuedRPBA7QRq6JCm8yXjVctGsJcDh6+x5
	c6tDta4z+FiCRzqBzGjXlJv/k1+s4GWi9KZGNiILMD2NBKPesPkXg8HbVnCS4TKC
	xzg/DR9w1hHvviygqKf/Q6GDdW+Gp0ZmrHqWcGAsHLNN6RFwOa3DnlOPiRoIaoSQ
	npc7dQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd8cb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a3ee64bbso3044735a91.1
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292845; x=1794897645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=;
        b=eDYnS+fwU0p2lYZEDaoLvChp+3/82JKdD6X/Fs0HHQ6IgO5pgi6liVplRkUh9Nq9u4
         bWn1KYbVnUC12SKiuMtT7jh8JUd0eFXa8cXhLvibOcRovY8TGX9JHKgHdjaw9y6nfGXh
         oE4ToIgskgH2KhdcYlcxwsIGlzQfJsx48ce9tRp4lX6JrSUBAnMxLDSPxwXqbpE5yBEx
         AkplOohJ8XtNJHyD4XS4xCTSoBf4R01xUCwp8q0zEtM3RdYtXxz4ff//Ef3My96bv4Rv
         qiEhL40g+MUGFU8ojjbhj56iCptpjsIKb/Z9yqTBBIIT26f8h8rfgMZcSLLB4WdedBIp
         ygJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292845; x=1794897645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9MGcR/WVOFlNyeewSJdMpwfkqpUNalNPkYUG9xcLbg=;
        b=Mf+D8hxklv8BLzO3u+tduL2fLlMRpLd3CmpESCCCiSXBq47kIkDr8oDtnCGvlDgxqr
         6SeBtbiR1oOhnghnefDZg3znXpZL0mxQYVvSrTCVjd+kSbGfmNS9D2jSwdW2mFw3u9pM
         AN6lrc8LfCxsJRlXwpwYjSdaTSpWhGHvv9bLuyo3nQvIfpUqFvGJ0kfzZaEZbyz1QN5w
         nUGrN4D3cnSlfXByFvyzwxQZKyw8rXELABG4kUK+knTwtpTijB+G9gLp3yqBLz+7n8vy
         5zm8rR3QfQ5EYVv+KZnMBDz3EOnYsMkFJFwQ3wOkf2SRTD0aD8SK+QG31SxTnnRyKAql
         plqA==
X-Forwarded-Encrypted: i=1; AL+hErEsvmh4VSjGZ2tB8AnmHGAiVDVg2q3LBhqmsnt48wzWt8btzn+guftO8KnsI+smVcuudUQ3oOE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+pW8Ql4FpqdbNmLz2n21mu8aiJ5GVe6L1KgqbCzlhYQYsfUNR2
	yY3ylP4gdQNuEublWaJ5IfIkA1pYnL76BKMvZkZHLlutRoR0dDdtyLSertJ2F5SN3lmuCs5joBT
	3DqbwfYnimCgy3aWidUVys6xkYfzRk8Oz3mVDjzTYCtZ8zfjoHViNdCrIXXs8hUNX
X-Gm-Gg: AYBFou14f09bze7+WzbrnNmqkZAFznOw6tKt8H2O9U3X48REj1Y2A5Pe8q1grBP8jkY
	teK2Krkdoz4iWzbTK2oChL3tE3DTfQkWEYMMhFFOp/6X06XPW1U947NBP+krpNS1ybdQyKECFCo
	1knLyso2fkYs2t511iujOqoPllc+H1RjLhSNAhoy4iSRTe9it6Wz1982E36evsR5YJjZKBwtkBb
	7cFGpiw0ptBSsjC3OIMo5bTG5xXqhHVRJKam9GRJKpRkctWqQU5cS85ousH8gKGOhllPwT3CR1y
	kLC980LBih1wfWCq1cQvUh1SwhxssPFYAdfdvy4OCKi/vMtmfkL+ycnB+K+EPHzPw6i6sPNv/2f
	Jl6FdzSlHkBBuDX6dijDSL8RGT3/KSZLdmQ6YvB/bamZHJuytayygE7+JOec9AGg4DUGu5rKLhx
	HUUR4X2owm2DDKse0Fbe/PwOrhzWvLDg==
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1825077a91.61.1794292844505;
        Mon, 09 Nov 2026 22:40:44 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b166fdcc2cmr1825059a91.61.1794292843982;
        Mon, 09 Nov 2026 22:40:43 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:43 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:25 +0800
Subject: [PATCH ath-next v5 04/11] wifi: ath12k: rename
 ath12k_dp_link_peer::hw_link_id to drv_link_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-4-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 2QjNQc9pxYL4n7m-7FLAV6vW-Ngk0yAD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX2O75NAQMHybA
 UAQQOtW9oKXqnuCCAG8GgWhDGSYTBZmGtnbDYJKGRzF6fslw+Iyvrq5iAcbLSdkTTIGZIKPZSgu
 fHsb5s2ve118UIRlPmoKB37dBODvFSQ=
X-Proofpoint-ORIG-GUID: 2QjNQc9pxYL4n7m-7FLAV6vW-Ngk0yAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX6FEfTJc3lPfn
 gt57qPJITAtsH8ABKKiDzdeEV5h2MVdEgWj4FluOsLSoMiCsw/C3j20WKfX/ObCTEnGAZGjXw2S
 lXzgNKWQLHknMAJUUHNasvEjU4DjWotgscTh7DxE792hEaTqJ39IMSAaMoNXe6aq4U9i3YvEJnJ
 Mws4pOgCMyHUa+wTnfMx27i+YqY9LnS3kJg+iTIX/PQ0xqTNCkcU1JPr9xcNfl6kzm8KR5py0Rw
 9vkKt+6QNX1e/XXUdf8anfgBM1Hdh/xcOfahP1O4GJARdcHDtctfy0h+k6npTQrQLTudSOpdvbE
 f6l2Z7KfkSuDfQz9CKTql7Hr2gXy/05PUgg1ho6SCtosrnpyJuhwSfiWfJqyNMUbXc7XD8w3CBl
 vZXzRD9KAi4LClLYSqE2gErx/+3Jx9nFmBXg58FbSIOF/xemJ/5xS/t745ViXypca60poV53qY3
 XwjWaETp+HadsNm2RhA==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af2bc6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NxgKQpyHIDudPh6FZjkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224046_809567_7909955A 
X-CRM114-Status: GOOD (  17.49  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hw_link_id field of ath12k_dp_link_peer holds the driver link id of
the link peer. This is the hw_link_id for QCN9274, but for
WCN7850/QCC2072 it is the logical_link_id instead. The hw_link_id name
is therefore misleading for the latter.

Rename it to drv_link_id to reflect that it is the driver link id
regardless of how the underlying value is derived. No functional change
intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 10 +++++-----
 drivers/net/wireless/ath/ath12k/dp_peer.h |  7 ++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index aec30e010de5..94d98f80f9f9 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -543,9 +543,9 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		dp_peer->peer_id = peer->peer_id;
 
 	peer->dp_peer = dp_peer;
-	peer->hw_link_id = hw_link_id;
+	peer->drv_link_id = hw_link_id;
 
-	dp_peer->link_id_map[peer->hw_link_id] = link_id;
+	dp_peer->link_id_map[peer->drv_link_id] = link_id;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -565,7 +565,7 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		 * already present
 		 */
 		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-		if (temp_peer && temp_peer->hw_link_id != hw_link_id)
+		if (temp_peer && temp_peer->drv_link_id != hw_link_id)
 			ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
 
 		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
@@ -613,7 +613,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	dp_peer = peer->dp_peer;
-	dp_peer->link_id_map[peer->hw_link_id] = 0;
+	dp_peer->link_id_map[peer->drv_link_id] = 0;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -628,7 +628,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	if (dp->hw_params->support_hw_link_id) {
 		/* To handle roaming and split phy scenario */
 		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-		if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+		if (temp_peer && temp_peer->drv_link_id == hw_link_id)
 			ath12k_dp_link_peer_rhash_delete(dp, peer);
 	} else {
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index b9c94d6366fa..d2752b35ba0f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -99,7 +99,12 @@ struct ath12k_dp_link_peer {
 	/* peer addr based rhashtable list pointer */
 	struct rhash_head rhash_addr;
 
-	u8 hw_link_id;
+	/*
+	 * Driver link id of this link peer. It is the hw_link_id for
+	 * QCN9274 and the logical_link_id for WCN7850/QCC2072. Only one
+	 * of them is used at a time.
+	 */
+	u8 drv_link_id;
 	u32 rx_tid_active_bitmask;
 
 	/* link stats */

-- 
2.25.1


