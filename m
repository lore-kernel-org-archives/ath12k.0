Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6668606A333
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3QDbYji;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnUpZZNI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZ11yfH8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=; b=x3QDbYji3rGZh82ThHSOplBoe7
	Gdfsj3+jTUCDpz+6EFBCmMcdoCDMjh2p6p7nVbziN+FQqTJnRtUNvN84YSXgbabtb+r0ryPFAjxxw
	WgQFxHTJSF6oT2KDIS79EAys9MZoJuRO86u/ArmRRhh8FPf9PGM1KfcnkkbiZX+Fnd364cMlDSlXV
	mn1VJCrrRp70T4eZ5FOyE0yg3y624diCs5vtYJJYmviCctUcphj0JEs+EJ1mHuH5x+KNSAEadgVpt
	akC3J58Ii6qinZIsCUBcKRTOaWNalpxVgN6gq/v7z+mUNjU9WqpGP2z0rN97uWW56G2Al3GdqwK/p
	zZ4JM5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVq6-00000007Z8w-2b5x;
	Wed, 18 Nov 2026 02:56:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVq4-00000007Z7s-0q1E
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uqpq3371306
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBw
	c9cQbRWA=; b=gnUpZZNIsdUC13YA4pt34bt0BVyTZC5Q3gRtl1AoIbzlGG1qXF+
	aTmcM0nu5OAA2KERuC5hr5Bda/sSNVeNNyNcCYMJf1GN57uahMkPW652kL6JEiSB
	Af2PXhPxroCgzPEav55rz5MPw76fLebcKhgrcmgT7G1K8IweaMedDmOKTHYufQsC
	NZ0xR6R2CKlxo3nETRt5BMED0cW0Aoy1m/8hf4OjCkE8EfcOREAaYNR8EaKQau0y
	Fx/KgXZwZtJStgFD6QKbsfBLIqQtr/VEso3PiN0zKF9xjyYIAgOKy4agcYtOLiQP
	yjIXSkJRxKur69I8lqU/Kh48c4IToV7USSg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8rty1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:55:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08be1c84so6747405ad.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970558; x=1795575358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
        b=aZ11yfH80OuQgCXYTRZ3ht51zyEQ5BSFQDheeAKKVGvKZrSJoJvVEh4cil+WHtxLyT
         qrphd5DklnrsSjcSpADWk7NU9muwOGzznmMFy+dpWi0OF5xeToLl+LlJg+hm8AgZS4eG
         P+ttkACtFfrpNEodmr3cLW0DCIi3K6Qb0PMJ2AuIgoLHHR8+r6D6mv6Tig+bTz4tZWzt
         YQUgk0wSz/X2qFgPeSnEN+4uXoTPNyLhTu401MeX2siMvKVi6QonUTWsToq9SCcX0KDV
         S5GGfhxOcmmxefqru2sstBTaQQWumQyK+vKWZ1z4dUiaC6GIoXfCMY57Gs65OY1N+2M6
         bVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970558; x=1795575358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
        b=fkVZjdbUZ6LgyHM4nG3wvAM8CqQOiQc1Geh1DxuLnERUkkgrK471D+z2dccWwG7Ip6
         cK9ER4PQOPPI/cxZJ3zsOaIro+UY3PERwm3no3qLHfxk6G5R7PBoexjjmYO2am7Lc145
         ZkdqLLQ85KfdCHfl6vq0+HoFCNHcUGWSpwZNaaChMY7UpUvUUsncLpkMhrf486HwkKM6
         Kd9XiA4y1iYpby1tw4rok4U0XstPzv1AYMr/9lUOzGjxzdhhn1WrfXMd8C/KaGktjwDE
         jYGCg4duau0fTYDAueG12Ofc/wI0gkIymReR69zClpK6CXNnnhsrynjRB9It+BqJeCg5
         qyOQ==
X-Gm-Message-State: APuU4Z/gcy+E7GcS9hgu1MmKyxAyWxrWt5hn3oJb001PLNiPRL1DbbaC
	Ox382HehaP5N4AbS2augF3vxf7N0j3HhYF8AAErrKIrEiI7U6yh+GNsiiAE7qYAiiPnrC2ONjYF
	M1E7VOdXJf18MxVHsCA2gl0Ld3e+wO02W/QIK6hnGbwJEt8HiBCcYHGX6l/J5v88N
