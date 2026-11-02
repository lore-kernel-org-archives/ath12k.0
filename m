Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA1D606A32E
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D0JLhrbN;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJ97RANC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoXhl4A2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PHCVFrHb7uDt80OnEuSQYeSutgkDBDLYcdWFEQO/hts=; b=D0JLhrbNYrXJVy
	dkOvaPVzOTDT09HJ7l4oauMgyOBnHUYpv+1RwJ5i+SuUGabDf1m9L5h7LPu5LJr+yHHe+MXOp7zVo
	DugF3tb0tIEaNJQF48LM8Avpv6RPuU7IELyblLeuO+y0hqMENepATZGrgiufLGBDAilR97dV1jwxy
	eeJVDK4W98mvpAW/6+7X2B8dG3cTBJ8YaeJKe8l2QHNp4ADoxgUiGZWW5qrdSko0YmTPE2F4VGTQr
	Zn/4H7wA4UnOCsHW1KH9aWGPrneVWVDsWnMtDvBj17fTkIaFSmsa4dcomUQWxTEpaZE12pPUBgSMZ
	NV+lKlzr6oYKW+cwt3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh2-0000000FeqO-11fY;
	Mon, 02 Nov 2026 06:38:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlgz-0000000FeoB-3XBg
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:38:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vH2G3324639
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHCVFrHb7uDt80OnEuSQYeSutgkDBDLYcdWFEQO/hts=; b=aJ97RANCeHwGxx7g
	fQN/+JMGehMboHfQ4S+8SIePlKhEkiNxtECBMsXS5aovnckMEWO73775ym+l72gi
	hOG/4tsHbhpfL6XGosBuCONMV2EZ5qDXhJYdulj2f9YfAIvGLOwJ6wsNN9nD2nf1
	wQ3/DuR1/g/O07gcb8xdOpqD/m4BY+WzetqOhJnZS7y+LtYup4Tm47e0qvLuKVms
	1WX1dGnE0LxwObndS4AzqSKSU+EHnTynN+B9DCl0oTY3DZe8kQ5hmUx6++OqoYJk
	LTQTHwtjz7hHciOszuYDCkfgAAJWjQUl6XiY1zIcxoG69exaHQUmCwACPsMeox62
	x8auuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nmsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3fc547bfso3523927a91.2
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601531; x=1794206331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHCVFrHb7uDt80OnEuSQYeSutgkDBDLYcdWFEQO/hts=;
        b=MoXhl4A2joCIG8ILa96w55+gYt8+5avR33CaSoe+Yo8CP3LVqWUhy9ADEyyG26BWGi
         7/GGPJs6+DHLSzjNYZucLeOISOZsHVPuewwPoLvfgcSP/WuSk10KTFFPwbj/IpojCcuB
         RHNe/xbdWZ76Nn/6eZ3rT/WaqBoybTDD+aDEEpqib24mRgr9sLONgY9Dc+va5aC50/M9
         80Gc+/XILIbpYK4fx9VByMuSPID8JODBQb13lN0BU/5wXtPrUnMY05vHoKZv3uBmhm/P
         lAUPz2e61NX3sa6NUAF+mbpjtKRrXlaBmeNMPm3NKvVUDPefTmu5/cVHfTsoEZapRQhW
         oKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601531; x=1794206331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHCVFrHb7uDt80OnEuSQYeSutgkDBDLYcdWFEQO/hts=;
        b=mZNPCmYn10xJgYQhmzx9QjbPc6iw+O0DSA7B5/o6zri3hM1PGDUVcxsm3ham3m0ui0
         fmHCl51ZzFyPRgKNrTYCteLdqJtEHWuFJFW7m4tIfTdN+yqlVrgR81mqAAnhrMZ2XwiA
         nB9Qj2DCispk0+CE1kr+F4hq+EopcnU6AZv1/DYNDhBmrWX/bJmTLWyIbQAkW2l5QRqw
         +1SM/U+CFIStuGQ6kSYP6q2krHq8gxp9+z/3mpoArXR6w+XuG9yGFYhebhUFH6qsvfNI
         J5YPq4v+6AfwCi54ZZNcnRyJ2fr7cFbbAs4ELP7eBvLprkCIPbJV6vf+wN5LnTn6DcOk
         RGzA==
