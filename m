Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20437606A88E
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3cihEy/a;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoWpdo95;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vh13hq7F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=; b=3cihEy/aqLF786
	+/ABBDNxwBH5oR9THbM1omAz1ht0gvVdEgsn0r8GhaJZ9rWXiQNAwXheYPwa2x06GV5cFjzCVUa9O
	hsuQi41ivu0qFyAQgtoqESi5eL5i3lK+kQkNhXa8dRQSQJT1zmRMNKwIA/qEURVtfFOetJlE2/ANA
	EzPFGOYd+mzp4aondJWZnAUSKn1aMizNpEfPHbyQCnOBbStsLL7oiIt90H5Xsx27+fesd4eEfHMah
	Y/3TSgQ4XMLUetFR0Tzy9DcOFOHv95uPPTENBfsReYoxb++eLgJXb5mFsoxbt7lyXHRfEi9EdKcb8
	QIde/D2u6zxOcHVZy0pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqC-00000007ZD0-3gqm;
	Wed, 18 Nov 2026 02:56:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVq9-00000007ZAl-3Igq
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V6jb2106465
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BdiMUCt/wyu
	L4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=; b=RoWpdo95Z7IszKqYSQC91b+Z6jz
	6HN80L9NirWkjHXDyryR9i9r9wyp+uSW6mbeQCECjQXjJfWfW5K5Rha8dYxXJAb/
	pa84IZvqelZ7Dm4HsAXugu3kdVqwL2UJyi0Icpvu6Np8WGBXy63OnnEZmfpduKf6
	z6Wsq8SR3YYJREyTQE31G/z3Z1v9OKV2k6X3mYtBku9W8R9Pchat9WFhBKc9Tu2Q
	EGzHQ4NsHgwWIkw8x7l0Xyt4mszKYtDmabNLQ2NwcfuncAOQB19nlhONZ+ZSjghX
	kmgKc1gwF6hpfUSKMLqmSIzudX6VmAYKkGhNmnQQDmxQDP6VrZNNVlgDvkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8rtm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso483849a91.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970563; x=1795575363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
        b=Vh13hq7Fy7FZlXLLZhf575mJxHvP6ZZ+hIY2D5Znk6XcIxkqRHXTus3BnH9otIZjpi
         aCo85SKjC6SMjYB6iIRLjLTe84By8OO9JPnU8fK5qTVlB+R5q3lPp/CJqXJ0GdEdd+u3
         QOm9Ja5tKoWK0Qz7q1TFOsIdmAJ9iyPnpwiY8rmO4HCICfhzckdboR2NG/Du6PIQpo4o
         onGD+5siuHQOOX5XW38iS4tuDQrraDF8ZUm8rb7cOQH0C4W9Ng0HJpcC0Q+4WwbHZc25
         jqJdrYtuMchsCUk4quXoZPW4vSoxc61NL+j7F8DSTNeGiODNoeSqG7aGDmFmh8r+Btoz
         tVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970563; x=1795575363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
        b=a9rHEzs/bmcsaiSk0Xua7cPI1A+tnhNJ1osqtmtSR08IPYeBsBnC6QTpGkNR8N2fRP
         zml+20yoqcXyHq2Fso24Sl+HIIj3QADMZgoIEvqWfhFHBmf3iiIdBfH5F/Sb6JJV+MB4
         ZOl0rxKbaetEW/joeWC51Oh7WgG1jxucDID0UibarJKRFJHznGXa8m0znaRldz7t/rwm
         Y1Ikg8fqo+vBJBiBKDFBBN2ICe7bvqzfRlYGej2e4H7MHoyYaQaEgD04G47WN/8gZ9r/
         SHt/4yvq61WowErU1o2WbIi0o0RSVnQyadckruoKxsclBYA243dMZvBIIQ3MM7GgmP4G
         nyYA==
