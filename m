Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C0A606A889
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fT9KYNDv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m19w5IOg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etyt54Sw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WXnLeoxfp232EWjiBhF3y/H7ymqk8WYAwxCOs8aroNU=; b=fT9KYNDvvpmO/RMqz6GA66/8BV
	cIdb/EVOtM4TwqchOrnCDMavw7gh+CBZC9JYR4CzVDIXaCFt1iTrA2w/L2D2tO9ktDJ3bMUq6T27M
	/jPJQUh/kRZuqZ9PJpn1MoqZCo3WGJtwr3YWgNGOIffNJvFttNuPOJPU/N9pxRDd2alo44zGX5bZB
	AI5iDLfYNaYHnntZvfX6Fi46/B/tvNhWbccoMT3MTbN2rp7XZ6mdqKhimjcYWfeBFYcmh0RmSVZ7P
	ib30oAIjedVDcnm4gBrEjD+uereCfBju4FuvTTq/gEm5zJ3BNlna4+H7dgW5waxLEoKDZMvDRfiIY
	Pfds5OYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapO-000000087su-0N70;
	Wed, 18 Nov 2026 08:15:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTapK-000000087r0-10ZI
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 08:15:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2W0CC4059999
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WXnLeoxfp232EWjiBhF3y/
	H7ymqk8WYAwxCOs8aroNU=; b=m19w5IOg/NoLwfhjoxlzbep9yGXIYbNLp6inMr
	Ift+V0AoEzRW7JGTzmlLsqa3m9oJXVWN9VhM877tv4457Y3jLOSl+QTtNVhJsnx3
	enMUcr/uLSAXIi4oSyfl3uuzx4aOKF6X7EynncmQJaGdxWY6oJvIM1Txi0GhHTcZ
	356sDkVc8Ozi0l2wlAQVI9eStbyhMQ++BQ4DwTkmCrMZFMHcsc00Hd0/Es0lQP9Q
	tJaiVWntbq4ogW89K5uApjrKKdEugG9dxj2rRBdRgn7JWszfwVd77kixm5OO15Eb
	ZOoFcaoj2iXFeEzziYMHYM4gt8lc322QbGXH/SnIcOtjqZrA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcj0sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:15:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3c459a35eso831997a91.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989732; x=1795594532; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WXnLeoxfp232EWjiBhF3y/H7ymqk8WYAwxCOs8aroNU=;
        b=etyt54Sw5ReGHsD+hMHd4Lk9t0J4QHErhP1LH+9DmdPj0jpmTkAptG6deTu9GxZBJ1
         3RbT3zOpbaRE27DLw012nEEnMTkwELZXOG4yfquNW7Fh5e2IhuXqcZ2lbeoxv053XOnw
         Y4C/As4pOhqW83gdHawvuKu0fY+KFXMSQSUgSFXx82Z3kINN4xoAzqDSh83D8bU9Ffwk
         ZOyiQBID2IEmGbcRsggREgJ3zoU/97j5RiiFcHdKC71ps9gsdkSFTg3ZQA8Fq3ItBCSg
         rLpoGs3kUT+s2rHD/qhTrAzwHsPZyzzfkEpwl4kv1jOct+fDqwEbhaxORrbykU5OB31i
         h94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989732; x=1795594532;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WXnLeoxfp232EWjiBhF3y/H7ymqk8WYAwxCOs8aroNU=;
        b=pImosmn+EbV5HDgxz6ThmFdb5uPn97wPtPc6o19mLAj46wxSwNx621douWd9erozsS
         ea6dYLNBjC9EZpBKEBIeskWEZzBdgfFanBVhCEY/2WVcqA3BUeQIZCuZVP9EV42276PA
         43DYMgcdoyfiKmApKPJ1pa0bTSxfGpmdjXPCCC+MeueV3St/u91zg0ahdJIrUf90CzVg
         ERhYD4j2SPff+lNhnM/0XIaHpV9es7ZnwkzltUKlx8J2dXpkdX7/Oh1w+5sYfrCztD9L
         9JaT5KJbN7FVL6BZWfTZgapihlnuHXr0mzgHyHH7rl+OuycpC4uCF3HW2V0kkpYoPwpf
         jLwQ==
X-Forwarded-Encrypted: i=1; AL+hErHmaxpdv/I+VbphEYbxQTV0xl+cmxsKrBzPfrLNVo/aJw/YGB/4YEiR96ZZIPxjy/t098COpFI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8MkCl3TY6ORJMFHROPJ6e2bX+hImSqjsCkrB+wN/HNd8X6p9Zo
	Os5nsZW9Nta4jcBIMTIjYDEm3MvVfMdnV1WWECCl49piXYG0CzeeFHmotWLDeX0WNzlgmvJ3xSa
	VKeGlSY7CEzVi3r0Fq1NiE2i5iZP60X0dBFq0/ctZif3edvpGOkMuIh7xNElfqVn45/5xLH7/
