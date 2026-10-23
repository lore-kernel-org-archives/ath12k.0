Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3F60A6F48
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cDAL7QDM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=l5PtLd3J;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqEZs/9C;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKZhzb02
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=; b=cDAL7QDM8rf0LpeGkMEe+W8/WE
	lbTjm5/ZMjYyoppQg539KUhxoI3nNvlIKKy9ZwmDwF6DgmJ/PZuHgNr9uQddl3AN2R39L1zkBre3d
	UoXxVWZ/hvX6+0njw/E31IVC0olwxYOomjrbL4dtQ6E0JPaLT3S1xu36cJvU/GOnFgFIBN6j/7+ZH
	txx6fcc5a4qID5VEQlkVhFWdy/O86Nq1eLTYYfzMGaDVncCn4gth2/PF2pgWQ/zySwQ9jhmvaiDPJ
	CG7WogaU7AQnghwQg0pWEhLEZOV0HujjZQOHf/0uhbOk+4SijDp4Enmfownjm9N0z1m6seljVpXoR
	vCb56sXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hb-0000000Fg49-337C;
	Fri, 23 Oct 2026 07:01:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HZ-0000000Fg1l-0oZQ
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=; b=l5PtLd3JvzrrKBAQ+vN64Affiv
	AYA1+/MAwZ8FttfwjqZhyg03yRGG/4E6AFjxxVa8lByIOkYkCxv1eE9oPbWA3KoCCSkTO5aPCr5GV
	WV8Oj/vUEXha1X9UQeSoH2qgXHb3WG4/7w/bn9xAAjvWvSNZYZSEOD2Vr3ZnknrEIcFSU61q+WHWH
	y+NOO6+qaDZTBcvaqvnji0q9i3O0GT36qCyE6YnHJpwdOOSBItLn52okmZiaQMOc1JhZwatR/eR1+
	Rx08NcU8JbSSTkM7Sx5tJyj4cODX5N3oXXyauMavWamfUILJfwMOskWLuGRW0KpvOB1ks67Cc09G5
	uQEhU1sA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HL-00000008y6q-2n4E
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EsN3772842
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p8K8L3wm/2TFwy9MEBg0/j
	022FtSD7ewKzpYCuY3Up4=; b=LqEZs/9CtzveTW1BQmCuKGsRV4Ouli4SjIZIHw
	Kb42DKaWDD3kTRLwXim4TKFL/0VSJ9Cigi2lKKyfGIF9wVVu1JwXsw7DyQENjOJF
	GcBAFyGT/T2QR5Yx9hDIdUpmzaF130CMLw/+Mr5cggLF0Y3k+yLVI4U7hYFEcySU
	fezzCshxBfCfK2+84fgpGxYFwkSMg1z0h81jFjBXm8K3SiFVDt2+jpK+GaSb8oV2
	V2NVi+C0gxdLjyHvTOAGVeFDs4jKzlf/t7N0X1SAVuZCu87rHBSXKUuQQy2jX420
	LiQ1QBFx9Z6lsWRNR+07spaJpZoNDrBIQZU00b87Wgex+wNw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttbkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6ba724b6fso354076a12.0
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738875; x=1793343675; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
        b=QKZhzb02pUVLixt4ftXkKfB+FxNeiuksfHxoIrIkVHdNiihSUvuMakmsBhxxPRaAEh
         2aLs02aAh22qRN9FoS0McDgNH8CJQDjT5+YCmL6T76GyhwPQojD8B8fQoBt0pdvJah78
         MBqJQJ4xr/DCaMsnwpTZOvcl8rjiT3XRShQ2HxL6zhtC2UCPgPY4opwQb7xIPhj2M/gR
         HqMTe4W2tW9tV5h+2DuB/n/d/maplGE2Oce7tSibbUdav5GbspW9erjt06dlsuPdN9oG
         6ITLV8tkXPwzfg96hVwQnf9jSQ4+3uEVV/vke13T0i8/9bEj1KNtuKT5FvM7SuCAkN5C
         cw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738875; x=1793343675;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p8K8L3wm/2TFwy9MEBg0/j022FtSD7ewKzpYCuY3Up4=;
        b=kK10kb8k202v2ok5ncUmR0LBuj5QsiAL6ED9CyjogOHITWT1ZF4IWr1gZwonaL6pnS
         c17+LeJ1HV1z4qpi5BtwYPQQkX/n0BRafjK1E6kAJ+MtA+wwusbNRFKvt+TiQsPaIpBw
         XuQ4WVH0XOkrJoBTUI9SXdASAKCOx+KSxihc9lNGov5BFmCByZ326rpkGGEHM2POD2VH
         GjnowlEWlTNUou0yesj0CJdRkpbEnLUOAXwTUioQMYsAPoX0r/fNRiECC/nsihWAly05
         pYrJUSeuLn8BIBCsgnBjkxxSHC8vQ3bv5hily8/fE3wR4vBMAwRFv7yjH/D05ONUYQW9
         /0WQ==
