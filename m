Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E838606A329
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lPNVVKly;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KCGaAPYP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dn8Wqn86
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoPRrdyLxkQ=; b=lPNVVKlycFxzzzmFw25ZpTK41l
	tLEHlAutCdZkg9RiuLBg+59q6aO4F615trfUNP0Dmv8RSe0qiOMEpUN8KfPlTlL+Pybdj+Mqk7/J3
	q8fTTS5AqMSKxDk25hEV1FQxhQPp2j9iBQZOVAVvBb121rq0T894q+1Ipx9AI52ylCur1HJAYP+1j
	/BFGjYDoZCI8mYkGe2id1js2v9HYBOOw5JtbKSRQJVFusvd8RyaGv3wCYjRUzX4vEnrKc2GAYcYf6
	2Bj47FphdN4DqT8rtTYR6zaW0JyWj8l0maf6KB4zXPIijv7tKfuR0rSwjMuA7DP4VXPXFtTZKmD7w
	1x7Y0McA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVey-0000000CWx3-0mBV;
	Thu, 26 Nov 2026 09:20:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVev-0000000CWvC-0gbC
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:20:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B0Qq695121
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoP
	RrdyLxkQ=; b=KCGaAPYP4YgqNEgY/t0aRjDd/5mbnE+zGUYhDNPDojmXIGjh5PA
	8B61+JJsXwMYQEx45XsTvP0QiLvmHVI9JYMorWieNd0orNn5vI9hvoAf/1/s3fE7
	9z64ieuP2GoYFhhmhrPD82MxzkymFa+ataN/VKZgw2taksuirjgnMy0ZM1EwRG1K
	uGe187d0eZOyK6MnZyHY4NX+UeHlAbgXsjF/XtHZTIBf75LcFXKWGqx2wgOCkjZm
	BqEnS5R8pfDKSE88+P0JC2WBcey5yTQJbUHS1Jyh657kpGcdYWl5o+QfbSOIOBnZ
	TTIh2CFSYSVF/ms7aGa8dP04qEt/4XkoAWA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rjqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:20:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b930598cf0so11809711b3a.1
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684851; x=1796289651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoPRrdyLxkQ=;
        b=Dn8Wqn86D4LmAtwgJhPAHFkI3X7eRoabrZgBBqx5V+tsxPUFhp6niRG9cSZ+o8L+t2
         VX2dzx+Y9SiGF5XOv2FkPOJ6q15rwZvNbF45E4RLwUDnAJQnq/UXE0TL1D120n0an/zh
         6kd2d81Z2mbm/0YOyKnkJ8KiI4Xu6lY0MIvpArrhHUvP7PkGgQ8MQD9vDUCl/6t4YaLc
         DqCmHfl3cg3NgTMtDwyaJ05QQeHcZ6ae74PUHxAN2P7YAaoq/5oOfDCyPq2sADhSUCYo
         nJ9Dq/O+Np79YB/Pa8vqqenVZw5glvH3Ub0ClVcIN00eCyNjPSXEdfoHeTa4fvtf0+ZB
         amYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684851; x=1796289651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2LGf6ehSgWfsR87uApUBQA/84FyMjxjaoPRrdyLxkQ=;
        b=V3sn5nkGO/ckP4zxrxPJj3ewxRUtAd6s8lS6pkb41j4+vrAwMbY8QwqWuT4oe+X6RS
         LSjVkW4s5y4zKyP0MJ36b8Tn9SNyzivwNTzTlUQQZlW32ShgNPhuV+hXp0G9cNgNHJGW
         hiZF2elc/lVqPGWmH5ImsJMi471consqpNtNhpWuEUT6Z1/ATQdttXjbYDjzhiNoC1ZL
         AX9U+k9h50QgCVT6LU54GARI9gimrr8yF3a/VFllWG6oTPOGb/sPwI04PG8G+jDYWwcR
         sqREU4E7Htr1O6gRIWMn7aOk9Y2RQuThdlE2PdlFt8+ko8B04kuZzBJN+KW+yRkbUGOs
         /6CQ==