X-Gm-Message-State: APuU4Z8eVh3pA3arght8isUcBIydQ83VylXam7FBMyVU7pTnHJADKhXb
	PFw6We3wM6LJV45AQHMnNqzegs5Jksw8hDLIAGTDjCHCzYSjqD7xI9YOKctc+NYA7BYar1wDfoP
	Jps7QB4Mm3ELB+V0ODytTyqWg+csuG52Gj6Vnv6/lZTSWOitidPl5+DBIAA3SejyP
X-Gm-Gg: AZFdTZeAv6tGzm6bpq57U92R55/N394BQhDWksJq/O199qhyz4E39yZhOAtIUm1XaRS
	aGtphnmrSnHto9HXCQfil/Vn5jcfNCblDs5IT6N9zh51J4BBn4r4vHAzLr/sF5MXkXaOOrMURPH
	e40dVnK79pHlcGyhDnDtw4b+gWzeYDXmBKTJrZYolZt/3p6uoJoCJ1pLnqliiJWsahwNHBUxGhn
	WAnVy6zqBd3rCg8T9pUXYj6Xo5L8XzC90jOtmUIQJytdMRMg51Sd0U6ecFbeMSsN3lv4B1kKafi
	NZ5eEuhdXut78QLx24cx/tkSb6OcCVpcKa4UCpRFKTw+IZFb8WH7Puy2bybcNktnHdHrrX0H/fm
	1Fr03ilT84D44+9Z2QWhk/dxfc4Z3EvSYnQAhBTDHFrQIuVpl0cwriXXTZoMXHHRIpGLWLiqXDh
	D/OPMqlatK5CKmcx5sph0cx2yly5cg8kI=
X-Received: by 2002:a17:90b:53ce:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b3d07e0a3emr1097835a91.59.1794970563236;
        Tue, 17 Nov 2026 18:56:03 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b3d07e0a3emr1097810a91.59.1794970562570;
        Tue, 17 Nov 2026 18:56:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:02 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/7] wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set active
Date: Wed, 18 Nov 2026 10:55:15 +0800
Message-Id: <20261118025520.39269-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: O6J1e0Y0tm36ulixqLOD1DuO-kNVFRKB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX7UmMbiZNdgbk
 stYgY++8NKrk28atsbhL0D+xE5i+NvJrfT9fC9D8TYuKHb4u7S9E3QhEsz1sEVblEDHXw+aiPGz
 mYB2/i+ncSoBia2/0V94PGIj9v/LvFg=
X-Proofpoint-GUID: O6J1e0Y0tm36ulixqLOD1DuO-kNVFRKB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX0DTP4u8pm+L5
 6CL1JCsAAygbfJqDMgW5ExvwCyzPL6falKXCgBuuxnNhoaM+yrFCoi8rViUEwBEXu+mMZ+Y6e2f
 Uz2COJfwTCAG4Gt7WyMUp/ujl7HgFbwih9W9v3+JPlxUmRvhm828miZdHVDQ8KDCPAT0gwEQEkg
 O5que++N3gtdQLK8Pzowr65Pr/Sn4MiwKDKqTlDfObo66G8Wl3ZLxf3JeOtTD5cVHJvQZHwaTB2
 23RV6Q4EUmb9zgtmBoAv5QVTfveiYaTKyGVun39sTn1gAlhC9D28oWiSNf21iTHL1UjmKHGYv9/
 e5Dsynl1b2UA1dYkxSpRJ8V0x2rEcd57hO0FN6gotTM/X34nG8fx67E7Lwy9tw1oDK7yhxAAMWw
 lI1sq8qzByUC2AyeeQEHXTH9Fj6CrvTEz1mi99EsOBhlO4y331jleel2sU4T+43QbEHNvnl+yBN
 sy0BmQGmz1LMosV+L8A==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd13c4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2wyP5r7tFOAPNzKROpoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185605_967492_11177EB8 
X-CRM114-Status: GOOD (  17.71  )
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

When CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP or
CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP is set in ctrl_flags, firmware
replaces the existing force link bitmaps rather than OR-ing the new bitmap
into the accumulated force state. Without these flags, successive commands
accumulate: forcing link A active and then forcing link B active would
leave both links forced simultaneously, making it impossible to clear a
previously forced link. With the overwrite flags, each command atomically
replaces the force bitmap, giving the driver precise control over which
links are active.

