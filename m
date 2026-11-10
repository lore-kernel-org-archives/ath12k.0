Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C42606A32A
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pcu9DjrJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qxfa8Oxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bv/PlceK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=; b=Pcu9DjrJn2wPvY
	Ibsp4Q+Ksj96lzAxMfrOlogzIPsI4LiyLbYMxaqab7FMHsiMIACV+jkjHNH78yTQKLeGjv5yFA0Lr
	m/z1fJA7XjMjq8jtJ0CDIJ6FlDszdpLSTn16zemuhBVgHo25g6Fw/i7cwW28Rb2+C8p46I/GrIkEY
	XO+EHiDXqGIXh448a2Px14Yq+2iGHiXNj60eiMZoiWCuGPg7NFNyTgQATyGkgagDR61b2enDl7PoW
	pG14lAd97lKwrKCKX5cWA/1TjnwGEZ15e9xj8GPZaPluG9Z7gg3r+eLMV3oDcbdtGB2kOgeGyrEOK
	30eDJUflq1JWmv4DKMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXO-00000002g0X-36U2;
	Tue, 10 Nov 2026 06:40:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfXK-00000002ftr-3QgE
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AE6G2275648
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=; b=Qxfa8OxofHeQDslE
	3XeKPseV44m7MfGFV3cDLdqrN/+ghy5/DYyJFhTyjPPM3vez4tndiOoKznU300tw
	99iYVPZVKunAPdz74RwB9ZqhehgtY9qrXqj+EZOZAAi7Qefy6bZXCyLK9mNHZISQ
	CqwjtLsfQzUboxwkF/Hewu3XA4ZvMXn2WURwFO6cmm+ooJsEpHBsdE18Lka183PQ
	gkBp6ciWhZKPHWr3IlRkNKRkwVBnDlnbgwR+H5SWQ5M7DXPlOhDN961lofOwg+zW
	sc+rz3WNgAiYrmURJzFcQ43r/ohCPVQQIMCDsOIbAg4AmKU/2pYvkq/E4HCXY9qw
	tOh7gQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bx1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso1745712a91.3
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292853; x=1794897653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=;
        b=Bv/PlceKLDvvr62clSnVJhBrX1vbt0Iy5AQvoerRMt/UmNu6AOy1idruhtDLyGgdHv
         YDYrT0VtxhPDPLycfMUkkdtZM2j6F3Cfzg78cPid+XGGyda+Se3SQmRkz+wE2uBEHRD9
         iFyfhQjWVWQNI3wfW/aOIpeX0TtQgCKSEkSjgT7JFXijxFk8HtXp61Y3/SiNwZ+aspQA
         FiqymaCm6Ou9BnM5JZdMHBc3OMnINgLxyx7rVJMelU5VmVYG6VIDX6qdPaG9C52n8xQJ
         Y2odGnyeZnXPYCNcCb1EGXa6P3VzqEZhnEZx3my9qj898x0p0rCix2Djr+FJQGa4hgAz
         rkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292853; x=1794897653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxUA0jiOrrajzjIl2xiojp8MfzoKgo0ptxnrF/0y0j8=;
        b=wvYZB6+29PU3IRtnAH5OxFvy3LIlv3G9X+lOnHDLtLzUEPWa3ozAuCMgkvVEdwo+F4
         RMDNPRRLQdyP0y2Mx/+Pw9rzlS+RMsJyg92ERu1WfDHzBUUrFa/53nV8bJ/916qIS+Zh
         cpoKL9Ql+Cgyd1zHBqvm+7Kb/+i/TV+k8WdB6a0PONaV7BMBigSFQGJWfggaY9fV2AYv
         uFa+AxoWpIr3hjt8sFjlmfCCXgaW//gQ2s3/oyJs4Dxz+ZdYGSlaLTsKTbfGDhw11l78
         ubR9HyF30QHubucUQnyBVetISEv2XnDwuQXMTpGYUFHTVz7eaNirraH+WKsKSmFwv19k
         Yj2g==