X-Gm-Message-State: APuU4Z9T3t976pgmx5Q1+eNzi3pgL/vK9/6E5CTbjc1EffbbIRqNlHPR
	AM0HWjTX4gGl6uicWITQU9eIydVMpqiWXMjXhNKPiSG5HMtTR7P5560AmG6V7laqZqC4wOqMNxK
	pweH4UBADjMwqmXS543dJZqVfCo6xgy9HIDbgbhRFPLM/uwKYvsdTE3XAMbzaWmkP
X-Gm-Gg: AZFdTZeR9nQFQOj4ft5iu/G54ALUei+cSVI1xMycH0jVlFL5Fne/isZT0jDkc6ieM8I
	AwSrfoDmBKkPoqo/MdwyoJ9lJlC6KY+MJbph/orIRhHtqp2gt+uS6bC8TBXdpa5CJMiI0C+zgX8
	KXy03wHURPSwRjrF5r4xMh5rsAXpKoevrE3kTaD7xWRD+WCRV2hIpzAgv+/A4RBvgN8Nlt4AYpg
	NuSFRFkUwtb6Z1J46x+2MMhmZXJvcYPrmR7+xe7jMfJ/f3B9QTDsitSnEU15yG0y8+5NInbVVe5
	VDVYm1d+TgyANq3shvmQ1L18zot2ZGyH/beptp7twaqYx/Rmd51YpK+kU0fbvQD4kaC1cUnFOjO
	iWsyitfVrxNElMhdJlBuPA2YKBdds09yX8rc0g+iiLdLiDrF/7ZBbiSIDUCAhRwCtGSsMpx2dm3
	qKrVW9/dJF2XRVLytVaVO8vRuQiTS767c=
X-Received: by 2002:a05:6a00:2d84:b0:893:1336:4809 with SMTP id d2e1a72fcca58-8c87cb48d65mr18707853b3a.47.1795684851012;
        Thu, 26 Nov 2026 01:20:51 -0800 (PST)
X-Received: by 2002:a05:6a00:2d84:b0:893:1336:4809 with SMTP id d2e1a72fcca58-8c87cb48d65mr18707833b3a.47.1795684850492;
        Thu, 26 Nov 2026 01:20:50 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:50 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/7] wifi: ath12k: fix MLO active-links handling
Date: Thu, 26 Nov 2026 17:20:30 +0800
Message-Id: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX2mxQDqgQJv/H
 wYqAFlcTc/Eo3q5X35QXfSohLb4F2YdLKp9U1lC2q6tQQD3pkeswCYQ7cNq66a+kk/QjRTVdA0/
 C2mN4q8jbU8k5g2+dex1kML5XiKXyDI=
X-Proofpoint-GUID: zjT6IcRZz-DfciVvkFBjKhPRqEuw1lzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX3gYQZxkjdInB
 9ZWrMst5ayVJf502QFqDb18+Ns3QM3c7TgaXsEhxFwM3Ds/FKZPZt+RFyZUeJ9w0Z1OxXBCYUhl
 mzzD680zrQbw5ofVcKHOxtSxUndqUdMWDc4lfaREYwiOQpBFIR39T0r4kCWXr7okYpKE3Ka8pcJ
 SsAJQfdyppLEmqOKP9LjBXkVFMdDrK4baPNrPkLAvEhDHMUa0bY3ccmlSeGO2iMWBEo9nvcGSJs
 pVEZG9DA8+J0+K+2+3J7ozgEVINmnXqldG95CawLE8/wmLGycN+GdjHPWR3HBSa7mT6csNSbNKE
 zWq1vaQg7Xr3E8xHuaaQnvPgQsj4MHMzteX+yH7gY1yAJpnTL3BYL6STGesVcWaObeOHB/rfy7Q
 UWE620mDfw/y4JBLqiklZwcOTVMAH/hWbDKy/uciCKK017yVnfYZwD7OgZedXW7NReLY5X/XNTw
 pY+3UfuphY+9y+i63jA==
