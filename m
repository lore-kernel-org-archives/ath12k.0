Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D47606A325
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 06:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xIgMAh8D;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XvDU+IHn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKxHZr3l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LTgOBxclfc4OU1cpZIIkjEXj00n4/iKo/iTcmsLQabM=; b=xIgMAh8D78du2e+cBUY5XH5aoP
	uXSWT6iOQctFZV03VVykA91VroL7LxMV3oOq7UnQolP2i6egqMN8kgxKbR42ZSRjZ7J7A58NWlVN0
	276H74KRQMjmclfUWA3MAbgwR+naePGOf4fB2qqXVWAw7pIfkf6qamD9WTxa6WmJgqUTzoVobxAZS
	5A2Fux92rlF8JlmBsKhz9JOP1HDS4A/4rfCZ+q/xfGDEqLzT2aGWCPhlDEJYbMyTtIWe6An+Rw7L1
	SNsgZM/wghzP5i7k/Ty7Hv9oXaFgn+fJkvCDzMuk1VLp0Ob0T8kpQTVryxcCngC1dqLLr90QxKsk7
	9dj4dhzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfX7-00000002fic-1HGG;
	Tue, 10 Nov 2026 06:40:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfX5-00000002fhh-0Mus
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 06:40:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6Rn2275516
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LTgOBxclfc4OU1cpZIIkjE
	Xj00n4/iKo/iTcmsLQabM=; b=XvDU+IHnGxI49hGLmy3UByDLM834ClTs7oa6T6
	Ho4ZmSQLygcZYDUO+6xpS9zC9yBFaA/Br9bd0c92xyfhizqlQLT6MpHaLTD2aX5X
	XSWKcgrKwCMjRVoUs6Y5Ka35AhHDE2+n2O2+cfyRAO7IJ71BacxXz9bQwd/V1Gv1
	oFYd1EZzuIWtDguYfEaG7HO/SAVzzzemlOkZa4YXxNr3syf3ZIXrMLutICnowOUj
	8I1QIsR3VrxIvMj6PgxunEhTWw3mD9N6XrjL/9laypHBsREc+bTOUssFKpyLcUK8
	0e+bufct6kEvbYBFaKDDCMifGcbaIyRggzVU742oPREX49BQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bx0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Nov 2026 06:40:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09a466295so1436657a91.2
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 22:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794292837; x=1794897637; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LTgOBxclfc4OU1cpZIIkjEXj00n4/iKo/iTcmsLQabM=;
        b=eKxHZr3lDwiN5CT8aRvABMRP5ZiPzDp2ycRHpOPYFULf4Eta8viZCfb0eUrekxth7D
         kW+Z28/lMl8QxPeRFnVf3GmvDbcvUzOWsEzH3a2elwlNrHVMBmtAMC7X748whMRi4UtR
         QWvxiIHtfDVVjtRi0Yk5m/dmzSbq+Ye9KwKW8wnu3N5QR67o7tfo4IB1RvBfxzMJ9z+U
         z9zuPctl1EpT+J1KyhiKx6ZhNGCUpf0AKAcFnmQ5sFsG8jbcgIJi26Ogn/lqOkt6fKyg
         F7JcgS6RfSGU4bx+3u3ZH6TTOuFn3ue7IUcBdYgLbMcV4zKj+Snxl1QIMMe8F2eJCxsR
         7PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292837; x=1794897637;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LTgOBxclfc4OU1cpZIIkjEXj00n4/iKo/iTcmsLQabM=;
        b=2GeXlAVUtvFNaXdoJGHQv2M2e8WaPxHGTk3XdbTKrJFLUgZ5I9kNTIE/ueFm0RHvwt
         rL0JQ8ZrzibckqfeYdVnh+WGAW1eVb8S46tWe2tUJ81lwaKawAB2viPa3LU3ScaFgPj8
         /stkT4yFbDE6QYk0FZjUr/oqi+nJuuv9hpMbA5byP0KFGy6RTDqcH90jj5B7Hg+aJ6yd
         o3vQ8n9sa3917ZlyxiZLeroKyuQxhrg3YFqF/pxHG99tBpJGkvaRfU1HbINFcN+xmW4r
         erjeWBJ8LAYwsjhhzYNChOZPicxDowUouh3YvpUstWOlhteo5sMGjOaUmTALbPniLrTs
         d/1g==
