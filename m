Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06C606A69F
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rcVs9KJ1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMz1m3JB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fGsngun1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qwv5F15K0gQkiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=; b=rcVs9KJ1vhA1da
	cLCVtVerXOG3NUEmzIuIf7cxe5FQhyM8G2JfU8CjikA7A41oTXs8lpfY9nmo/xbXlXQiGsqg9RiH+
	x7dyqavsHAZplUczWFis/onoUFFcgqCSEPG6FB6MNCWLha7+CkQsq7YNSy2OKI7nsy13fBVruO2Yk
	mnSG8YpFUZPxUFWinPdFzrCyosiLDvd4MjLgNjTJbJA2rMXB3rYMP8bAThXyV0gbvUOV14oN98pt6
	+8RRWcxgHbGMU5Nz7jQgP4tYVNjkDGkKr0QpvHBJ3hzxASlhziXw/6+dtNZPFC6Fp7DHvCse3JOcb
	Ear95KbYDVpcNwvqt2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf7-0000000CX2L-452j;
	Thu, 26 Nov 2026 09:21:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVez-0000000CWxH-41UU
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:21:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7j3qC132093
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qwv5F15K0gQ
	kiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=; b=gMz1m3JB/m6cP/aEcPh9DWWnjwH
	zKeRMyin8zQqvqGFPNZoicakOZ9ZKii/LeoqVp7sv9lmJbv3gIwSHRXpaJqPLRIV
	0HGKaN9pjfJRemjr+hur4u+vYzjzJA2h/yJviwiZOZtm4Vfj9VIQV0ql8+pUA2MH
	cvnOufV4IZcQHqif5ob4YmUEJk79xtZ6T4tc+dlBTIoKfCB2GiL7drb7V36xY2c8
	LDZj8fosYJrmop2CPgXwJLt8DtP6nPlNB0W6GWcQlGBjSrGLlEW5XzH82XnWwFqr
	r4pEVwt35pG4OelrC1eE1h+Z1nDfhN4k+57/xIMnjO5gmxnYI9TZQisVdjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0bt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a08903566dso5289046b3a.0
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684856; x=1796289656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwv5F15K0gQkiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=;
        b=fGsngun1blb3aQbZiXm4V1Qn3HnpR0FeSiOrxpGDdw2cJgCF1iEHGlO3UCfHb2St9i
         pKYifu6kvVX/GUj+DbUc0s5drUqikTMF9TxuuungG9VlSy96WV5ec/NvXpL9DkNmnDWX
         5lItZ9Od1t4dnMBTpcXMy+g9JeseyMMX/ynhUhtBK/jUqNVE3U+m0bBzNSMVpGilzeu0
         rPWqxllcFB7VpoAN/PNiO7Tq7JRL3p60Wq3tlGqtjdl6yRaKpsZdCB9UqDee1V6uCJxw
         bj90qtE5G81XkJargUULOuMiFYRt8t1ehn70zTSUnoCA8c80cd9tGQ6BOMDUf03gX8wr
         HQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684856; x=1796289656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwv5F15K0gQkiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=;
        b=HM13Gr30eHUbW0eKyWulcqFw/lswmdFvSWnLL+rCqAsgOUdlQOfm1ZetozoCcu1nzP
         /DQxmJ2L15HKSZvMvXFgbdFSpkQHuS7ZIZ9/Kp1DuxXnMuGlsXxW70ziqKPBt09eRqDw
         eo890fj/3n+nLoSYi2vcROXDv+s+Vx8Gcrwd776eaUKofUukQMt+Q7NVb4i+vaoYte80
         P9bMjL/IOcyONPhQHK8nI/gdbdzptUYiZYQbqoiFmtQPr8uukSM/XyIBFsI3rxsTh083
         MJcdoF2sQQXFrMSp7jKBbgX9K/XOuaw2kFRYp6+lLNZOMx3L9QT0I7/cnYFNvNe6TjJ7
         RW0g==
X-Gm-Message-State: APuU4Z/w3us92WLcZskCf32KVVrKG3xoyGwwWCa6VyNRW+w4swr5SzFM
	ow57divkIqQMKOv12a2wBT4R3qcCJ0Ubhqko5ybLo80P7lSmg724LfZjpCYiPYjk+jd0xZuGwnD
	dgx1DZLx5C8H2PKpzrvivJ12GN9bA815pSj7lPxZ0SxE1BMz7jqAkW/J3gs4GCVq6