X-Proofpoint-ORIG-GUID: zjT6IcRZz-DfciVvkFBjKhPRqEuw1lzp
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b07f9f4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=azDT-4wkt-qAIGEF8nUA:9
 a=uT92G05FbF0D0Hrg:21 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012053_636727_5AE4491E 
X-CRM114-Status: GOOD (  20.86  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
both valid-links and active-links changes. ath12k does not distinguish
between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
inconsistent vdev state in the chanctx callbacks, and silent
firmware miss in change_sta_links().

This series derives link object lifetime from vif->valid_links and
sta->valid_links, which mac80211 updates before calling the driver,
instead of from the active-links sets. A STA link vdev keeps running when
its link is deactivated. The active/inactive link state is programmed to
firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
holds vdevs of the STA, and only when it differs from the state last
programmed.

Patch 1 adds WMI infrastructure: the response event struct,
WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
registered in ath12k_wmi_op_rx(). The handler only parses and logs
the event at this point; delivery to the waiter is wired up in patch 7.

Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
firmware replaces the force bitmaps instead of accumulating them. It also
copies the AP MLD address into the command, and fixes the
CRTL_F_DYNC_FORCE_LINK_NUM typo.

Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
follows vif->valid_links. A link that is only deactivated keeps its link
vif, and a disconnect (valid_links == 0) removes all remaining link vifs.

Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
context. A deactivated link keeps its vdev up in firmware but has
released its channel context, so it must not be used to derive the
target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
is kept.

Patch 5 stops clearing is_started for a STA vdev in
unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
keeps matching the firmware state. assign_vif_chanctx() then compares the
new channel with started_chandef: if it is unchanged nothing is done.
Otherwise the vdev is restarted on the new channel, or stopped and started
if it is not up. Station removal clears is_started once the STA vdev has
been stopped, so that a reconnect on targets with vdev_start_delay starts
the vdev again.

Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
The checks now use the constant of the array they guard.

Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
sta->valid_links that are not yet in links_map. Link STA removal is
still left to STA removal, as firmware does not support it. Once the STA
is authorized, a link holding a channel context is active, and a link
with a link STA and link vif but no channel context is inactive. The
result is compared with ahvif->fw_active_links and
ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
when it differs. It is sent to each device that holds vdevs of the STA,
with that device's links, and the driver waits for each device's
response, except in the INACTIVE_LINK_NUM case, which is sent without
waiting. Before anything is sent, all devices are checked. If a device
holds some of the STA's links but none of them is active, firmware
cannot deactivate all links of a device, so the update is skipped
without sending any command to any device, and the cached state is
left unchanged. If the device crashes while a request is pending,
ath12k_core_pre_reconfigure_recovery() releases the waiter before it
takes the wiphy lock.

Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
from patch 1, the ap_mld_addr argument from patch 2, link vifs that
survive deactivation from patch 3, and a STA link vdev that stays
started across deactivation from patch 5. Patches 1-6 each apply to the
base on their own, and the whole series applies in order.

Changes in v2:
 - Patch 7: in ath12k_mac_mlo_sta_sync_active_links(), check all devices
   before sending any command. If a device would be left with no active
   link, skip the whole update, log it, and return 0 instead of failing
   with -EOPNOTSUPP. v1 checked each device while sending, so devices
   handled before the failing one had already been programmed, but the
   cached state was not updated.
 - Patches 1-6: no code changes, rebased onto the latest ath-next.


Miaoqing Pan (7):
  wifi: ath12k: add WMI response handling for MLO link set active
    command
  wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
    active
  wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
    updates
  wifi: ath12k: skip links without channel context in
    ath12k_mac_get_vif_up()
  wifi: ath12k: restart STA link vdev on chanctx assign if channel
    changed
  wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
  wifi: ath12k: handle MLO active link updates

 drivers/net/wireless/ath/ath12k/core.c |  15 ++
 drivers/net/wireless/ath/ath12k/core.h |  25 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 345 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
 5 files changed, 415 insertions(+), 35 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.34.1


