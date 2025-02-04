Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866F5C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CqvkxK+SNLJysbcVSZEZQEkaJodv4unEi5m5JjNLSLs=; b=tfCPJFS3FOnA2v
	SqmCqfUd09/h6nqeHgyVTnng8rEmUauMMbECUePFQDsXUVxN3WhcDQKntQpmdxONY92zkeQQfe8rj
	WCIE2PdhZJCb8vjY1LkmJ/D3iIjtsTlM5Lto+Q0F7+l5JvRnEfHA0xQ+IfwQLoy3nkq4sh7KZlX3R
	bhr0206GelppgU5pfsYySOVdhAYX5grPdpdhGZy2G2DSc/t76J8EsXG2kqV/IUJKcb7WpdAKC4tKr
	YvCblODlnsDAyHYPYic0hh5KCrwh8tbKSxtNLIAXHxG0bvKT6YmWYhkG70HYo3sED8TRW3XnfybH0
	XHYIH79M4EgSYW3i/zbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATi-0000000HDvr-1Jvy
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATf-0000000HDvP-2sLi
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141aO61003774
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CqvkxK+SNLJysbcVSZEZQE
	kaJodv4unEi5m5JjNLSLs=; b=Y8CfpeCHg0JTZWZaVv6jX/y9rbQq05oKNVuWuL
	6YWFB6zoYP1a4jkoyHpYpDgqgV1SAcZAUmL563EYb5E3lhSso7CceZy9ODh/zz51
	VnKZ6srXfHuQtVpI11G93e0Mq28zrhLLzsR83PeSuHIOiwP1jJbNbL+8ciYgiBeX
	e+ZJNbK8dj6ulzXraq8euvDXiBszUVIXxaqGOM/yCl8+7ptqbntf473uXYOeGl9u
	EqmzfA/03anfw00bttA6BDr9buOT9xYGNXEy11jWtIr57M0SdKZHcWDj/F0LLS5+
	MkITmqZ7F8DIcZk3O3jADaa2m1gyWRkBH4i5DaUamIVmlRMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k9cn08r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:23:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f9c1b95ed9so892596a91.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643038; x=1739247838;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqvkxK+SNLJysbcVSZEZQEkaJodv4unEi5m5JjNLSLs=;
        b=YCuSYmwMhNkgkSd+gbZtxniEkIAM+78q5EDzVMfJYBGgBioj3p89gv1UQf6nvbeQb8
         MhX5hi2rAUG5rusWWU9LImOWa2wrdNhUcXJFZ+d5G0OyvkJhNhpff8Fyyc5m2NpF29Un
         GT1q7CmMufBI5Q7szbZhjrX9VICal2OoRcr8gnudNsdgmJNuDMc9BMp9AxK8CLeQYTFm
         9Qok/yCTlu2lYFIlDRleH7r9styiqbHyuCWjbYP01+xSLNRIrZ0sIvsPWR03gFeNnYVD
         AjgLf0mBEMGimGC0b9Afkq/uwxxf/0vd7HRciSLmhNw22qyK/yA4fgf87fTv2dpqfYfs
         Mvyw==
X-Forwarded-Encrypted: i=1; AJvYcCW+nbihIcyQvHpthi8P7ZOmQoOLNW2vpKx4L6+VL103xhU3hR9JccKghU9ExwnjrYNeGt1rCJk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ALgynztMD6bBhZf9E9P74/LPAHSaEpXnhqeCbvwufCuY7zgA
	e/4KXO3M75bRfyC5Fuqx/5MxJWQX0Ak3oIlBXdIPPBfb47RHaZq4uIsfo9bT7N1oS7YYxmyeIJn
	RM82OrnX90plz8sI2Y+9drzo+TfcLRu9MfnV5C8hyBt+B2JGh+xfz4KPfgNMuOgowvl9+
X-Gm-Gg: ASbGncuE0PeF/xwZAudYT38brVxLq1XZ5YBcpW5ym7nqHOBdqQj4SgVsZHEyANYW/MU
	RqWX3Rgt7rNKq8WIj3oD2rlvZaNcUEaUjys49Waz8YAi7R+CgtskEbPExJ06DAL+c9NudlKwP7J
	MOp5Sf6fRwCiLlYy7awTWIuXLTM6WJFqPKZj3PvAKZg8cU/VRYz/8Y2c4+ZgnYkyQrW6sTc1m0k
	TlLfwEV7kDX+74u2aH3DUAiOYtsxXdHcCuzlCUXDHWxa+EJKZrFHXPKBN59QMqKSsEq6NfIuIxU
	7E3r1cmcVmibRekbG8N68Jh0ZBoIv3M8P4xF+aROOr1m83ggENZhDHrc/qCmS3fPNTLpx/56MpB
	wiJ0efooOhIjGpOXmkTZItRiDPE4SDw==