X-Forwarded-Encrypted: i=1; AKwUvBxAGyULx+7lK9WBoHhaws5xmwgMVfrms/Jl8iQYb59NjTIHxYQOM7WZEFyFb6ADG9GDBAmJ5dQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8DELkCMGpZ/rDdIXqJhOc9RU/g33NHAylKJYe3KwoZVK3XEAjc
	r59g+drOTLIZFwtXxa+xJSjL2UGgX/f8HGZYpb3fjEu/wouBbUhP0faVIR5icqOMKj9Erja342l
	AZjNFxkrSrR+zFltO5vf0XI0VxWuQl95sKy8+x2TpuBA3pk+Ta2f/KzQpAN3+6jStaoHWs2Eqvg
	U=
X-Gm-Gg: AYBFou0NXPImqt790YhSIMKkVGKB9wK+PiYwpoT+/e5l0j3luFwbzQUG3hBlPbuPOaw
	y2x4zAy06optjqn+5pKA3Md7ZWQce4h37qy036eVuF3DVCXUL7DnpgyY/qmNILcrIi+AJBhlMqg
	afG+ENpfTrF0ZGbnKkApug5Bezad2Ht+1gp5PaZpa5ahpRwR5xOZ63zHkhlf1mrVWzOZ1cc+wpE
	FkZGsxsEeLPHiOP+Q38ZcbRtrELpbxKwktnsdM0MuymLUng9/z4+crIuPlkpKBpeMhgKs8LD0Bg
	zeQYfRx+KYWlPAl+gIUQdgTjQV0xmB/Gy9w5lv1zMDHyPHc8SWkftTFWzJ1Hb4AI6bPO8ZDbAp8
	as0jBZTOgCnk1BbI9d1FvyWSSLiwQXJkoPLSZf6Y3F4/UDu8ga8GFQz75Kj4gm+uu86S6ynMWhf
	uH+5mWMeLARTECx48cgBkymcQqOUBH
X-Received: by 2002:a17:90b:17c1:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ae8970e52fmr6645536a91.10.1793601531171;
        Sun, 01 Nov 2026 22:38:51 -0800 (PST)
X-Received: by 2002:a17:90b:17c1:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ae8970e52fmr6645519a91.10.1793601530423;
        Sun, 01 Nov 2026 22:38:50 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:50 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:11 +0800
Subject: [PATCH ath-next v4 02/11] wifi: ath12k: skip hw link id match for
 devices without hw link id support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-2-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: zeUHSJ-M8yZ35sZpxlzUdAtT8nVg_J20
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae82ffc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LRBYoqMme8RW9p2yMIgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zeUHSJ-M8yZ35sZpxlzUdAtT8nVg_J20
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXwcSww/RAdMVd
 NQ2pKSF9dcEw7s1zsKoQHg/uTfpW1oyTHkCM3bbYRig50q7HFmNFKevo0lt8j4edOwPCSwXOZrU
 e5RHqhIW1GQpOg9wETZH6ao1ycNz5Os=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX33h3dmQboWj8
 2odP+CwQNxzONzlmhQsOwcV2yRr8b73S7CL24orjMMElEYBuT8VhjX3J2fJJ+pCklOMZ8+lyxZG
 KuxB8L6iuWYXi1UtJyzMZ9VenwmNwrvIwjcmoC0CtgaYsREYkLoZ+N5FkMLe78aTSf0oIxpxa0o
 hYD62QLd60ZKfyqHqgUozrNfKzNHOmA2mp3q2DxFokf36LegIuYsa+xVXs+OovOzdzE+4lE8WxV
 2ljyWqEBJODa1Xtm6wxegYpUxDPMcRGgw2hrLsGo5/2er79QF4zih2EZPICV47x78ESdmtfMPN5
 hEShtlCN+bZzyEp8lvhhF07rt1EYQ4BedeoRyOytNu8YQbd+8U38CFThZS8hIkzfGUx7ezXPVCc
 AsvUtbtS326+ocKTwef1sjrHv4EFngp9ijyDpLWIwpDXySCR9PPr5acfRr7JTFprsjd03QmaIuW
 vDP5R+QuAdNWDmFhJAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223854_015680_7F21C804 