X-Forwarded-Encrypted: i=1; AL+hErFx216Y2pzi+1MxzTVfgUs9pJkArmce/jGzsQM+0icgSbeqRMGfr1DuetYVZhmnjK/LS6Td/MY=@lists.infradead.org
X-Gm-Message-State: APuU4Z88zXNYv9tWkQG3dimoVcq4rjD4Z/y7+B/CR78AYZqqMklhyGvl
	4IL5iG5Mi5w10NVqK1HMuCPUInhsOua3i1VH9RUZjlNUwjWOAlthW4+kIqf+J8SctnUcCCMDp8S
	KMbGHY4L8PsakdHrhrPJXSMeSb4+uW/CE1TgdoH4pPHwPUeN2PpTmRZkSuInFgz57
X-Gm-Gg: AYBFou0nqmi93DcSheT+JG+mW3ZTPd9aSzH7bAOvXL9HUpJPIFTYeCqv/7ltfW3RTuB
	kJGt+BRa4zzqGqHb/Jt6fzxp/ZHQPmIsmUR7e7yxwXgRY8exPUnyBEbJTtVqgCH16fVBXDCGf6q
	HZIIaHQy6aYW0yEYUxzKwsD5PDehFA0F5vwicQ3ptFRnx5E00FLSRAYqdr+24A/Ko/9gOL7W4ta
	xeoLmmAr45+YEm4p+tOKvDQDa9C7wI6iQj0c40s6A7g5lMC46lDwNUaraHfATd6xi8dPU9GASwf
	56u+C9OZEUmme1rWbjOgTSZPKdJeGXwemejQ2Aymj555m5p3ZqqMU3ng1bwShbtkLEgouDGxAsX
	VnWaG+d1rtR8m2KpFyAI3pe/PLLZUabsIbOMmiR0oTTOBpNddQuWpqJDe4QVHOXP8+j9/WElYkx
	9gqW3yJh5ekQZnb7jriJgVLClMZPBeoA==
X-Received: by 2002:a17:90b:3b4a:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b166f69f40mr1967968a91.13.1794292852679;
        Mon, 09 Nov 2026 22:40:52 -0800 (PST)
X-Received: by 2002:a17:90b:3b4a:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b166f69f40mr1967955a91.13.1794292852053;
        Mon, 09 Nov 2026 22:40:52 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:51 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:40:29 +0800
Subject: [PATCH ath-next v5 08/11] wifi: ath12k: allocate logical link id
 on host when firmware does not report it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-ath12k-logical-link-id-v5-8-26a3ed38db09@oss.qualcomm.com>
References: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
In-Reply-To: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: thg-nt8MEiBWg9oHWNp87du_JZUlBfeU
X-Proofpoint-GUID: thg-nt8MEiBWg9oHWNp87du_JZUlBfeU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXwKrgArZ08Y0+
 hHly3XCvw2aZMcDqlG6+b8OyINpfB/JnDcaIyc7N6uxMWttvlD9ySiToFkw7ziR4Ipt9/rjIfSf
 VLstpZlvYVlzT9c2IQTXmbgiyfkkns0=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bc75 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2FDiJZU-w7-vk6pY0YkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX7o+w8dPyGymQ
 ccB950TCZNU2Q0Ef6pey1wjya56hnuPLuC4L7+CFrxTRmGTmRQng7zf9kggltcfyBlwGyEWyawB
 34E2wcwShK7Nswxaj1AD8hPtIY3Gqbho8g+n8CfCltqKb93vAcjkx0dSMGfgTwaZybXR/1V8J3t
 jUNHm7GipI7no2QvfLbLriC2vWfutR6NbzJjoVCuch8NOtkZV6sYptDx/rOScJbSNN9Xdv9jCMO
 JGZtTQlrJ96RWXAivahYORNrDq+qMfK25GiGl7z5krrq8Gx5LGmQ5W+ahZl6t8QzKOtxPmERlgT
 lce/BZl8ffcZ0RUBhI/7xo6AkYL3GXTycZgQRHMMIHyNivCfRVAD7oqXbd18+pmneybxWgrKs3+
 h4mcAbJk6JznV3qqx/Ll/LCUq6gD+/QSYdphuOnqtIMA+aBNriv3OVGotJiRe7eJhoHew12MoJi
 3SRBcWSBK8IxScuD55A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224055_016412_27443A3D 
