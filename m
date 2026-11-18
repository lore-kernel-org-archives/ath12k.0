Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1125B606A32A
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 06:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkvSPIEh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8YgjroA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRTnyMqP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=; b=FkvSPIEhNveoE65TzqkAGnt6o2
	44x1vktJtL3aYBKXWKuMnwVKa3eLG/tk1h5QPFUEK+JR6QIYPrDQaiVM17SCW7ttTJn/gbXit2MNQ
	QmmCgJ76KjsfkB5/T6jo0Fhh8LDhmymeYUJq/7DYZxYjjREZ28nxVCoXD4fkOHM/8IsMX1WntnqWV
	STZUuBcjgUYOEQrqyPp+EHHlgbnJzU8YHdlY2Qz3m5SRfN3Kymveue0UipfWY7O5q1DjXAUaQKE48
	lOBvjr0D8ALIsQDmUSexuZrYc0foLauSGeFyiAggIKA80lQzh07Aa6uf1zXubhf7/kUK/+LVwwjmL
	6h28PDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ0n-00000007r3P-0uSS;
	Wed, 18 Nov 2026 06:19:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZ0k-00000007r2W-07Vr
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 06:19:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1J52106311
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vDEjMPy7HJmNHTeNxgHAx4
	/MYeBpn0DBUzvTmeTtSkw=; b=R8YgjroAU2fIXptsdPlOB4iffr1NYJ01HYh3R+
	b858zowW7YG86VM/M8qQOSl24QJBAMls/EeUjGrfUPlVrFLP7eUVW48Zr9vFWHZv
	43QhU2wWWvbXAxX06UEe7uFfJ8x52Lpt562MXdG2pR9VG8vQ4nANUSSnfqf1HAEI
	q6dk40evl5ROdDVx3CCNP5zF5dQv05XqUq7uVuSrOfWATh3oas2ivpaeZVHvRwCh
	JINTRqlFEAj3aU5kyw7YClKwfqezoMXl3H0sTznL4SxDZ+ZtDMt5tASDq4QugQOF
	ssC7MWR34gNzmII+OF/J1gKckU2ZiAJ+SDsn0Bo1Cw0Q80/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sg0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 06:19:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1481314a91.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982751; x=1795587551; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
        b=CRTnyMqPRoQuuYs4sdYcVyNJq04Xz28f1ERoN7h2MDP1JEqSwgqZJorJHWyAjaMAFx
         YtKIN9JQxGmQ5rlw0sJ0kL5H3UhKKUQkZetBQq56hbuZDPeiLxyTDiklUHaV7N8jWiz6
         Hv9vQ9lF2MvcJJfnrQnwtUrg9uJTs6GZVV4lcVZgLHp16/F6BsUgepKhXcz1B6xSuuru
         ZER62+lsfHoVYYRapaYtK0WWg7aEsL8FQDo2g0AabjO6CeQIC1G5zP90YPA+blXAbXYZ
         Lfz2EmRaAUYf3uvObVidMynA7oBMOjxpDFTEyQ2LKTbZoMD3JlVW0c0FFKDuoEPi326b
         pbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982751; x=1795587551;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vDEjMPy7HJmNHTeNxgHAx4/MYeBpn0DBUzvTmeTtSkw=;
        b=Aq55rsj0eEsK6B25e8000SDRkFZMtvL3roCMcSWBFRT2MxQdZ1j6F/VKSib/9QtJG3
         I9Rmw3hrtQhq4UUXbT/ZLEUr+w1YsEPFsEBZFBHEgZpYYOSDpVIuUqLRvX2JvTrGNhgv
         18Tz2IE282ARK4DHDKAMMMCpsuvPJJtb0+eBVeiiCH4pS2qrIajsjNMDE3gyCQic4eRp
         Pj1LA8m/H78PB8WrbQ5OjkjvCMleX0SBFqZyVuIvBgcXVSk8x5xmHDWRhNnE5P3dNiAC
         aFGDEzTYr9mUuLa64SmKIOC5KKu4pf7pvDaahgHHpo9xFB+Y5yl3ozX7t0ZlMOvGGeRT
         04lg==
X-Forwarded-Encrypted: i=1; AL+hErHSysRUhV9BtN78AkJKufXDZYNYw6Pt0ARGsj8l3bUJXXPHr7mVhI3KetXbfKt2haKMAUiEJ+Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z8u67XI5qebPqvuJjPOYADI9ru4uvGTVPJ5b68yQUUkn5yYFBNx
	wKeIwzF0WXSFlNSkJc4djq5/DgEjz9dUBumdPdnd4LG1KMfRFrUPOC3XfKQ5QGM9o5mE8pgZ3+Y
	xHs/EaNIhepKcB7V1KmKxg+fzzEGJhOit7o7RTfWu9mxeWi7CvQS6AKkIp5K6qZbc
