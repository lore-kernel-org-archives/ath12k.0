Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CB8C44506
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iXbx79m4mELfQ+yxJXteo5YQs+iJo6r0y6/Vp4M+W0c=; b=IDMWQUjT4193iX
	SM/uQNj0N/dnSBljl+hqxWtk5wyHaPjEzJStdepGx+UT0djT90WavNg1iBz7zso1hRVB2I7iyZVdq
	rLMRm7B4NTo4XdpBkjhoBG8Wx7g+y+nRtczOi6xR6c1OTr/RRu+STITbTNihgg5Dalt6W1fb+WzHj
	ecsDk+zPMOJuuz2Eo6xxx6T5hs34NbLv5VL2EbbiwJ13d6gqSizmDhazE1x4cWp87qCTIZHtCI/Cb
	CmA6bpjnGpTrPZ5a8Aj8gQwIYVbKUb4rYHTb/175ZA2rIC0HF4btrmQCbTutS7Qa4WA6IPtBvPfdr
	PWDCUUbZ9n0D7IAGMlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAd-00000008QnZ-16Yo;
	Mon, 13 Jul 2026 07:33:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAa-00000008QmT-374x
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O0MM674530
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iXbx79m4mELfQ+yxJXteo5
	YQs+iJo6r0y6/Vp4M+W0c=; b=TSW8i1I6ARfFGFi3Ft/bBA2C3HqZKa/w8xnFo+
	gtMKILCheg7Om+m1wv+ooDxCfgQNuyvw9erEowkYasPwAyKTMvoLK9Z0rRy0QOmh
	0bDyXNQHGhadH4hFPqhplI79nPIRoCKKgNMoyrxRSbezmvmR0m5H2vocEsBNoYqn
	toWylCbsge49JF2OT00l1nNv3ObVYN3OjP8rTIMN9vYxav5p2pAITNqcNrKO6LnD
	IQIRzm5mu2I47L9Mhadg+rWFQBmpt6bQ2yn0n4Cu5aRLIwAtrFVWQEdaC58xlbxs
	2YoK+/6hP+d8i+piMiNWwFWj/y9BapnyTUbPv45qIgrTLmIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgn0x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c8018f11fbso45386575ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928019; x=1784532819; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iXbx79m4mELfQ+yxJXteo5YQs+iJo6r0y6/Vp4M+W0c=;
        b=P9SC5YDkz80WlaIOrT7f+kWDRJ4cOobWetWHKuJLmE1dJfNT4MihbWopxEjnRVKI5h
         nHqi+xk9YWbdridVsAFlY5k+VozsYlkqTlePi68gJIp/hZJrR4N5+qraUSWHtHb8HrLZ
         5Jq6a1ZbyRNIkWF7Fss6CPxajmKW6SkJXsEcDCRrN+10q0H78oAM7rtxK7mT0cbVBBzX
         QpDmKahShSqhMsnkDlFO7ca2uXZZNX8cpDk3YEIhYdbLJrzHW5aeaJZFM1BOIcWyEOL4
         wbwf9Pqqlzx4SOZ2lKDPJRL48oB6k32e1DW0XYBZuBJASqA++8myFmy03dqFENsenYRc
         NP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928019; x=1784532819;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXbx79m4mELfQ+yxJXteo5YQs+iJo6r0y6/Vp4M+W0c=;
        b=iFP9BZtLs16oNbVWgGmkkrNITNMDRWHouqiMjrohw+/UPzs/3/hPZ/yXLc44p+RbHw
         VR8TaZdXcOAXsjHi78dKGQL258xXvt8r4i+LoTXlYAvFLWg3OZE0am6XjC7ncrF8AWNd
         W/Zulnca+fa88MeOryU3AW3whoxMgMnIXqdchMWSSphderxOtxfUREsI7aGyuYxt+MmH
         uPjUt0TrKEwEE1SbXksadND1B+1natiRhVMobxX+ZZoJt8anZn2MzSszPkJe+pwq35vg
         fuwzo0/W6R5DqaJO+dnw9s6ePac6u7s0Esihl4tyPq+5z0nsDnD0VQZX5VjPnWVMNfzv
         1/qw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7+t+UhPdXsvbZujEQXGbYzDsFTGw8T7ex49jP9mf9old0JfukGI1/ADJqiT0NllRnNSx9qbA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgugdVYRkMYdrRaPWHyTtYYiPjXdUtit9sYHKYZQqGvf6IrXWd
	Hsic/eeoECPe35LFiChlfy+q2cn4+nzrQL7iLG2fQEtT8MJx12E3wgjcQpBqqWsJHyiMbbYG+mG
	1yqqs4CvvZ6aqQmFFIlwnOQGXikkaY+aaE1EGe7g7igozrRy8phbd3Wb5wtLV5TQf