X-CRM114-Status: GOOD (  24.34  )
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

For devices that do not support hw_link_id (WCN7850/QCC2072), the driver
link id used to index ath12k_dp_peer::link_id_map is the logical link id.
When the firmware advertises WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT it
reports this id in the PEER_EXTENDED HTT event, and the host waits for
that event to fill link_id_map.

However some old firmwares don't advertise it, and no such event is sent.
In that case allocate the logical link id on the host, mirroring the
firmware scheme: pick the lowest free slot from a per peer bitmap
(ath12k_dp_peer::free_slot_map) at peer assoc, after the peer assoc
command has been sent. This matches the firmware, which allocates the id
while handling the peer assoc command.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_cmn.h  |  3 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c | 50 ++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/dp_peer.h |  8 +++++
 drivers/net/wireless/ath/ath12k/mac.c     | 52 ++++++++++++++++++++++++++-----
 4 files changed, 105 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_cmn.h b/drivers/net/wireless/ath/ath12k/dp_cmn.h
index e17f044ff812..88abe90767eb 100644
--- a/drivers/net/wireless/ath/ath12k/dp_cmn.h
+++ b/drivers/net/wireless/ath/ath12k/dp_cmn.h
@@ -9,6 +9,7 @@
 #include "cmn_defs.h"
 
 struct ath12k_hw_group;