Encode the two overwrite flags in WMI_MLO_LINK_SET_ACTIVE_CMDID, and copy
the AP MLD MAC address from the argument into the command. Also fix the
CRTL_F_DYNC_FORCE_LINK_NUM typo.

ath12k_mac_mlo_sta_set_link_active() takes the AP MLD address and sets
both overwrite flags when the mode is FORCE_ACTIVE_INACTIVE. The existing
caller passes NULL and uses INACTIVE_LINK_NUM, so its behavior does not
change.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h |  4 +++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae..3f106ac6141c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7562,6 +7562,7 @@ static bool ath12k_mac_freqs_on_same_mac(struct ath12k_base *ab,
 static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 					      enum wmi_mlo_link_force_reason reason,
 					      enum wmi_mlo_link_force_mode mode,
+					      const u8 *ap_mld_addr,
 					      u8 *mlo_vdev_id_lst,
 					      u8 num_mlo_vdev,
 					      u8 *mlo_inactive_vdev_lst,
@@ -7574,6 +7575,14 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 	param.reason = reason;
 	param.force_mode = mode;
 
+	if (ap_mld_addr)
+		ether_addr_copy(param.force_cmd.ap_mld_mac_addr, ap_mld_addr);
+
+	if (mode == WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE) {
+		param.ctrl_flags.overwrite_force_active_bitmap = true;
+		param.ctrl_flags.overwrite_force_inactive_bitmap = true;
+	}
+
 	for (vdev_idx = 0; vdev_idx < num_mlo_vdev; vdev_idx++) {
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
@@ -7672,6 +7681,7 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
 		mode = WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM;
 		reason = WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT;
 		return ath12k_mac_mlo_sta_set_link_active(ab, reason, mode,
+							  NULL,
 							  mlo_vdev_id_lst, num_mlo_vdev,
 							  NULL, 0);
 	}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index dde7721182af..7e06dbb1e884 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -11832,6 +11832,7 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 						 sizeof(*cmd));
 	cmd->force_mode = cpu_to_le32(arg->force_mode);
 	cmd->reason = cpu_to_le32(arg->reason);
+	ether_addr_copy(cmd->ap_mld_mac_addr.addr, arg->force_cmd.ap_mld_mac_addr);
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
 		   "mode %d reason %d num_link_num_param %d num_vdev_bitmap %d inactive %d num_disallow_mode_comb %d",
 		   arg->force_mode, arg->reason, num_link_num_param,
@@ -11844,10 +11845,16 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 					 sizeof(*link_num_param) * num_link_num_param);
 	buf_ptr += TLV_HDR_SIZE;
 
+	cmd->ctrl_flags =
+		le32_encode_bits(arg->ctrl_flags.overwrite_force_active_bitmap ? 1 : 0,
+				 CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP) |
+		le32_encode_bits(arg->ctrl_flags.overwrite_force_inactive_bitmap ? 1 : 0,
+				 CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP);
+
 	if (num_link_num_param) {
-		cmd->ctrl_flags =
+		cmd->ctrl_flags |=
 			le32_encode_bits(arg->ctrl_flags.dync_force_link_num ? 1 : 0,
-					 CRTL_F_DYNC_FORCE_LINK_NUM);
+					 CTRL_F_DYNC_FORCE_LINK_NUM);
 
 		link_num_param = buf_ptr;
 		for (i = 0; i < num_link_num_param; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 68dd13cafe51..6d590b30ecbe 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -6385,7 +6385,9 @@ struct wmi_vdev_set_tpc_power_cmd {
 	 */
 } __packed;
 
-#define CRTL_F_DYNC_FORCE_LINK_NUM GENMASK(3, 2)
+#define CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP   BIT(0)
+#define CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP BIT(1)
+#define CTRL_F_DYNC_FORCE_LINK_NUM             GENMASK(3, 2)
 
 struct wmi_mlo_link_set_active_cmd {
 	__le32 tlv_header;
-- 
2.34.1