X-Gm-Gg: AZFdTZeMBQM5FpfPlICDDA1bdIS95CGT3cIrBvDpSEtjCviZrLk42Q+VraqXw9oX08l
	B7BuuSwjQzGV7ftNHMbPYmCSVBmWN2p3XM4aLumeQCrruAIFY8/7rHUBEQR/X4eQUT7ey6qKoVJ
	4ejFqx4gapTZ5yovLFzf1k6KvGHcEDcnFQcvx2g4/Ha+HObGqDThr98BrZRgZZAx6yVYGBOy79O
	Hr8U7kljHep7UTEsrHlos9IQh0G9kGheZ66GRuBoNF4kfhJbnl3UYq1zHBX+yhvWFTVgWT6/9yb
	WpzmlpW3v06lx2MayFf4vKp+4OPUSL0h1WGxl7bgeVraa+crrByGydXGGNJh10MVlLgsws64TO5
	2kgt5XFpbFb7pAlRnvDxbQ+qGPSCYKixjMF1YZ9yyq94R2ljQKk2xFGF7RHwW7mhiFobndsKqXE
	UYOgZnZvpvpocqzve7/cyu1dakag3jdlk=
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr11276675ad.35.1794970558476;
        Tue, 17 Nov 2026 18:55:58 -0800 (PST)
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr11276405ad.35.1794970557932;
        Tue, 17 Nov 2026 18:55:57 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:57 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
Date: Wed, 18 Nov 2026 10:55:13 +0800
Message-Id: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd13bf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6kQku5dBW61KixfneSkA:9
 a=EUlzmMyR4JpyyxVz:21 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: so3ZOvSJ2syCFfEwWmiHkLnNL5p3g0ic
X-Proofpoint-ORIG-GUID: so3ZOvSJ2syCFfEwWmiHkLnNL5p3g0ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfXwGKCQhYLN50J
 f7w8LAKQzkfEFJ3xYTQ0X3xsdkpPL641U4A8RKy1fW2WPRBg/10p62CPJsNUka+utvUfWEts+pm
 eDbZsFAN0JR1LGXfYfoeRGLHcXSE9/k/Zb+u/i1Vw4nSTi1B6K5sTe5cGq2m/ha4GGKlaS971YU
 hbRSZKbZ4GBMTUt2QgI/eQXwRozIRR2uDR3gwogaheK+oOUlgI60YCUrM4qRZ6H5RDh3x3eFml/
 Guy+epemduvGoPzYggit0sVu5613pOONbU5XorNx4J2ktG9FB+cmipdZHK3djK059JlZwFFG0TV
 wt3bZCAKyNPNy2xdBETqMNvVKAE48kiavfil3qsuedHKIYuk+uIJnLzn72YFu78Odvlh3aAZeV3
 /2dsIqUWOLpoayAFBiSbnic4t64Viv6jPzO/ryI/UM3CeZ2cR71N+ugobiEjuTTtqmBbnwmWxje
 2ft0/fvoKZuJ6E07ulw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX/ogXJCpyU+PH
 XGXFvAjpqXz9htMrA+zvqPJrUF7EZBzeOySGKYaqbqyDhPkzFpCBbnqA2ckCNjbmV8Ynox5wtG8
 DjGIbb7EHbYiZub4zkCDwLQS8YK5n2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185600_254168_2388DBA5 
X-CRM114-Status: GOOD (  19.37  )
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
waiting. If a device holds some of the STA's links but none of them is
active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
ath12k_core_pre_reconfigure_recovery() releases the waiter before it
takes the wiphy lock.

Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
from patch 1, the ap_mld_addr argument from patch 2, link vifs that
survive deactivation from patch 3, and a STA link vdev that stays
started across deactivation from patch 5. Patches 1-6 each apply to the
base on their own, and the whole series applies in order.


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
 drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
 5 files changed, 405 insertions(+), 35 deletions(-)


base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
-- 
2.34.1