+struct ath12k_dp_link_peer;
 
 /*
  * ML Peer IDs start from 8192, assuming max SLO clients count 1536,
@@ -97,6 +98,8 @@ void ath12k_dp_cmn_hw_group_assign(struct ath12k_dp *dp,
 int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 			       u8 vdev_id, struct ieee80211_sta *sta, u8 *addr,
 			       u8 link_id, u32 hw_link_id);
+int ath12k_dp_peer_alloc_logical_link_id(struct ath12k_dp *dp,
+					 struct ath12k_dp_link_peer *peer);
 void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 				  u8 vdev_id, u8 *addr, u32 hw_link_id);
 void
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 2e2672a082a9..5acdfd18806e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -513,6 +513,8 @@ int ath12k_dp_peer_create(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	dp_peer->sec_type = HAL_ENCRYPT_TYPE_OPEN;
 	dp_peer->sec_type_grp = HAL_ENCRYPT_TYPE_OPEN;
 
+	dp_peer->free_slot_map = U16_MAX;
+
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	list_add(&dp_peer->list, &dp_hw->dp_peers_list);
@@ -561,6 +563,49 @@ void ath12k_dp_peer_delete(struct ath12k_dp_hw *dp_hw, u8 *addr,
 	kfree(dp_peer);
 }
 
+int ath12k_dp_peer_alloc_logical_link_id(struct ath12k_dp *dp,
+					 struct ath12k_dp_link_peer *peer)
+{
+	struct ath12k_dp_peer *dp_peer = peer->dp_peer;
+	u8 slot;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (dp->hw_params->support_hw_link_id)
+		return 0;
+
+	if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     dp->ab->wmi_ab.svc_map))
+		return 0;
+
+	slot = __ffs(dp_peer->free_slot_map);
+	if (slot >= ARRAY_SIZE(dp_peer->link_id_map))
+		return -ENOSPC;
+
+	dp_peer->free_slot_map &= ~BIT(slot);
+	peer->drv_link_id = slot;
+	dp_peer->link_id_map[slot] = peer->link_id;
+
+	return 0;
+}
+
+static void ath12k_dp_peer_free_logical_link_id(struct ath12k_dp *dp,
+						struct ath12k_dp_link_peer *peer)
+{
+	struct ath12k_dp_peer *dp_peer = peer->dp_peer;
+
+	lockdep_assert_held(&dp->dp_lock);
+
+	if (dp->hw_params->support_hw_link_id)
+		return;
+
+	if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+		     dp->ab->wmi_ab.svc_map))
+		return;
+
+	dp_peer->free_slot_map |= BIT(peer->drv_link_id);
+}
+
 int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 			       u8 vdev_id, struct ieee80211_sta *sta, u8 *addr,
 			       u8 link_id, u32 hw_link_id)
@@ -602,7 +647,8 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 	/*
 	 * Only devices that use hw_link_id can map it to the IEEE80211
 	 * link id here. Devices that do not support hw_link_id fill
-	 * link_id_map later from the PEER_EXTENDED HTT event.
+	 * link_id_map later, either from the PEER_EXTENDED HTT event or
+	 * from the logical link id allocated at peer assoc.
 	 */
 	if (dp->hw_params->support_hw_link_id) {
 		peer->drv_link_id = hw_link_id;
@@ -677,6 +723,8 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	dp_peer = peer->dp_peer;
 	dp_peer->link_id_map[peer->drv_link_id] = 0;
 
+	ath12k_dp_peer_free_logical_link_id(dp, peer);
+
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
 	rcu_assign_pointer(dp_peer->link_peers[peer->link_id], NULL);
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index ea36947d1707..c2d060de88ea 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -145,6 +145,14 @@ struct ath12k_dp_peer {
 	 * WCN7850/QCC2072.
 	 */
 	u8 link_id_map[ATH12K_GROUP_MAX_RADIO];
+	/*
+	 * Tracks which link_id_map slots are free for devices that do not
+	 * support hw_link_id and do not report per-link stats. A set bit
+	 * means the slot is free. Mirrors the firmware logical link id
+	 * allocation: the lowest free slot is assigned at peer assoc and
+	 * released when the link peer is removed.
+	 */
+	u16 free_slot_map;
 
 	u16 sec_type_grp;
 	u16 sec_type;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f32d391bc10e..dbbcf524906e 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3892,14 +3892,52 @@ static int ath12k_mac_peer_assoc(struct ath12k *ar,
 	}
 
 	if (!ar->ab->hw_params->support_hw_link_id &&
-	    test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
-		     ar->ab->wmi_ab.svc_map) &&
 	    peer_arg->ml.enabled &&
-	    peer_arg->is_assoc &&
-	    !wait_for_completion_timeout(&ar->peer_ext_event_done, 1 * HZ)) {
-		ath12k_warn(ar->ab, "failed to get peer extended event for %pM vdev %u\n",
-			    peer_arg->peer_mac, peer_arg->vdev_id);
-		return -ETIMEDOUT;
+	    peer_arg->is_assoc) {
+		const u8 *addr = peer_arg->peer_mac;
+		u32 vdev_id = peer_arg->vdev_id;
+
+		if (test_bit(WMI_TLV_SERVICE_PER_LINK_STATS_SUPPORT,
+			     ar->ab->wmi_ab.svc_map)) {
+			/*
+			 * The firmware reports the logical link id of this peer
+			 * in the PEER_EXTENDED event, which fills link_id_map.
+			 * Wait for it before returning.
+			 */
+			if (!wait_for_completion_timeout(&ar->peer_ext_event_done,
+							 1 * HZ)) {
+				ath12k_warn(ar->ab,
+					    "failed to get peer extended event for %pM vdev %u\n",
+					    addr, vdev_id);
+				return -ETIMEDOUT;
+			}
+		} else {
+			/*
+			 * The firmware does not report the logical link id, so
+			 * allocate it on the host by mirroring the firmware
+			 * scheme: assign the lowest free slot.
+			 */
+			struct ath12k_dp *dp = ath12k_ab_to_dp(ar->ab);
+			struct ath12k_dp_link_peer *peer;
+
+			guard(spinlock_bh)(&dp->dp_lock);
+
+			peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, vdev_id,
+									 addr);
+			if (!peer) {
+				ath12k_warn(ar->ab, "failed to find dp_link_peer with mac %pM vdev %u\n",
+					    addr, vdev_id);
+				return -ENOENT;
+			}
+
+			ret = ath12k_dp_peer_alloc_logical_link_id(dp, peer);
+			if (ret) {
+				ath12k_warn(ar->ab,
+					    "failed to allocate logical link id for %pM: %d\n",
+					    addr, ret);
+				return ret;
+			}
+		}
 	}
 
 	/*

-- 
2.25.1