X-Forwarded-Encrypted: i=1; AKwUvByPQu2GI8kjBE+C3Bgf2n8AzcQsqCnKCWGRy/3OddCUpmLWHnD8TLgK4ITvFTn4531kuqx86vM=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUCHZc7GiSyz9PQP9g25yGxXsXE/kF+MecodPT+EI/ikZ2Br/j
	Trh0MVPLHhF4arFAmZbnm029bEaP0NgKaj0sEluRItTp6AzOnSHSwGLNAEbKRCDMrwY5gUzYznp
	Pujc9oGY70ROKpd6GnIYMucK0baqJyinVilReayrlx5xwW1b48SWLS46//mx2ANyl
X-Gm-Gg: AYBFou01LOU/8dghrkkQ2kghH2l1nh/Btd2WLdSnM/dIGp6YNARjviDiWMqRXNU/+r8
	f83u4661tHPVEG+RwfZnEmgKFGQQuwlWYE6jkHDfuJKMXb2ckw8X52252g+7DqGBm79R1EvYebp
	QqpMysiAzvy2ASRtkfAApKUcR+9AWIsYO4AaNKD4TE2+m4uxaSMUYi7Ls0XMTAIiXMnWAunl02M
	hxD4YsD0RNWR6eZF6Qbz3K+g//FqE0MKt6RFYRRwSe97bTHRb9pvMIe5Ld79qYtW++1HCxO8DO0
	84fep5quXaSBTG2iyLz7OGxOmsNamaknDkoGhrQO4tZaQShUqs3YaOEIaX1YLFXMEs0n5JwDSvh
	SuJ/Y6nTI9PQw5hANana4viyHFZdVslFmxNVMKc4d6h01+9tFN4Wfk/SYp34lWxMMluDvU7pweq
	OCDMwnmdJ+N2bIbYmhiUFsXQ==
X-Received: by 2002:a05:6a20:4306:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e3767aa572mr965992637.70.1792738874950;
        Fri, 23 Oct 2026 00:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:4306:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e3767aa572mr965967637.70.1792738874414;
        Fri, 23 Oct 2026 00:01:14 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:13 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for QCN6432
Date: Fri, 23 Oct 2026 12:31:03 +0530
Message-Id: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC8G22oC/1WNTQ6DIBSEr2LeuhjEok1X3qNxIfShNBUooLEx3
 r1ou+lmksn8fCsE9BoDXLMVPM46aGuSKU8ZyKEzPRJ9Tx4YZVVBC05G54jw2vSTIzVXZ14LVBd
 ESAvnUenleLtBFwdicInQfpMwiQfKuJ/t3UGHaP37AM/sWPwY1R9jZoQSxQsqy1IoqXhjQ8hfU
 /eUdhzzJNBu2/YB6TORMMkAAAA=
