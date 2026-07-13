Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4468C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXbx79m4mELfQ+yxJXteo5YQs+iJo6r0y6/Vp4M+W0c=; b=3cht6gYQRW/GEX
	cD231gLbGFSs0hUUiMkxiY0i5Ly0GAn9r1cVwwez1xocQLlig49LpfOZ2v/caGne9pMOUAiK42NWf
	szPtEcdVVvwDWi5kQshMMkuHYMsdRHlEQhfWnAp0bjNoWdpSnaNstI2AQTmIGHTux9y3fXzFflaZ5
	46nOdX95M39z6rzMJbUv6yOo84xo9OT8AcEM1c1Kc6FU1OIVDXAOTW92wFRu7ssfp5vEpMHEALp+Y
	LVZ52k9zp7Pdc7eBdzLiBwmFw9naJYjbrV7QZSaCGNpijP4G6MkLhAvgw3CZoiYIwGllDxK/eVFlZ
	FJwbQI7Y7qrUaq8Y1B6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7X-00000008PjE-24UV;
	Mon, 13 Jul 2026 07:30:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7V-00000008Piu-1QeD
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NcIK469173
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iXbx79m4mELfQ+yxJXteo5
	YQs+iJo6r0y6/Vp4M+W0c=; b=FsfGYZ7xGK7oMZpxs7qRBaagPlkjtitaAw4ztr
	kMZe+oTw5Af6YDtc9j88gfkdkOlQ5FWNSGE0HPbGbpx1kDDSMCw3tSY38njhUwqK
	34ooALuzyvjmYe/99JvwBGrCefgjdrxl93r8ceAfhg9QKoH/sv7LWzSrwctKp4c/
	+C9NhrDGs9ImK+xxyzvdWpn9V+R8n76p/2Ta9qFRRi78EEQVRVfvPd5jvkx1DBp8
	nBwWNtKooAkeDkWkKJWfGg2P7khXZQl46rZzonlb26/oEFt5d5Nb/TQZw5cEtCLD
	WENo6xny4xDvl9ZkpgRhf3UrCUJX69AKSwA7qkky0mT2er/A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf484xsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84865f326efso3093050b3a.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927828; x=1784532628; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iXbx79m4mELfQ+yxJXteo5YQs+iJo6r0y6/Vp4M+W0c=;
        b=Pc/LF31digFTL6k2SjkPsv3ZptlsnMYzQmULQRk2bNxovZaYTr8RJ0wH7gEYEwVUna
         ucEyniJ9yNH9QLFY/RWufCTsZF8ng8KUoCsPvLjSVsW1SE4rxWbD0ISoQL/4A1gt5ioo
         eLU1xkkcD+iIbk/1wzbZ1rynEFQ7UI13khJRG1XmJ+Ujg4pv3RgUyJrONOXiv9a8Nrac
         lctXUrsxQf3dDwyZFEN70n6dy86a+MZaFHGr3ftNgG+fZEqa9G01O1SlLCzV6vPb8bjJ
         rxAK92qztPKuBKdX1SqtQWwTqTCglZK0bGFxVwAxdpAxed24NO+l46SmIbqRSWLIVuHs
         Q5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927828; x=1784532628;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXbx79m4mELfQ+yxJXteo5YQs+iJo6r0y6/Vp4M+W0c=;
        b=hcO6ADWdn+JJLdTO5XDGQm7fjjocoIr//ec3rtFnwdv9lsvqGeOLjWHvFpp+BQZuHc
         aHM3OYexKQW43j8oFvPhOM4gC1kz/7Z4TLSk/17M9PJodVbfSzxsh0/s3mGz5bPJvV0F
         xPMT5lrgDPIGH19NWHTqgYJ2+bdoM6NApuSxxvJWnB71i7PAL7qOyqhBG8HXx2qpcEAa
         NcYtn61NSi+jZkbIpBSJu2DEh07TY36mD2wfi21JcyLUTDrxrr7jmsCGCMHfMOhRRkO/
         4tRqN2wM0gvvZOOPXUdPm7jRlsGZysTkMrickAoScw46WSntNh9+Jh9GGrEKtaMXgQ1H
         jYLw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4bed1tdDF3PaHl/9cRTBZsVFQO6TLLp9E6329oSk4jJUJyp2w9FbgoIajXJ+kqFX9xy3Ea+g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjiF/VogV9GMT6VFR73WJAd03dTfCjGBAhp8UqY29b/aXlaoiC
	4AWgieeCSqPYnayv0cf/VegonDfDP5clehYZTXjVjMxz4tmVPcXdkiPfaleTmqaZvLLk/CZEtLF
	K9qfFr7n/zxUsIi7MYQCzRGl1rQnO0s8dmUT/rJXgOk0Q77IQCI5QaBB+bLedVgWy