X-Forwarded-Encrypted: i=1; AL+hErGXFf+MFOWWis5JL+zf5SJJEV0WHsBK6sBp2Q4lQl4tOY9EzNzNsb5ZrMTjP1hU4wGm8njIj2M=@lists.infradead.org
X-Gm-Message-State: APuU4Z8ja01qdq4tsg95ivysCamzdPs+v1ZB/zl/aHcFJvgAvdgU0qCS
	qU9huJvYjPv6Q4oBRgsSndeqERvcKu+nX0+y8TpBrxQFbVIX7OGrJNuMbzh1M+zIGXqksNa6vuU
	BdWx9dctxmwrZljMwRfqnxdT6AxAh8fBAdrdrNx4opTwzQex2mLd5bdDSfiuOEJP2
X-Gm-Gg: AYBFou31h/wF0pvvlssPecbWF7alPhxhVh1meWoO63+C5Kb6GAtvTasGkQbnSvRJT9E
	9Vsl4rzFdBmIqLZ5cnyt4GBVhOXxD6IQVhNh4BeUROAEXNYn3Vy5hhnAdEY97cCA3oNcD6/geeS
	b8iETSAXGgNpBFiAQJDxHQzVBSGjyg7xvHv5ISiIh9btI4kDitTSW7ILcgwemdXkLCvFtUjR+3f
	rN6gXI4+9rn3TsxvcGqL1gtXrQ71SKNA0HizwI4NI0IEW4L/EF8YbJVfChA6kbiAP7cOzM5KLgg
	6Qo2a3cdl8dlbOe43xUIznWLfVjNs1RpclKSJECLAbOGLwuUYz4WzaZhLG2qyj+ER7WAUhIP8eJ
	h92JZVO/t7RKp+WOjiAIPbnNC6qoXN7+XTZYwG6aX6JnUBWPXtUHrpOKujr2wHjLEim+x2FsnmL
	bqn9nPaLxMv3aT/UBJLwvtG4TWp03V8g==
X-Received: by 2002:a17:90a:e7d2:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b166cae9b6mr2064523a91.26.1794292836827;
        Mon, 09 Nov 2026 22:40:36 -0800 (PST)
X-Received: by 2002:a17:90a:e7d2:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b166cae9b6mr2064503a91.26.1794292836276;
        Mon, 09 Nov 2026 22:40:36 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16790ff7esm2561355a91.9.2026.11.09.22.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:40:35 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v5 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
Date: Tue, 10 Nov 2026 14:40:21 +0800
Message-Id: <20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFa88moC/3XNwW7DIAwG4FepOI8KGxpgp71HtQMQp0FNwxbSq
 FOVdx/isF7GxdIv+//8ZJmWSJm9H55soS3mmOYSTm8HFkY3X4jHvmSGAjuh0XC3joBXPqVLDG7
 iU5yv5YQ7GlAZMIjkWSl/LTTER4XPrHT4TI+VfZbNGPOalp/6cYO6r7gB1cI34II77+1p6Ah6q
 T9Szsfvu5tCut2OZVR5w5dmBTQ1LBoFSVaDdBBCQ5N/Gghhm5osWug6Et6YvvO2oamXBgKbmir
 aoII2Qge01v+j7fv+C+6fW/W3AQAA