X-Gm-Gg: AZFdTZf16K5KgZ3LmtB+DB4fUSC8ZT0AY3ajzi7O1t5pFoej9yyglY8Ez9BxBNsOI6B
	iMQOFEwgDL3s2k6wJJ7hpCex6HJnOMDl2tQ9u5aDbYLwYdzL7GXW/nv+igsNwJJZe7d8TXU0vpx
	0V1JMmVp/3M24AW/nD/UhAML/Vmt8Qb3cbwWHiQWlu1knJV+0AS0NWbAbHcV/Zf73MLvIJofMu1
	gw9GNRL+abFoVk0P6/1ZzB/+w1Rq2+ew70te+pcx3h3FJX1IFfyqHw0RndWggqR5jtiNFHUy56c
	SqQ+n/nUb9BRDUN5PEao2aQuFf5HwYi4HfU/WrmpNzTVBb6KqvM8JZldPNmN+qrueMWHg9z3BFG
	J+8jqA0DUDftkw2xuBkeQFd04ba1cxdeSyXfIRJVpk2URWCQt5IUfWSC7G+h8eSoF8dnXkvGj2C
	qNRo32xVxUEOP79O31KSn6XNVK/rhkpoM=
X-Received: by 2002:a05:6372:a713:b0:3e2:3392:53f4 with SMTP id adf61e73a8af0-4014d456ca2mr13153516637.18.1795684855615;
        Thu, 26 Nov 2026 01:20:55 -0800 (PST)
X-Received: by 2002:a05:6372:a713:b0:3e2:3392:53f4 with SMTP id adf61e73a8af0-4014d456ca2mr13153503637.18.1795684855128;
        Thu, 26 Nov 2026 01:20:55 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:54 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/7] wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set active
Date: Thu, 26 Nov 2026 17:20:32 +0800
Message-Id: <20261126092037.462830-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b07f9f8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=2wyP5r7tFOAPNzKROpoA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX7mopuz8Y88wz
 zXA5OQWfjfpUa34FuZJl3Zps5M36jn5uisGg9hM6Wxt6bcgd3CiakIjLkuw4aStZQrUX+5BP8PB
 JkSKi9eTpCAbTfni+UXqQ1nD99tAq4WdzpnsDZyQwfnPTE+7EP1V+IFORjHjjfbhTG/nTMGvZZJ
 NnZZ+l3r6omwuEXu7okSloCJAOLNXswAA3QwaHTq5v+xMpauTX8dtt0b7b952J6snhYn30f2Lme
 PtlMnUovCyTsRc24vBQZ8v1JDx8V+ZKy8Pii9Wkzw+WvmHg2lwNObnqk+qkMXGQjAQb5f9R3uXn
 im1LOLYQgMcx4nUiQVvEg5eFE6DU5B9mnR5bObyxh9oYFg5dLlH8oSH0VgnZ+SjF53PpXCbX8Z+
 aQBzfjCqBAGKibldgnLo8EeArUEoTtZ22Yhc6B5z5M9B1clOEvJDBH2G8DPUZE7tsOy0DbdyCHx
 izYmIs3M+BeFi8JdvVQ==
X-Proofpoint-GUID: _j_FS5I2NSQuoE9hlnZtdpuI3_QRWjYG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNSBTYWx0ZWRfX/RfQC8IFwu2d
 /0t4u+IDz/97E68gYy6qPhMS8LN7gRuUZBG8o4A4jvygB1PdYw1m9WFtVz/UXUr9c0lU+JYJ/Pp
 sq8Ye3gTcCHA1zcU/wBUosdP6T2CN+s=
X-Proofpoint-ORIG-GUID: _j_FS5I2NSQuoE9hlnZtdpuI3_QRWjYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012058_113505_3096ED79 
X-CRM114-Status: GOOD (  17.04  )
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
index a247dcf387de..cecd634c5f7f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7573,6 +7573,7 @@ static bool ath12k_mac_freqs_on_same_mac(struct ath12k_base *ab,
 static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 					      enum wmi_mlo_link_force_reason reason,
 					      enum wmi_mlo_link_force_mode mode,
+					      const u8 *ap_mld_addr,
 					      u8 *mlo_vdev_id_lst,
 					      u8 num_mlo_vdev,
 					      u8 *mlo_inactive_vdev_lst,
@@ -7585,6 +7586,14 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
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
@@ -7683,6 +7692,7 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
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


