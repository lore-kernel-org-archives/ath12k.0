Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9AF606A332
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qqMtxksP;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCffZGIP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZNNHbuM4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=onk3fnlRkqPUVq1zB+A0rGhSVLK080Q/lQHOHP69pa0=; b=qqMtxksPHSUiT/tok4K9V13qrd
	SHKcyVU0mh1kHlqapVlllS4Nh0SANY3D3r3QDdASkvCDIZ6QvehIit6bBzNZ3WtQ9Mt/aTYvs7Qoq
	uRF2Cgb7UPMMbzlZ1jgrklUCITRV+dbnSqRzQvofGniHasIOAmCvB/R6ZvK/826FToN+KPqGQZDcz
	nQfX4v6xP6TrASs4S2A/fAUR2vTkVPIigidkUzq/umlw06OWBeVZrGyjpALX6h/o+dYNxVhRqj+dK
	4kr7I40TG26NSgrkdyP8PxLwqitHUS3QJ3QT5pSwmYAcwSTa4imBl8yO+igi36iCmSsex/Y35IguO
	yR46RenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcN-000000079Ld-2pb1;
	Tue, 24 Nov 2026 16:43:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtcK-000000079LA-3WZz
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 16:43:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLX7o1331889
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=onk3fnlRkqPUVq1zB+A0rG
	hSVLK080Q/lQHOHP69pa0=; b=FCffZGIPNmMaGIz+paV1W7WNWouMZLBRWaJ3u8
	EpB2rjC/hL/TNtfZRCuQ0ZwuAtQNEyW3AwY5PJfxhyXdkUXeKszoh0U94/soAi/l
	cqqTVAEZTLSn3vWm2TptPqPFrqxEXJXEjiCQcsbSE2n3D3a6ks6MEK9radxq5UWH
	wu4fg6wp6CeBo1fP6yE+kB7fHE+9m/LvmZDDPzoyqrrPA5Z0P/XWj3ZsKZSkN4S8
	sCbiexbKX0LxQBcX6xoFvL7rv3/QGSRJFUkDmvZCmjb3XaVlIdj3kfHIEvRi0V9j
	6FWX8pT/uE6lpkJAQo/0K1OVNiqx8BI6iVFZvW/ROgiTHzXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb3v0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:43:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so4145208eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538618; x=1796143418; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onk3fnlRkqPUVq1zB+A0rGhSVLK080Q/lQHOHP69pa0=;
        b=ZNNHbuM43zvkSF4ORtiJp95PHGDZbOapWyzPz07VLMSUnIKIa8n00YST1JnI4hbjjk
         5I6VFJ+TfCVmmLP0oPJRGVwOy2Php0w5HCbQULjcoW6eguBQbteD5jrGHuWxhMct/gnK
         Csf3Ck5O7FGEt43pCqPfoYB18tjiJi7/Ad/jmNWn5P5VUdMFDNdXFM+UavKn6zxb4tTo
         gdbcHnBS1t12/7JRKv8stf1JBdwOzFK1livnq/s+hkL6akpTykyrWt5MkyrBNIDwPA3n
         yAIi7VX2TyrkzU0qbz1KuHmWJOIn26hwtXM9QYL921blwuBXXMjYAXc924tVQUCZ6PoU
         MSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538618; x=1796143418;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=onk3fnlRkqPUVq1zB+A0rGhSVLK080Q/lQHOHP69pa0=;
        b=blHCI36lRg3RtK1DzM+NOSQx8JngVYrCrX2XXvECgdBep8S9HaNiwyHfr2SgGuuB0j
         g9mE7CVe/wO+7jJ+wj1wi0P6doYJiifgeeNrmvjZD5CQAeihu/M8O4GpvaZI7s1ZynlU
         rBxBFSAPVA9WFdmbCpAqGK8rCq0vHH9xROoJccZlhd1zm+UybOhrhGS/iTGc6RciV7hB
         rMsfEZQ5bqdh6hR+Z2xkFPo3KNfsLyA8wAIgLVKlDXWVammqxavIK51IO16rkstakQkI
         XYOgeaOI1v4uaTTlukmEPnARL7R6oRArLTfwO5Nm1DBQv51ZlB88T7pKJYrqvzlKUU2b
         /i8g==
X-Forwarded-Encrypted: i=1; AL+hErGVBqpVAy/Zv/RnwecdjXWmIalUNM3z8Paupfyh/RKdLHXRpiFCsL4Df5iYV9aH0Ay5BjZlTMg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9FsY1ETivSYRgXy7ETtEoC4V0wzFXQBYs7WVDnxgupZIfpubrS
	WbtmYkPszMw9gHyx92zCvTrrc5LusXIMbPTNN+/mMWz/Ihqh0mdsk21Xr/cI4JvWdsFfs7LYM7g
	R0WbHBrxb/WGTMfEAUAx1E09eIRFC0KviGmhY2KjB334uXystHtUhm9xu7j777804u0wubUmp
