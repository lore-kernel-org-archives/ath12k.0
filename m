Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953F606B27F
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vhXv/ooT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GI91eWHa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Os6cRied
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=; b=vhXv/ooTkUebs+Hdstv8nuIBP5
	gTNVGB74touIDZOKvILR2rcx1XGAwEwFzMrePKLC+P7voZAW7J7d9J3SEzj2NICZyu66bJcuuuZMy
	V7nN8LD4PWPbuqJCLXBcSiI9VsXkq+Lp+SgJVgZ90TcBkN6rOmFuPPNqCvk1ursEiIkaJ+efar+QX
	1BgFXaHbaH9cd1JfhH0arpukHEFrGb+Pph/adIbu591XT8GrHKAzIk+mGVGVq6GGih2l8xPPpCSFq
	dB6a7YEVnW5ohYJJP28j20x58OOM4oQhaxfI4kxLZLBKBLCO/UkcMYMP9xu6vlOdSxtGl+fJyda/u
	wyrCq1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQGQ-0000000990G-1V6G;
	Thu, 12 Nov 2026 08:34:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQEQ-0000000986O-3WGA
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 08:32:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5o2HM442333
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zEk/fVzROC4wD3xuMlUk2K
	D0H5ZpB6YjFyZz1YUQCNk=; b=GI91eWHaywUHSEc94yy+dqeoBtOBuGh2mVA07q
	YlDeXRMP7F6rLdmOqWngdoPoKb/r3gE5nNUXYTKtkqWblHuvbAs8D//1f8EVuaCP
	PfamF0fioLvN+8Dqn25UZYJJX1hRsMWjUIM3CCld1wssHqpUbtFVsl6VEBExSdGy
	5Nwjgatmx/23rVgK+IpJkqUrjwwaJFCLfX1F+7zGRIg4Aw4DCMMN4Wnm2W5g7AYo
	D+hH87+nhiNdboFqeFb8d/w4RdT8X7NfpbPsbku7bQs3n5r5QopGSs2tgfNYVoCK
	Tyvi3UqQRjpoEZ/7OWZi2+ae1in3ACHscsawMoD4CFvOKkEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0k0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:32:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso4998319a91.0
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 00:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472343; x=1795077143; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=Os6cRiedyApRWexk8uHmaBlgbx4JQGzdtlcC/WiRcRA0jUzGXZWwp7FyuLam/5jFnY
         Og1epyMYBahNScDi4W5+FW0S6X2TsRRQxlwXOWY1q7oiaJJdsaa7VLCtCl3lcsjXWgZO
         1Un995pg/lvbpAutYfsduRbpFTEwi40Ng+XHb+OuujrUnQkqL++dbjiobBviut88d190
         MGSSpLifgxvuMi9aX7ZIGshps19hN5X6igrkqLp8uoKk80lEJHcIO4XJoQvopSzxRYYF
         /0li87KzEks/9vOipMwJdA6DNVBDsqF3/v1Hpt/9zvDpV93WtRIf38OF/HyhqmCEmagz
         xa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472343; x=1795077143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zEk/fVzROC4wD3xuMlUk2KD0H5ZpB6YjFyZz1YUQCNk=;
        b=wKBADHNjx9udSkxDSG2VCKvm1kTq9nKb9h7M1u71W8UfDtBnzr9JyAFwdOOLuqOEQP
         X+i9YUhZQmLhz5vTVRhJEOHlNpY8x67S02lY5o1iEW31kUWwWBrfqZpQiM439jaz230w
         UywKtQZyWh6Eqk8II883wDX3dmylhP28ODWfWPnv1sqh08kH7569k3KXtCXfZaEJ6Rlu
         xINrPAIIVXROOWCKQHEZIyf8gOp3HkW4JDRzzhb2u0i6uhTEUX6OT3UG6t16J2+aH66c
         aWH6PpPgNo2KJUZShDDYObh/UdHwOKesHuoPQaORhHUeRG+wHt3TgxdpnDAqgqCUO/tV
         qZYQ==
X-Forwarded-Encrypted: i=1; AL+hErEfFfiGwqLc0ZEkMcHsVVbyghb0MyRHsvJJ/Pcczla5Mi1EcE32BerOIuTVxsiDvK3PaFP7FLk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Nu+/JZXIgSadsDLbP0qeMzPal7QAGb+fAKbz6Ba4ktxlNkInP
	Q/vWreJjQJ1P3TmCWwaxh/UJ5BqNUKnpgCrpqyY+bBDrN1gKRKzP2hdCVCCTSBawr6cDdGfoiJw
	KSttm5/VQbxRtUReg//VqM+x7CGjIieMWtNUX7CfZuswHB4Ss+/7vjHcwTf6ecsTQ65zOaoRi