X-Gm-Gg: AfdE7cl5px2QkBiKnRo7waDVn7IQ2cSj72ZtQf7OZQTB9c9+E0qpv10Ersi7CgaRlBa
	szctDgx04vMPrMvUz56R6cFWIlu+fHJi7tkxEP0cr7XYtHWdG//Hk16Wke/6g2Absf9QmfgaWrv
	MpsDK0tyvQff85W0pMNCy6fo5gs3gPrd6AoVEevHtUue+L1kxeXoBIaOlGMysMYNKWI1lInzw9x
	k39J9yH9iw2O4KefMyiM49KbC0DpwLL11OudVFcJM9CBy6lJ2mnN29/FJQF+Dcr8q4f4sHQ0Qew
	AD+vlyFplK3XZ3owKEV0qz3TEIEOABCTN4QGW81vL/5l/UabfBtZ2rNdcnKg1UmJONJSXVzgA/p
	Sh5Fr+wcI9G5vpv2751HfEVQTK8LqkDFjfJ5P+EkZHSIfvdI2CC3sD2yRRjtIBTWp
X-Received: by 2002:a05:6a21:484:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c11077e771mr8139861637.27.1783927827797;
        Mon, 13 Jul 2026 00:30:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:484:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c11077e771mr8139829637.27.1783927827363;
        Mon, 13 Jul 2026 00:30:27 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:26 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-current v6 0/8] wifi: ath12k: support
 firmware-allocated MLD peer ID
Date: Mon, 13 Jul 2026 15:29:52 +0800
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGTVGoC/5XQzUrEMBDA8VdZcjZLMvlq9+R7iIc0ndhgt12Tb
 lWWvrtjEdyDpXgJDJn8/pAbK5gTFnY63FjGOZU0DjTYhwMLnR9ekKeWZgYCrDDguJ86Ca88vnP
 f92PwE7b83PMLYqZVDo02tqqlNC4yQi4ZY/pYA0+M3vJwzRmHiT3TZZfKNObPNT7LdeWnU+11Z
 skFd04LparWI+rHsZTj29X3YTyfj3SshRl+VSvqXRVIBe2Crb2y4OKGqv6nKlJR29AEI6SCZkP
 Vd6rc/wFNam2diG0LQPCGau5UgF3VfKvRC3TaCfD1H+qyLF/x1cOaOAIAAA==
X-Change-ID: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX8rmulTJ4Yvhi
 ZoIv9A360mmzRk77uCtwjPunXpn421J3NMpHO5YHMfpYK4eXw1Hvc1+TxVQ3ihL1OSMaIEus9yx
 UPX3QzxLTOhqEOwfvanj6jp+Ywu5hf8=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a549414 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Iq4hiD-WU0-YEpfp37cA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX4WqEN7VNzYKM
 lqqgmNB3aeY849jLKwYFP9lEG6UMbgjn1JlQIVXvn2LJhsrJ8keF+jV3KXuPF+jwcyISa5cyHCF
 G/tUX8V0SYZ5lZSXGToYZwRXFjxvVBSVgpozydqlj1nTF+f/fQkoRoIiFTuOeCGHigxWFGCpMAp
 N6u8E/FOuetZ4BCfd3l5U2yvoX4PXiFKrIo6Gat+RxQ32zAN59CShuF5Un6yx/2brgAWdIyOQNv
 qAn3X6MID32CLyjF9RmSnJtVTHljhjgDS3Mlzjz+vmsfKsaYBOt+SV+o08fPem3Jjiy/5vJxxAY
 ZSwxaCW+0+eBnaF7OMs1KqVro141hbeGSVwk6dtoYC1J+4oURHFZwABJ3wY0iLUx7TZp70VKnOX
 Lf3Ml2pK+/4J4H0pfBveyQF/D8Kd2AGaygJcReEiknt7ldHa/ifOxMTl9UP2fAdnsOUXBdwXETF
 y3VHe3oJZ6d2R4xpWEg==