X-CRM114-Status: GOOD (  21.71  )
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

ath12k_dp_link_peer_assign()/unassign() maintain an address-keyed
rhashtable of link peers. To handle the split PHY and roaming scenario,
where two pdevs share the same rhashtable and an address may still be
present under a different hw link, both functions compare the stored
hw_link_id against the one being assigned to decide whether the existing
entry belongs to this link before adding or removing it.

hw_link_id is only used by QCN9274, IPQ5332 and IPQ5424; WCN7850 and
QCC2072 do not use it and rely on the logical link id instead. Also such
devices are single pdev and never hit the split PHY/roaming case, so the
disambiguation is unnecessary; keeping it would also break the logical
link id support added in subsequent patches.

Add a support_hw_link_id hardware parameter and, for devices that do not
support hw_link_id, add or remove the rhashtable entry directly. Devices
supporting hw_link_id are not affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c  | 48 +++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 12 ++++++++
 3 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 06f6eccfb574..8dcb07773bd1 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -558,25 +558,29 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
-	/*
-	 * In case of Split PHY and roaming scenario, pdev idx
-	 * might differ but both the pdev will share same rhash
-	 * table. In that case update the rhash table if link_peer is
-	 * already present
-	 */
-	temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-	if (temp_peer && temp_peer->hw_link_id != hw_link_id)
-		ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
-
-	ret = ath12k_dp_link_peer_rhash_add(dp, peer);
-	if (ret) {
+	if (dp->hw_params->support_hw_link_id) {
 		/*
-		 * If new entry addition failed, add back old entry
-		 * If old entry addition also fails, then nothing
-		 * can be done, simply proceed
+		 * In case of Split PHY and roaming scenario, pdev idx
+		 * might differ but both the pdev will share same rhash
+		 * table. In that case update the rhash table if link_peer is
+		 * already present
 		 */
-		if (temp_peer)
-			ath12k_dp_link_peer_rhash_add(dp, temp_peer);
+		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
+		if (temp_peer && temp_peer->hw_link_id != hw_link_id)
+			ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
+
+		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
+		if (ret) {
+			/*
+			 * If new entry addition failed, add back old entry
+			 * If old entry addition also fails, then nothing
+			 * can be done, simply proceed
+			 */
+			if (temp_peer)
+				ath12k_dp_link_peer_rhash_add(dp, temp_peer);
+		}
+	} else {
+		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
 	}
 
 	spin_unlock_bh(&dp->dp_lock);
@@ -622,10 +626,14 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 
 	spin_unlock_bh(&dp_hw->peer_lock);
 
-	/* To handle roaming and split phy scenario */
-	temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-	if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+	if (dp->hw_params->support_hw_link_id) {
+		/* To handle roaming and split phy scenario */
+		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
+		if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+			ath12k_dp_link_peer_rhash_delete(dp, peer);
+	} else {
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
+	}
 
 	spin_unlock_bh(&dp->dp_lock);
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 52558dd126a0..b5fa8e224ca5 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -240,6 +240,8 @@ struct ath12k_hw_params {
 
 	bool host_alloc_ml_id;
 	bool advertise_iface_mac_pool;
+
+	bool support_hw_link_id;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index d3ae9e987fa9..b073282e5525 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -448,6 +448,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -544,6 +546,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+
+		.support_hw_link_id = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -636,6 +640,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -722,6 +728,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+
+		.support_hw_link_id = true,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -819,6 +827,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+
+		.support_hw_link_id = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -908,6 +918,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+
+		.support_hw_link_id = true,
 	},
 };
 

-- 
2.25.1