X-Gm-Gg: AZFdTZcQWeJep9TidAo+daxjVmWJKZoEBGHuHyVjZSULZf+3L+rmNG0o3p8aKs0mxjs
	QjCnkHIQq/2GIY+ln+R5N4DbEKY6iNigWlJLHLt7SJ7p9S70XazjDWX7klY/kMEvOjfKYHlLyNg
	ThR7JfZY8IOkAcbF0fBqwguOQ3Bt8QKr8nTh2ruSZuD3JWMua2CX5P7uaq7xhXI1xZHL+eyZU6S
	P7SPPVFfgbrNMVomTfyJoTg6ziu/HTFFcZLv22kTqHorXWhbLi0uieKRgSrWLPNA900dY89OU0v
	EOqTPJ2pp6RJpaiAL8i5dEJ5ZxS9OBeEHuHW/fm6pqz+dFXniXZUxHiPdgMnbJ57MAHSCi36aRQ
	RgI1UAxHaLIpsLv9RJ8dRw7aj9ox3rb+igvX04QVbXT7vifaWW49WE+wMPWxM6HpGukJIOe865x
	+8zD8xoTMFaH55+AAF0no2TycIyrpZiu5T4SEY3ZWZ1iKFddO2/MuzfCSuRnmKM4X2oo833scCA
	Fw=
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18228338eec.3.1795538618097;
        Tue, 24 Nov 2026 08:43:38 -0800 (PST)
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18228310eec.3.1795538617552;
        Tue, 24 Nov 2026 08:43:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:43:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Subject: [PATCH ath-next v4 00/14] wifi: ath12k: add initial Wi-Fi 8
 support for QCN9575
Date: Tue, 24 Nov 2026 22:13:26 +0530
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6+BWsC/43OzW7CMAwH8FdBOROUD5o2nHgPNFVJ6lBPNIWk7
 TqhvvtCuXAY2i6WLPv/s+8kQURI5LC5kwgTJuxDbvbbDXGtCWeg2OSeCCYU51zQL/RY1TcXdFE
 WtY0YzuOVmlJBqQyXigPJ2WsEj/PqnogZWhpgHsjHc5JG+wlueLCP3RbT0Mfv9YWJr4k/rk2cM
 iq9ZN46Ya3Sxz6l3W00F9d33S6X9dQkXrHqHSYy1lTcSLZXQjN4g8l/YTJjuiqLRhipC+l/wZZ
 l+QFXArPhdwEAAA==
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
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b05bebb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=stkexhm8AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JfrnYn6hAAAA:8 a=IFHodnDJ-pNzQd9Po4MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=pIW3pCRaVxJDc-hWtpF8:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: USWKLJSyAGeJSoZfB75r1sOaaAjc_0h9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX736S0dEwPOKR
 LiwdpixVXMDXJKMdVzy3u1HWGLRMlBBZWsvLVd2cUsUZb4MvsYc7X/St4QggpoImsZUVncuF9Lk
 xm2vnY07OpU+MHC6qyCEUzqWwessFI0=
X-Proofpoint-GUID: USWKLJSyAGeJSoZfB75r1sOaaAjc_0h9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX1IUUuT7UVwm8
 MUA2aDTwMeKLdNfHpywhqVaZ/ua8Q5hH7k3/KYznuuZypzatrHTWtr3tlStsstpws6r1v73iB+f
 E1POpdpfTVh8lRlBb0cECm7ZZr/1jV5Mx3yJXjfV7FqD6u8eqBG3ITmS/2Z+cdChDp6cIxIOkaK
 vtD/GK3sQsm+aIcNMMN5ltZkFkgBXk5lmj8raovKqoFvYz5dD17/YSPfKQ7HjiF5RhXSO2AGnWR
 TSOMXN7+ziIX44Ix8GuD8NTTjzPpvbmTevbFnU7vt7oLLBujutWITzJ8+lblycbAGGFDdgoRGB6
 rarnniC3uY9Zz0gs4c+Flz7zMT3ZufAl3AzcG4f7xRB0gMPw29WL4LivHx0KcWjq8mXwIOd8s9+
 td7lNdgkmxK3j5pBQPRlcrRLGXGinUUnC9/uNGIiQsUExkI0jYnoVOF8O50JynFx/1YeaRGGLLk
 0Ps97srbYX962/5lC4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_084341_036821_577A43B5 
X-CRM114-Status: GOOD (  22.15  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,TRACKER_ID,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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
Changes in v4:
- Dropped patch "dt-bindings: net: wireless: add ath12k wifi device
  QCN9575" per Krzysztof's review comment.
- Link to v3: https://patch.msgid.link/20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com

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
Madhavan Ganesan (14):
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
 37 files changed, 2510 insertions(+), 57 deletions(-)
---
base-commit: 03b7c601b6e314115015a57061f5b377afe13190
change-id: 20261112-wifi8_qcn9575_bringup-a76e76a1361e