X-Proofpoint-GUID: INH1hFFRjGZXIGDmyXfCv1Nb-l6kNO7V
X-Proofpoint-ORIG-GUID: INH1hFFRjGZXIGDmyXfCv1Nb-l6kNO7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003029_412195_FE1669F8 
X-CRM114-Status: GOOD (  12.49  )
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

ath12k currently assumes the host allocates the MLD peer ID and passes
it down to firmware via WMI_PEER_ASSOC_CMDID. This works on QCN9274
but breaks WCN7850/QCC2072, whose firmware always picks the ID itself
and reports it back through HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP. As a
result dp_hw->dp_peers[] is never populated for MLO peers and the data
path lookup fails. On QCC2072 the firmware additionally crashes on MLO
disconnect when ATH12K_WMI_FLAG_MLO_PEER_ID_VALID was set in the peer
assoc command.

Add a host_alloc_ml_id hw_param to branch behavior, defer the
dp_peers[] publish to the HTT event for firmware-allocated chips, and
propagate the firmware-assigned ID through the existing host
bookkeeping when it arrives.

Patch summary:

1: fix for an out-of-bounds clear_bit() in
     ath12k_mac_dp_peer_cleanup().
  2: group peer assoc send-and-wait into a helper
  3: refactor, keep ATH12K_PEER_ML_ID_VALID set in ahsta->ml_peer_id
     so later patches do not have to OR or mask it at every call site;
  4: parse the HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP message;
  5: introduce hw_param host_alloc_ml_id, set true on QCN9274 family
     and false on WCN7850/QCC2072;
  6: on host_alloc_ml_id == false, leave peer_id_valid unset and send
     ml_peer_id == 0 in WMI_PEER_ASSOC_CMDID;
  7: on host_alloc_ml_id == false, mark ahsta->ml_peer_id and
     dp_peer->peer_id as ATH12K_MLO_PEER_ID_PENDING and skip the
     dp_hw->dp_peers[] publish until the firmware reports the ID;
  8: in the MLO_RX_PEER_MAP handler, propagate the firmware-assigned
     ID into dp_peer->peer_id, every dp_link_peer in
     dp_peer->link_peers[], and ahsta->ml_peer_id, all under
     dp_hw->peer_lock.

---
Baochen Qiang (8):
      wifi: ath12k: fix out-of-bounds clear_bit in ath12k_mac_dp_peer_cleanup()
      wifi: ath12k: factor out peer assoc send-and-wait into a helper
      wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
      wifi: ath12k: introduce host_alloc_ml_id hardware parameter
      wifi: ath12k: do not advertise MLD peer ID for firmware-allocate devices
      wifi: ath12k: defer dp_peer registration when firmware allocates MLD peer ID
      wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event

 drivers/net/wireless/ath/ath12k/core.c     |   2 +
 drivers/net/wireless/ath/ath12k/core.h     |   3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c   |  49 +++++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h   |  12 +++
 drivers/net/wireless/ath/ath12k/dp_peer.c  |  75 +++++++++++--
 drivers/net/wireless/ath/ath12k/dp_peer.h  |   2 +
 drivers/net/wireless/ath/ath12k/hw.h       |   2 +
 drivers/net/wireless/ath/ath12k/mac.c      | 164 ++++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
 drivers/net/wireless/ath/ath12k/peer.h     |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
 11 files changed, 292 insertions(+), 61 deletions(-)
---
base-commit: 951dc0a744e4dc8490935316d3b76e23990bde3c
change-id: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