X-Gm-Gg: AZFdTZcYo8KqAMUNOd2df74kSgbRV4rJX22CidDaVdqDbgLcJuBifwg3Se0rUYehjlt
	BgcoHJqLeQ1YsRDM1lQArSUkhVHkNuecW4bz+TbMttQSZBuOisavSjoItVSliHrQtRJFmSzV7y5
	T8r/QW/epigFHS0IydEWgeJhPKqVaY1oSwAnQX7tluUoqSNvxCu741232rNZOGMu4cqsc+ceK1p
	3yrUOcJ7BySDQXTXdGIQBjQ+0v2vmVHi7rogttP42h0YRSpw9WY59cp9DgrT4cViJbWMIZ72dwD
	AzqK84HTyvZ9NesoRhOosQYk5SSHmnmOgpLIPOcB0gcr/v5nZ27v3ad78ANZj1jxLjpRkHxN3h/
	YE/68GOwDHsDI9xW1vdH9tkJrfvlJL3qy95mAQF0Er0eIcGF/OJwZBPFTI37WtrJPhh/TOSactH
	QJPm6i7czGFj1pythPXkR9v/QUYSKAf+dn9kud+CvVeNOU3tsQCLdswtgyQTUWyyaHjqQjIGClS
	Z4=
X-Received: by 2002:a17:90b:52c6:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b3d063d686mr1274331a91.6.1794982751330;
        Tue, 17 Nov 2026 22:19:11 -0800 (PST)
X-Received: by 2002:a17:90b:52c6:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b3d063d686mr1274305a91.6.1794982750624;
        Tue, 17 Nov 2026 22:19:10 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:10 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 00/15] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Wed, 18 Nov 2026 11:49:03 +0530
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdD/WoC/4VOSw6CMBS8inlrS2gJRVx5D0NIWx/wjLTQAmIId
 xfwAG4mmcx3gYCeMMD1tIDHiQI5uxFxPoFplK2R0WPjIGIhOeeCvamiS9kbm6dZWmpPth47pjK
 JmVQ8kRxhy3YeK5qP3juooWEW5wGKnxJG/UQz7LW7t6EwOP85Lkz8SPxZmziLWVIlcaWN0FrmN
 xdC1I/qZVzbRhtAsa7rF7gXvcfdAAAA
X-Change-ID: 20261112-wifi8_qcn9575_bringup-a76e76a1361e
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: H7w690Rd6WN18YKmNP8MACXbHsQs5XFj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5lkHE/8xsMRc
 woBEhSD/KoPkF2NTekWD//2BBHeJ7J7BoZZ/+Bx0lT9hq2qixV1kG6KWn8aqowM/jUW6weAgZQM
 7TkruTacT7M/n9AazPyxReRFWTLej3g=
X-Proofpoint-GUID: H7w690Rd6WN18YKmNP8MACXbHsQs5XFj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXzKLTHQVsNC5Z
 OT4wEFY1sJK1gvk//Nm0tnX7L27LBCvRkyZgda3NZkq60G1OxaYlu292zyODzy9EhP9pxaFK7P4
 m8VfU81JERBexrq4etIdqF3Pwv0z/nhdNTPl9Sf6xXnKZ8wZwOV5mk+BgHKPHamVp2eIgO5OrYO
 BcHtLbimLNczwa/N5H2fVKYuImyWF45mdhpZH0UeD3j1f+JANH6rfN2EPNmd+o54V49F3Ocbprq
 YTLNDTZhSBPUnm/aUyNGeHQY9dL96WvDdR2xPha4UzDVR4C0B0M5pvBoaSv4XYMttoIQ+xnmPoF
 ihZub/E9wYeM2lMsQyJ9OCxUfVUAHvjzv8okkeeuZGOIl9prszaNiWeRNyPKbk/O2nB7tyYoxTE
 h+bfzGQBHWECGbljvUQ790BqXBQBxoprxlg3VgriWigCfIAIuEQHzPOa6cL9/agRlqx9E/CAJn8
 EsDFCOz0FaGG3FjtX3Q==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd4360 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_221914_194370_F63BF259 
X-CRM114-Status: GOOD (  21.24  )
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

QCN9575 is a Wi-Fi 8 (802.11bn) PCIe target that represents a new
hardware family distinct from the existing Wi-Fi 7 devices (QCN9274,
IPQ5424). It supports 2.4 GHz, 5 GHz, and 6 GHz bands across upto two
radios.

This series adds the initial bring-up scaffolding needed to register
QCN9575 with the ath12k driver. No protocol-level 802.11bn features are
enabled yet; the goal is to establish a functional base with the new
ATH12K_DEVICE_FAMILY_WIFI8 family tag and a dedicated wifi8/ subdirectory
that follow-up series can build on.

