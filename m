Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5089AC369C2
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HA4SvxXPkNjqmu/OEk8aILevxWwlvc4QXZMbQvkR/A=; b=VXzgP6WlFZbe1vj4PRjzHyyRvs
	CW9BpbDeCkDT78Q/GvOkyc/Ur7VqaEiL4vOftEmJY5PYeZ5hwDvrH7p0Pr6hfMB3ZjVZqL2rjQHau
	iv9QbHxJb4zOabTYrPCQl8QuAGi9G/irJtYTJEDaf3bKtQ7jsStrjXA1TwD4W5lXVvx6IxrdPybqw
	4PkjDGRHRaN7qVPyyqNGgeSiziIEEe/gOcT1M4XVffYpfiF1xDnTDT30+YS4fPdT++bzLsLvZD3W2
	0Sjtb8taP+wz0o6jroIfuvyU4cx/8h73mqfEFEEChsZF7zhg4dKCQ41SC+SEqfcBiO4MdDGc14pfl
	e8NX2rGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0H-00000003S3l-0CVM;
	Mon, 21 Apr 2025 02:35:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0E-00000003S38-35YN
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L0Ljxl015112
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0HA4SvxXPkNjqmu/OEk8aILevxWwlvc4QXZ
	MbQvkR/A=; b=omIdHyeHH5KjS0Uc+k3GJSf8KSlgYhpIhM9RVJDch/0l0a9cgOP
	dRRXdaZMzO8pNBYk5i8bBUlMhdwdVHDyheC5+dBCrq8WKo+WmkosuIAjF9EtRHQo
	RYAvx1srtWFbiZOu+rENT7pC3Jp/IRNoMZSmJ52MpJW7ZCJMwyXrHQ+0i3h0KUvY
	dr3ZXpq2tgXcEltvICpu9jLvrNRZITYaGX+xZ+E6TjsePms3tkioEjYQmRAZr4F3
	im1/QucmSyx2Tajua81Pp1IhQcaUG0/9wb+bcWzTgC7R/xa2D1l4+RK672ETUFCU
	geTh+iD6VbT8Ty203CYD3rCictk5opXXMMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450papmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2255ae39f8fso41321415ad.0
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202919; x=1745807719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HA4SvxXPkNjqmu/OEk8aILevxWwlvc4QXZMbQvkR/A=;
        b=kcc7WZleqBKVO2VuV/9T67E/GMI9f1oRh7ij5WMva3MogDzAtntO8vxg+N6VZIGGTx
         6OKWjuMBt23UQMmt6pPngy4aArapv3SjH2SBCIKKYOV2JGtLeWAhOJgC0K1l88FGWcX6
         mwcW9Fb6q/JLNJwi/uNk+lr8p+29GBNa9bQtzvju7ziWlXSC+sFIm+z3HHBvlxfnulz4
         mNcu17UWZQzjLUMl9Dm4GMCIPCwpb42wamUjHvIaaRmPwPzoeySRciUhOsdcEqq3mviy
         OQo0AEVTIGg4LqhMEmo63Vjam+JSS4PzrAXnEkRdMQv3/CpDF2l1ba92z6MBXWWR4TJC
         JV8A==
X-Gm-Message-State: AOJu0YzKzUxlL6VBAdCeJfnX8eLlFZjmT5sEBYiuhrppCj2ZLHAjShCp
	tXkCx/0JA8xp//2W0TIruAwHKQ0E1Q+e2QIJ9MCpk3ImVaMsuSLsOoYnt6n0x3ccsh3SjypIU/Z
	HYWoDo0ktTU05L0TrIhquWzgSEfcJf7xQUWGN9Bvf6nXk+udKeHU+u/LELGp5OUVD5zPY7/M=