X-Gm-Gg: AYBFou3oyv/TFQ5DLm7oGWWa6+YcTet5SJl8yIP1DfTjLSX6HC257Yd/Atdj0vRVupX
	II6ULZlsqFoxzckWLJ3utY74Wbl3pOBmu9bcaInrKOENpq3zf9puIAjNnFEhqCfheuBB2WRSEoF
	L078ccrgbh8zPw1Gh+lP9OoXsxo7PtrafvgzqybVNkeVTgdnrA/ZWy28dhWBjJuTAjvC9glRIme
	Xx7RaPZCJuV4cmUuvK1s0SvyKY4+vkuGZSEldM60NsFes8Z0jiJYduRD9bVQMtpl5OER/IcKvs3
	IesmfbuLnbRwSn9BHjUWeyWT+LedB0RkdIaCRfUAO+fwuU1TexpbIRELEAxifzqXoQ3hV6T8HnB
	+/+oVuQY5kzLYbTF12QMlDJ1NMZ+FQNyDOf+HhGhoVFF1a1pDhgUHFPfOM57gQTsX0EvZPPNCCm
	6wqNr911X2GdU9mT4Bu8xlnEQEIpP/JLUI6WIok55BGw5HmPd0uYvZhpLbJMPY3mwuwoueAuMai
	w==
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552168a91.43.1794472343098;
        Thu, 12 Nov 2026 00:32:23 -0800 (PST)
X-Received: by 2002:a17:90b:2f04:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b182ee3b45mr4552128a91.43.1794472342533;
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm3518029a91.3.2026.11.12.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:22 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next 00/15] wifi: ath12k: add initial Wi-Fi 8 support
 for QCN9575
Date: Thu, 12 Nov 2026 14:02:14 +0530
Message-Id: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI559WoC/yWMQQ6CMBAAv0L2bBO3hhb9ijGklAWWw4ptURLC3
 yl4nExmVogUmCI8ihUCfTnyWzLgpQA/OOlJcZsZ9FUbRNTqxx1X9cfLvbRl3QSWfp6Us4ascXg
 zSJDbKVDHy/l9gkuDEloSvP4mzs1IPh1b2LYd5n0X2oMAAAA=
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
X-Proofpoint-ORIG-GUID: BFIbI3NpbIM0cB4_nbq-g-vY8z_cVKUA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzwdDYuWk+tvE
 hSgIbPB66ylxXkwJRNN/tzVuwVh21OMIehmnuYkeHfDJjLhwSaLxcX1eU7KlwIG/Rb5eqbqo695
 0IaQHOIqsq2letw7aIvlB1X0Yaas7Cc=
X-Proofpoint-GUID: BFIbI3NpbIM0cB4_nbq-g-vY8z_cVKUA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzIZ51vdLOWQp
 /nnLu/gZd66cpZq2eqmknb9kQ8spjGYbyB67UM1s9IOpTtMr39oUw1fyFCmxxEQ61IvsZgqTEDK
 dYDk4LaSgcnQ9299BPm/iiDOm5MaFcNpPvbqqjN1LwV6x2C097bo65NN1Qv5UKV4X4+k5AwqQFh
 llHb9wyVSlgnUzMWXtctK657hVWwphC6DsdEF7fbie3A3NH4rS3oqAfNO87QLrKeQQ6YKWW7zbf
 MGcvhwjZRYUAaplWPlXEqHL37ce6OVh0u3aqKelgxR4xhZ1192IqZ6b8yenDfvmCLidTnQiQXjj
 GFVWgrd9/cVMtRllMksed+BlIknQjCZtTp8yLuwSC9Vw0HMcQo0Lbj1l2lCeewmcaLHWP70vnfH
 K1EhE20urV6olIXPDL7HLLUOukbVtnuC+3V3bPSfycW/k0hjwibak3VKKwJl44DS2AVO9s6fvfY
 oGZuOia5fS9cP11JGsQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af57997 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=uhRKEIYKi0VZnCLPkisA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_003232_172990_106BFE51 
X-CRM114-Status: GOOD (  18.89  )
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
 drivers/net/wireless/ath/ath12k/pcic.c             |  22 +-
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
 38 files changed, 2512 insertions(+), 59 deletions(-)
---
base-commit: 91d8a01977701d10b0037e4adfcec21d8dd6d48f
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e