X-Change-ID: 20260728-ath12k-logical-link-id-aef2481822eb
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Burke Cates <burke.cates@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: r4IBW_rPOnjafLtp24kZT7fZfCrQFakj
X-Proofpoint-GUID: r4IBW_rPOnjafLtp24kZT7fZfCrQFakj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfX8j9T8LNbJbXI
 RcS75RN/+V1v2YOg0QPfeDnDTaFBMqVYYBv6lLiBWcoZPYVZQ8VmSp7lTTO6vr8ykmgplFkA+53
 CwJJA82cWNOsWuHVu8S9uv36GRwyS9w=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2bc65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AaJ870xVPVGd3DHDvMsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyNiBTYWx0ZWRfXz/+OnVqnPuaj
 RATf4NPOnlppR0AetuStQokWEyq4d/nNeY0dZ10tIbBL272lKI6inpRtm4ppPHET0VClBXK8i21
 5xnb7+9eX9jtAqhl+U+ce+5u9WqdCwpltKbztR9InpC0611RgwHqritecRAnBKOIklAL1CMXA2L
 qWEeVmAaDAG8KIuklTJ2tm0wqyccHVDawy8TgneNQuJSNzSWaDj6SiPnK6BVco8D1I5jwPxjazC
 OXRnrvApTS2ifUl1xqneE4ZJs4VDoPL2TSN0KYaXakP6ZG7ISaNYz0UC6tXQpw3aX1VucsMw5wD
 Uxtw8YQ2W5CaW34ygHXUqB8n84tUgudzZKiP5peYB7ySye1Pn2Ea732/Naj87oAAu2XIamTAzMS
 SOIPgWjmO26RYSGJIkik3hkU9vNhCinMr13KmHQRQKFBaJngkwMTJN3LDUyqXSRUYh8QYbuHian
 ZFNgztxOiPc2k8r/6dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_224039_247871_0A0AFF9D 
X-CRM114-Status: GOOD (  13.22  )
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

ath12k currently relies on hardware link id to resolve the link peer. This
works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
logical link id instead. Commit a2fe9dc70f3b ("wifi: ath12k: Fix low MLO RX
throughput on WCN7850") tries to fix it using peer_id but actually that fix
doesn't work always. From user PoV, current code has datapath issues like
EAPOL frames getting dropped on QCC2072, and finally MLO connection failes.

Add support for logical link id based link peer resolution to fix it.

---
Changes in v5:
- rebased on ToT
- collect tags given.
- Link to v4: https://lore.kernel.org/r/20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com

---
Baochen Qiang (11):
      wifi: ath12k: fix potential OOB access due to unverified hardware link id
      wifi: ath12k: skip hw link id match for devices without hw link id support
      wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
      wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
      wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
      wifi: ath12k: derive device id without drv_link_id for single device group
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
      wifi: ath12k: allocate logical link id on host when firmware does not report it
      wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
      wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
      wifi: ath12k: use link_id_map to resolve RX link id for all devices

 drivers/net/wireless/ath/ath12k/core.c             |   1 +
 drivers/net/wireless/ath/ath12k/core.h             |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  18 +++
 drivers/net/wireless/ath/ath12k/dp.h               |   1 +
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |   3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c           |  17 +++
 drivers/net/wireless/ath/ath12k/dp_htt.h           |  15 ++
 drivers/net/wireless/ath/ath12k/dp_peer.c          | 170 +++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_peer.h          |  26 +++-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   8 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  16 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   6 +-
 drivers/net/wireless/ath/ath12k/hw.h               |  22 +--
 drivers/net/wireless/ath/ath12k/mac.c              |  53 ++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 112 +++++++-------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   1 -
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  17 ++-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   6 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  17 ++-
 drivers/net/wireless/ath/ath12k/wmi.h              |   1 +
 23 files changed, 403 insertions(+), 142 deletions(-)
---
base-commit: e3485cc885b81314c814a43db2255b1f9100928f
change-id: 20260728-ath12k-logical-link-id-aef2481822eb

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