X-Gm-Gg: ASbGncuKQU57/4JnUJCz/TulFklBV7K7/4fIQ/3kGDaBeaQ6EcAeX14ADw2x5YoYY+a
	3b9qsuGlVqMD7YsWhsqm/gwAhm8wKKfcXsotu6TXReaeOqFGc76Iedqbys0kwufvU7+6TKVCzQk
	HgOQn0disz2aC6110CMAzsVdllGqaqCcxjKJatzDpXmhHnCCiFTVHqYWDIRbXd4xYTNJYJGPz9T
	0UT5WgtkkW3sl6x4cCJHgfC952EDCh6VkeA+CsGmV/njn+9X1ZyEnhVUFTteQYAr545k4aY63DA
	PpnTiizdwXcZnd94+HYjw7B+kV+J9EGlImRintvRsBGoM6KvTkdchcPRbZvflPwIyn2OfOijwYf
	ktIGfxOLIu7M=
X-Received: by 2002:a17:903:1b24:b0:224:24d3:60fb with SMTP id d9443c01a7336-22c50bf10c4mr155615195ad.10.1745202919633;
        Sun, 20 Apr 2025 19:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJ47ziGF7GgPHar6q2l1sd/nPC+MWx2QEN7DD7xSH9OTOVnJrGD8wQxFmR6MPaxuMDlbZeA==
X-Received: by 2002:a17:903:1b24:b0:224:24d3:60fb with SMTP id d9443c01a7336-22c50bf10c4mr155614995ad.10.1745202919300;
        Sun, 20 Apr 2025 19:35:19 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:18 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 00/13] wifi: ath12k: add monitor mode support for WCN7850
Date: Mon, 21 Apr 2025 10:34:31 +0800
Message-Id: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6805aee8 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=cN5TtCRrlyR05RTW2EMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 1r7ornAGYZ2dK5vd-PbdbPpp8RLKKMKS
X-Proofpoint-ORIG-GUID: 1r7ornAGYZ2dK5vd-PbdbPpp8RLKKMKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193522_827862_F196BE9F 
X-CRM114-Status: GOOD (  10.42  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently, monitor mode is not support on WCN7850. Thus add ring
configuration, interrupt configuration and ring process function to
support it.

Kang Yang (13):
  wifi: ath12k: parse msdu_end tlv in
    ath12k_dp_mon_rx_parse_status_tlv()
  wifi: ath12k: avoid call ath12k_dp_mon_parse_rx_dest_tlv() for WCN7850
  wifi: ath12k: add srng config template for mon status ring
  wifi: ath12k: add ring config for monitor mode on WCN7850
  wifi: ath12k: add interrupt configuration for mon status ring
  wifi: ath12k: add monitor mode handler by monitor status ring
    interrupt
  wifi: ath12k: add support to reap and process monitor status ring
  wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
  wifi: ath12k: use ath12k_buffer_addr in
    ath12k_dp_rx_link_desc_return()
  wifi: ath12k: add support to reap and process mon dest ring
  wifi: ath12k: init monitor parameters for WCN7850
  wifi: ath12k: use different packet offset for WCN7850
  wifi: ath12k: enable monitor mode for WCN7850

 drivers/net/wireless/ath/ath12k/dp.c       |  28 +-
 drivers/net/wireless/ath/ath12k/dp.h       |  23 +
 drivers/net/wireless/ath/ath12k/dp_mon.c   | 816 +++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/dp_mon.h   |   3 +
 drivers/net/wireless/ath/ath12k/dp_rx.c    | 122 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.h    |  10 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c    |  38 +
 drivers/net/wireless/ath/ath12k/hal.c      |  38 +-
 drivers/net/wireless/ath/ath12k/hal.h      |   4 +
 drivers/net/wireless/ath/ath12k/hal_desc.h |   2 +-
 drivers/net/wireless/ath/ath12k/hal_rx.c   |  96 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.h   |  12 +-
 drivers/net/wireless/ath/ath12k/hw.c       |  12 +-
 drivers/net/wireless/ath/ath12k/hw.h       |   1 +
 drivers/net/wireless/ath/ath12k/pci.c      |   3 +-
 15 files changed, 1127 insertions(+), 81 deletions(-)


base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
-- 
2.34.1