Patch 1 moves the PCI window register constants from pci.c into
per-device structures, so Wi-Fi 7 and Wi-Fi 8 can each define
independent window layouts instead of sharing one fixed set of
constants.

Patches 2 and 3 extend the shared QMI layer: a larger WLAN config
message to describe the CE and service pipe count QCN9575 requires,
and support for downloading an extended firmware binary.

Patches 4 through 12 introduce the wifi8/ subdirectory with its own
Makefile, followed by the hardware scaffolding: hw_params, HAL
register table, HAL ops and descriptors, unified firmware image
support, MHI channel/event config, CE and service pipe map, WMI
resource config, and hw ops.

The final two patches integrate QCN9575 into the driver: a mac80211
ops skeleton is added and hooked in, and the series closes with the
Wi-Fi 8 PCI driver scaffolding. QCN9575's device ID is intentionally
left out of the PCI id table in this series, so the module builds and
links cleanly but no physical device can match and probe; the id
table entry lands in the follow-up CP/DP series once the device is
actually functional.

Each patch compiles and links cleanly on its own; where follow-up
patches fill in callbacks, stubs are used to keep the tree
bisect-safe.

This series has been boot-validated on internal firmware version
WLAN.WBO.1.0-01410-QCAHKSWPL_SILICONZ-1 together with the remaining
Wi-Fi 8 enablement patches (CP, DP setup, MAC datapath) that complete
device bring-up; those patches will be posted as a follow-up series.

In addition, each ath12k driver patch contains Tested-on: tags for
existing platforms where it was verified that there are no
regressions.

---
Changes in v2:
- Addressed sashiko's review comments in patch "refactor PCI window selection to per-device layout"
- Link to v1: https://patch.msgid.link/20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com

To: Johannes Berg <johannes@sipsolutions.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: ath12k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
 
---
Madhavan Ganesan (15):
      dt-bindings: net: wireless: add ath12k wifi device QCN9575
      wifi: ath12k: refactor PCI window selection to per-device layout
      wifi: ath12k: add extended QMI WLAN cfg for CE and service pipes
      wifi: ath12k: add QMI support for extended firmware binary download
      wifi: ath12k: add Wi-Fi 8 directory and base module scaffolding
      wifi: ath12k: add initial Wi-Fi 8 hw params and init helper for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL register table and hal init hook for QCN9575
      wifi: ath12k: add Wi-Fi 8 HAL ops and descriptor definitions for QCN9575
      wifi: ath12k: add unified firmware image support for QCN9575
      wifi: ath12k: add Wi-Fi 8 MHI config for QCN9575
      wifi: ath12k: add Wi-Fi 8 CE config and service pipe map for QCN9575
      wifi: ath12k: add Wi-Fi 8 WMI init for QCN9575
      wifi: ath12k: add Wi-Fi 8 hw ops for QCN9575
      wifi: ath12k: add and hook Wi-Fi 8 mac80211 ops skeleton for QCN9575
      wifi: ath12k: add Wi-Fi 8 PCI driver scaffolding for QCN9575
 
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   9 +-
 drivers/net/wireless/ath/ath12k/Makefile           |   1 +
 drivers/net/wireless/ath/ath12k/ahb.h              |   6 +
 drivers/net/wireless/ath/ath12k/core.h             |   4 +
 drivers/net/wireless/ath/ath12k/fw.c               |   8 +
 drivers/net/wireless/ath/ath12k/fw.h               |   1 +
 drivers/net/wireless/ath/ath12k/hal.h              |  10 +
 drivers/net/wireless/ath/ath12k/htc.c              |  18 +-
 drivers/net/wireless/ath/ath12k/htc.h              |   8 +
 drivers/net/wireless/ath/ath12k/hw.h               |   5 +
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  46 +-
 drivers/net/wireless/ath/ath12k/pci.h              |  11 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  27 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 484 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/qmi.h              |  73 +++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   6 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   9 -
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  14 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   8 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile     |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/ce.c         | 404 +++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/ce.h         |  13 +
 drivers/net/wireless/ath/ath12k/wifi8/core.c       |  31 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        | 434 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        | 171 ++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   |  88 ++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.c    | 124 ++++++
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9575.h    |  15 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         | 250 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hw.h         |  14 +
 drivers/net/wireless/ath/ath12k/wifi8/mhi.c        |  70 +++
 drivers/net/wireless/ath/ath12k/wifi8/mhi.h        |  10 +
 drivers/net/wireless/ath/ath12k/wifi8/pci.c        | 105 +++++
 drivers/net/wireless/ath/ath12k/wifi8/pci.h        |  11 +
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c        |  57 +++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h        |  13 +
 38 files changed, 2515 insertions(+), 61 deletions(-)
---
base-commit: ee7edfb99ee26581633fabb0662382734ea3cdbd
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e