X-Gm-Gg: AfdE7cnEFQNipA8y/SceYvWUpuAqhWQdjg2ahUGXxbdb/8U0pM1XZsRNz6PoGoCZn1y
	mw10gFpm2vZfUEPYHku+pOumcKw/ujVc/8zbeGM2GKdFf0F7OREyccxhq64Wg8xinyQh0lWvkCV
	yA+jZ7VKDe+FV8kZKlOF7kx26huPYVAw8JTa/2qZBJP28Xd31nO0zu8l15Pz9gs3KWZgJy3R/Oh
	CEZmvbWOiUWo52D8vvcMcPW+2oQf7w4hQTXTFjEifqzGLUwMq8rz3uN/U9SPjGkYAcToiaRcs4/
	pv0B2DBdTqY/t15PrMZe+3xAkGoRyb3HYJ0hUTvJTkhBL+b2gl4syBLuP5vmEyq8k/d3pax01lQ
	70DiXjHMcTRHHDWhJBWq1+Ewgp97FH5wumLXZHHek8CNAqXlGNnyfwZC1zQyz7zIB
X-Received: by 2002:a17:902:d48f:b0:2ce:d34a:5963 with SMTP id d9443c01a7336-2ced34a5b80mr19507745ad.24.1783928018626;
        Mon, 13 Jul 2026 00:33:38 -0700 (PDT)
X-Received: by 2002:a17:902:d48f:b0:2ce:d34a:5963 with SMTP id d9443c01a7336-2ced34a5b80mr19507475ad.24.1783928017996;
        Mon, 13 Jul 2026 00:33:37 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:37 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-current 0/8] wifi: ath12k: support firmware-allocated
 MLD peer ID
Date: Mon, 13 Jul 2026 15:33:15 +0800
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALuUVGoC/5XQzWrDMAwH8FcpPs/Flr+SnvYeYwfHkRezJO7sN
 Nsoefe5YdAeFsIuAiHp9wddScYUMJPT4UoSziGHOJaGPx2I6+z4hjS0pSfAQDMFhtqp4/BO/Se
 1fR+dnbClQ0/PiKmsUmik0lXNuTKeFOSc0IevNeCFlFvqLinhOJHXMuxCnmL6XsNnvq785lR7O
 TOnjBojmRBVaxHlc8z5+HGxvYvDcCxlTZjhrmpW76pQVJDG6doKDcZvqOJ/qigqSu0apxgX0Gy
 o8kHl+x+QRa21Yb5tAQq8oaoHFWBXVTfVW4ZGGga23lD1XTVc7Kr69lfmtQcOKLn4Q12W5QeJc
 bQSjgIAAA==
X-Change-ID: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfXyYRv2/rysc90
 ZsyCFPf3d+Axcm21xwvvcz0kWHikEKgjnmv7H0TetsFAHY2GEEk54cP7C7ay5cIg08MkyWSaEFo
 9JxYc8AJfvFwQi51lzQREzj54/GPreI=
X-Proofpoint-ORIG-GUID: 7gES2xViE6phBe8idTlAQG9j_z44CzSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfXyehhw1mHMK1f
 qcLjNWjfcraxPOuHC/D087b1ALATmIiD9fKdrPhPbX4pqKxye7OYQysBEOsKOWS08mADZYpAFID
 /UWwr82pZW76gslpnnYyRLwiDvl7mcFZT9qsHtv3KwnG2LBjmlH3CZd44Qw0KYsSxTiSChDd2qm
 3Z4ypky0GSAMm24nerXo11YofB8PxYk0nWuLA89ffBbZ4UGP+JDJhyTzRK1sG49RZ769B3FTMY2
 uHi5XC2dot0pWOFHcD+N+Yno1IUxx/fQgY8wxzdR3dCbI7/nSDZtvRIOVunu1gJTlrvHR2AUcwu
 31FuSGWvBG9nAirQ7CwqdHEv/89dlXXLCDmEEfBnu+qhIP1saHeBzcfvE4Cxt5rlm2+mXq3vd9y
 Xx73ObI7v4rl8SP58PEIFmxi6Uot11OqbahbAL7A4UABFoWvnR0QGsVzxwrtyOxGtMmTXvwPTHX
 HNb4HbIkYs4taQinCRA==
X-Proofpoint-GUID: 7gES2xViE6phBe8idTlAQG9j_z44CzSX
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a5494d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Iq4hiD-WU0-YEpfp37cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003340_893931_F1120B51 
X-CRM114-Status: GOOD (  12.64  )
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