X-Change-ID: 20261015-mpp-bringup-75f457bef8ee
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb0640 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=j9mdO8TpxRXb4I9anNkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: -8Mh9BFZ_fYdmVPGazn9qoHaAurcDJQG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXxb4PuB1hV2HO
 qTLqloNcniC4Y9jrCFNzz6IfNO3TXOU+J4PtFKRGftBgLI/mczS2E1BqrScVNotd4KOgFrJ3yl6
 fet2oAhEbGFitRWydVLUEEvC4/0QyX9xePo5ho7ojawCpBkr9ToZb+i5v1c4eJ6S801/Yv9iw+U
 iQEEiMEYmd5Y1FVb8En7FYDj4TSP7MYxm5wzeA88s/DwxslrFduds/tmDo1jDKiPbOGLsH7CwT+
 9RswmU3aAkT+IaVYQTE2bxf9H18Son0gxtUPnlLmLjOErMvjah4nJ7DJl3TKrr3ZIKcne+eownF
 kfK0aE7hrqkNIgavyP0a7M6jBlcfDix/DJbzcH9pMLD6u5W42iMxBgkIzfZhVALJBF+TJDMMOG2
 PjLZAgHy4cyxlk3bRbgegQ4rhaoU7aWG4+j9O9dHoDjJG9YngkwerP5lHi0pfJcrubKovMgmfQl
 pdX4O3ZDjRaox7Cf0tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2OSjEu2EPx8Z
 3ACnhy3qr9Hk0cUjPZ82qXCouaHmjoDn83I3EW7xLfCcFU9fo3hfSTEyA29cfha6Js7xk9PBVxT
 g01JgpAiAr47Chyq3Q8G0tkwhDfMFI8=
X-Proofpoint-ORIG-GUID: -8Mh9BFZ_fYdmVPGazn9qoHaAurcDJQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080136_261170_5B3F4C7F 
X-CRM114-Status: GOOD (  17.92  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
registered as a platform device (AHB), and remoteproc APIs are used to
boot and shut down the device, similar to other AHB-based devices such
as IPQ5332.

However, PCI APIs are used for device setup and register access. Since
QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
AHB/PCI approach is implemented.

Overview:
  - Patch [1/17] adds DT binding documentation for QCN6432.
  - Patch [2/17] refactors PCI operations and MSI config structure to
    support different MSI configurations.
  - Patches [3,4,5/17] add hardware parameters, ring mask, and registers
    for QCN6432.
  - Patch [6/17] moves multi MSI vector flag to ath12k_dev_flags.
  - Patches [7,8/17] add hybrid_bus_type and HIF operations support for
    QCN6432.
  - Patch [9/17] adds support for unified data-region memory allocation.
  - Patch [10/17] moves MSI config to pcic for better abstraction.
  - Patches [11,12/17] enable MSI interrupt support for CE and DP rings
    specific to QCN6432.
  - Patch [13/17] uses CMEM write for PPT on hybrid bus devices.
  - Patch [14/17] stores and uses per CE DP MSI data for QCN6432.
  - Patch [15/17] derives QMI service instance ID per protection domain.
  - Patch [16/17] add userpd ID mapping per device.
  - Patch [17/17] adds support for QCN6432 in the driver.

Changes in v3:
- patch 1/17: Update the commit subject and change the file name.
- patch 3/17: Initialize qmi_max_chunk_size for QCN6432.
- Link to v2: https://patch.msgid.link/20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com

Changes in v2:
- patch 1/17: Update the compatible string from qcom,qcn6432-wifi to qcom,qcn6432 and remove the | character.
- patch 11/17 and patch 12/17: Fix resource leaks on probe error paths.
- patch 16/17: Move the NULL check before the loop.
- Link to v1: https://lore.kernel.org/linux-wireless/20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com/

---
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain
 
 .../bindings/net/wireless/qcom,qcn6432.yaml        | 149 +++++++
 drivers/net/wireless/ath/ath12k/Makefile           |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  54 ++-
 drivers/net/wireless/ath/ath12k/ahb.h              |  10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |   7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |   6 +
 drivers/net/wireless/ath/ath12k/core.c             |  10 +-
 drivers/net/wireless/ath/ath12k/core.h             |  24 ++
 drivers/net/wireless/ath/ath12k/dp.c               |  39 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   2 +-
 drivers/net/wireless/ath/ath12k/hif.h              |  30 ++
 drivers/net/wireless/ath/ath12k/hw.h               |   8 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c              | 111 +++---
 drivers/net/wireless/ath/ath12k/pci.h              |  21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             | 435 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |  24 ++
 drivers/net/wireless/ath/ath12k/qmi.c              |  83 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  45 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  85 ++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 143 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  22 +-
 25 files changed, 1214 insertions(+), 109 deletions(-)
---
base-commit: 2d57db8fbf72b1872e7411e917166bd12ed5bc98
change-id: 20261015-mpp-bringup-75f457bef8ee