X-Received: by 2002:a05:6a21:692:b0:1e1:a0b6:9872 with SMTP id adf61e73a8af0-1ed7a4c9997mr38255261637.11.1738643037872;
        Mon, 03 Feb 2025 20:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8s6FjVpcitG1aB9paVinc5QFNVofAJU3AhuDdzFoQ/QdzJvX/aEBHqNo07SQpe9ZCeW3Z/w==
X-Received: by 2002:a05:6a21:692:b0:1e1:a0b6:9872 with SMTP id adf61e73a8af0-1ed7a4c9997mr38255240637.11.1738643037526;
        Mon, 03 Feb 2025 20:23:57 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:23:57 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH 0/8] wifi: ath12k: handle change_vif_links() callback
Date: Tue, 04 Feb 2025 09:53:40 +0530
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE2WoWcC/4XO3WrDMAwF4Fcpvl6KLcf56VXfY4zgKPJq1tirn
 YSOknefk1Ey2CA3giPEd/RgkYKlyE6HBws02Wi9S0G8HBhetHunzHYpM+CQCxA8G93Vuo9mHTp
 M1jQm+L5ZjnG4Z1IooWpUGgvJEvIZyNj7WvD69pMD3cbUM2zLi42DD1/rE5NYts8+sdc3iYxnb
 V1jaxRoEnhOOFqHR/Q9W/AJfoOwC0ICy7YDxI6UMvQXlE9QcQHlLigTaArDO6WNaQt99jEeb6O
 +JrDf1HxTgctdNU+qqjiQNGVFVfmPOs/zN2T8OB7gAQAA
X-Change-ID: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: G5cUtee4O8zZ2bDR5nDh7qP5oyxfy0M0
X-Proofpoint-ORIG-GUID: G5cUtee4O8zZ2bDR5nDh7qP5oyxfy0M0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202359_925747_E3F81508 
X-CRM114-Status: GOOD (  10.96  )
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

Currently, links in an interface are allocated during channel assignment
via assign_vif_chanctx(). Conversely, links are deleted during channel
unassignment via unassign_vif_chanctx(). However, deleting links during
channel unassignment does not comply with mac80211 link handling.
Therefore, this process should be managed within change_vif_links().

This series aims to add support to handle links in change_vif_links()
callback.

Patches 1-2 are making debug infra to work without device info.

Patches 3-8 are the ones changing the code to handle as mentioned above.

NOTE:
* A new ath12k-check warning comes which probably needs to be added to
ignore list

drivers/net/wireless/ath/ath12k/debug.c:69: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...

This is because, since device info is not known can not use netdev_ or dev_
dbg family. pr_debug() is an option but that will require DYNAMIC_DEBUG
and then ath12k needs to be probed with dyndbg=+p which we don't want in
ath. Hence, only option left is to use printk() directly.

---
Aditya Kumar Singh (8):
      wifi: ath12k: eliminate redundant debug mask check in ath12k_dbg()
      wifi: ath12k: introduce ath12k_generic_dbg()
      wifi: ath12k: remove redundant vif settings during link interface creation
      wifi: ath12k: remove redundant logic for initializing arvif
      wifi: ath12k: use arvif instead of link_conf in ath12k_mac_set_key()
      wifi: ath12k: relocate a few functions in mac.c
      wifi: ath12k: allocate new links in change_vif_links()
      wifi: ath12k: handle link removal in change_vif_links()

 drivers/net/wireless/ath/ath12k/debug.c |   6 +-
 drivers/net/wireless/ath/ath12k/debug.h |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c   | 288 +++++++++++++++++++-------------
 3 files changed, 182 insertions(+), 119 deletions(-)
---
base-commit: 48a62436540224f57013c27519dd2aa3ddd714c9
change-id: 20241210-unlink_link_arvif_from_chanctx-315159c5ac63