X-Gm-Gg: AZFdTZe2MP3NYmoQto8yQUtXxbYIAPHORY32woPhYdSuHFJhMvPEQNfITh2adR4puCv
	hFL06jIkapB5a3OQfznDhCpyQ6+F9R1uh2ZrF0eu9RLwLRdFbEVy5gwWLL4XZBHJVah2ETkvFuv
	CYbQ9ZXbSFBs/gyou8CCBqULj2qkcY/7gPJlAdAmlZFFoMN1ZaOmwsZzwBXRqvnSoLUuZLLIHFK
	2Wn1ci3yZdBOMIu+QtgETTd6x7NylWgCM2VUhTRSd5Q+8QX7Kn/qX/QjjUP08Lj467RxXnempXI
	fDlvYHzjl68EI4EGgHpx8V4MXFCnxPWAcvu3iV+OKBOZZ1Z71VCfCQP34vB+Pikwjh0T+Cqu1KC
	j9MnkyXUviTx0RoGtetPtdZ0IC7dqwwRMR/FYLbNqgdN2MrLGqQrnynAqkuP8Gxv3GUu4PfcN9A
	SSpWwV8OOAo4B3T/2dcCRADLWx5IDIC5qGVYbsewUqIIcPAVD2WZ6XAtXJcchNYa2J2XVWvpBWK
	w==
X-Received: by 2002:a17:90b:4410:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b3d07a8476mr1949833a91.27.1794989731724;
        Wed, 18 Nov 2026 00:15:31 -0800 (PST)
X-Received: by 2002:a17:90b:4410:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3b3d07a8476mr1949801a91.27.1794989731181;
        Wed, 18 Nov 2026 00:15:31 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:30 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/15] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Wed, 18 Nov 2026 13:45:23 +0530
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJte/WoC/4WOzQ6CMBCEX4X0bE1/tIAn38MY05YF1mjRFhBDe
 HcLXjxovEwymZ1vdiQBPEIgu2QkHnoM2Lho5CohttauAopF9EQwoTjngj6wxOx0ty7fptuT8ei
 q7kZ1qiBVmkvFgcTuzUOJw8I9EN3W1MHQkuM7CZ05g21n7HxbY2gb/1xe6PnS+LPWc8qoLCUrj
 RXGqHzfhLC+d/pim+t1HWWZ6sUnLPsFExFWZFxLtlEiZ/AFNk3TC7hd8voqAQAA
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5ea5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: nZt-7zXK18REEoPfWJEIMwxF2QPGeMdf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX9xiHu7DYTPDz
 RoHaRvZLSdPJy5UVxd6EWkhxvKzV2vSeMYAZZ/FR7Koc6k5c3oEwEoiQEL9n/fGhj6hd+JBoUfM
 bkxauryvza59pelrpPQomRoU9SDr4cM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXzVlRltLMVmYt
 lqtPPACWqIkXr6Mn36n06azd+sjVNdW/1sVloLzXzvCcP3IA3RB4Pqm7J/ectYWAQ3CQiQsb3of
 mTu/gKN0nfqLua0eGrftSttyZahmJkvYs+00rdMblZ9YIbxVtOnJOr+nwdZsadY8MrqqbtfNxgR
 5apUgUvIqEvLuP134ZDe7jsWLj8kP/rBwwXRxJ0lZP3rWYcHobQsn55bS7GXl6++HYIxs2rvXeU
 f+FLDQiYMog6tc07MLsH/wmkHZKP0R7kahPr7PE2gCUX73l722LJyVlKPg5kHW1Rj4lvyNG6ZEy
 6KteAM+Zwsx/dBr6bwI03xe/3zecCA6eiA+Hlmlbte8feoCKqCzxN+I+NEV+DNODdSRkAflIT2S
 SWDHXYuM4YxYiZ+bt3XYdsdr0pVx+8sEInPCeWM0kz/292/B8Py3b74+L9NwtaucXOScNJrgyT4
 X7fbHjXB53JUxHTAySw==
X-Proofpoint-ORIG-GUID: nZt-7zXK18REEoPfWJEIMwxF2QPGeMdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_001534_469626_35C4BBC4 
X-CRM114-Status: GOOD (  21.08  )
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
Changes in v3:
- Replaced u32_replace_bits() with a plain AND/OR in "refactor PCI window selection to per-device layout" to fix a build failure.
- Link to v2: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com

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


