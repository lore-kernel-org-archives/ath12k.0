Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD53C44521
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0pzM8t+0K34DA6jm23GFZMiCFUkdlUGll+5K1avMuKw=; b=nN4mXKyJ6Ut/25
	eSK/5sjoGSjYPKHOXmhHTwkvpTBK3mfjqMCHVUsr0Rd0MHNpaE43+qEzeOX5Ea6uiL4IFqQicabrr
	mo4wEaahyBZK8JjU4zRw9KLRFESKAhgu+4kGfuRvamybtr9y8wSBJ4LsICoQ4Supgkit7SEHxE92W
	PGB5w4YvzR5WWp1NNmkgsJnv8p3R9I/GmJAqCfPO5ZcKI+2Dj81/kvo6KugyB4NODu78ixYwgbk0r
	OM0n9wZkrvuhvNNaIzuaDtGaIcWXLvfx9BNYpZJBwJuKUELjspLU3ZHG2WIU0XujLzVnQYajvg5Ca
	sV2y18+0v2vHaMS3EeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhiv-00000005zEO-038N;
	Mon, 20 Jul 2026 06:43:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhis-00000005zDK-1lUT
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RcmG1800270
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0pzM8t+0K34DA6jm23GFZM
	iCFUkdlUGll+5K1avMuKw=; b=f22TzUhFjc9J/1ykzJfvDyo5mOHxfk7moB8wb/
	SC/tTy7y9D8H3TlIweXQBm3Onbql8k8gkNbG4ImOeZOW5YfbcX7Y9cW7ad7EaTtX
	tbiQp+LhU7CXishWd61Kq2YU2m7buLFG53/hpgY7Vb/n/AGx0n7CxClzHZTCiX5V
	OTpf3cqCW6WMnPW8YA5wpuURWmlOXtbm2VTkJgrvchpZaE/g+k7k8ONyGAQgDSR8
	LCKE5sJEV1OEzVGMty3Wh2UHrOkdFsow/QSGnaQGvZWO3gQgmZ+3QY+Lo3xyGvM8
	cmsIsEdD2UkfHVSWgOvlahCWiemMz+g7O6egKyXaHhD/XuXg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6ct12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so9327726b3a.3
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529808; x=1785134608; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0pzM8t+0K34DA6jm23GFZMiCFUkdlUGll+5K1avMuKw=;
        b=bs8YAI0gdmifmaEEY68DFkVz7KK2PIy+P9NkZREAAg+WdsRcgGNutmQ4kRLEGdvAEj
         4lDDXEQ78iWn/jNL9oXT7fQ82FiaGCli7UvS87TiWNOOVXHLS498DOkwJh+poOyCVxOI
         QW/U/FL+EslMVHQ5i0ryKF3ZvTkELPfA0DzW1I74L9434DHMP6wBSEPUOA+XCHbQ8VDp
         zzwhfqLf3GcCx8v+123IOqSRrvZtMrS+NlIMfEo8MEpJrQSCNtiTZwoSHefaXYtT1eyA
         9WhGaOHGWvx0zoUZKdmbHiPv6S3npe5X/1Wm2CNYX1/tiraPkhf2qaTsFZxegs8sSKl1
         PLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529808; x=1785134608;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0pzM8t+0K34DA6jm23GFZMiCFUkdlUGll+5K1avMuKw=;
        b=WnoUuY55Vwup29aFrA2hXa8tTRb7Tz15RLTTQn4PFb6WHxkt89nMZYsY5TKS2GxJfj
         jhsrAE1BG6jkgYa3vs78337fNwqGrC6M9o7tZuU7L0tnfEtondGE5YZsWI96mgaXa6FK
         YU44TLr3v3qblgasgnvxfJsoJmOACfeTt67ewFVJWCAgnmAr1+9MYCATNWfEyvqiktAB
         Gdzam3lLkTtsPgEeY7AJLE5DBg7W72zIN5p3OR5OhS2BrQWB5bZSpSeHxHWWWd+JSovP
         W2bpg6IXGzqY2lNfqRtN5wzRhJgMcELZfsljPABgVLeehzktsggqodNKSyhtlWHx/dSP
         hR2g==
X-Forwarded-Encrypted: i=1; AHgh+RrbCE/neKlUicw3cRrkxofoBfKg4PDt2fsmYm1QaOgWG/Osr4qAa8gSQ5qyznRUAMHUuxyTY1w=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywey4PrbYoXlskFBbnWnDz72PFjT9uZINE8HnuJtmHXTDRe3MGb
	y94sUY/FGMxNfgu1pna5tHy4z5MxroXiLwGH9ukTQPRY5Dh0fnra5rIiRXC12q9lPTNHosTQjxL
	J0qGPNO354uZRnyRBtWZk1sJo1JBabS05IKvd2sPfQD6PwbBPNiWTRrRJI6H+4GAW
X-Gm-Gg: AfdE7ckk1ksI9qt6n0E/Bxq5YDaxEiq82a7lt13XSHu5Xz3bNO3VNyXdwrJbvcrPYdv
	aERshLyojhd9kAjx5jgmFF04MfNmtmKxnhu+ITcBd+ru683+A5XDZn2Hu7321UcOct31ua2zYK5
	HY2kbBfZdErW0iHLJxFR6+5lADFzNBR4TpOwoa/MiJhv3G/CQbdRD4WmiooAI811M7SYYjkB/F/
	PnEBBw/kDMAiETrxzndJsrDg3enXjbnnD8N7ArWCcnGASr389kvoZq5Gtr3Tg/T06+pXZWIR2/p
	e0i6EozL9C1eS1++s7+xjHtoT846bsunpSMHJDQMNLJLSeDPme9n6zfglXL43BfuqQECdY6wHRl
	kjJdjCpZM1ecxjRFTthyOQgNSuIWwWn90lZUJtBOHfYod2Qo85yWuzw==
X-Received: by 2002:a05:6a00:26d6:b0:84c:3900:95d4 with SMTP id d2e1a72fcca58-84c39009a0dmr6149817b3a.11.1784529808289;
        Sun, 19 Jul 2026 23:43:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:26d6:b0:84c:3900:95d4 with SMTP id d2e1a72fcca58-84c39009a0dmr6149805b3a.11.1784529807810;
        Sun, 19 Jul 2026 23:43:27 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:26 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-current v2 0/8] wifi: ath12k: support
 firmware-allocated MLD peer ID
Date: Mon, 20 Jul 2026 14:43:21 +0800
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInDXWoC/5XR207EIBAG4FfZcC0bGE7FK9/DeEHpYIk9rLRbN
 Zu+u7Qx2U206XpDMmH4/slwIQOmiAN5PFxIwikOse9yAQ8H4mvXvSKNVa4JMNBMgaFurDm80fB
 BXdP03o1Y0bahJ8SUWymUUunCcq5MIBk5JQzxcw14Jvkt9eeUsBvJS76s4zD26WsNn/ja8pNT7
 OVMnDJqjGRCFJVDlE/9MBzfz67xfdse87Gkr5rh4i6tYg4cd4pbLH9ry7wTXGfUzO6qkFWQxmv
 rhAYTNlTxP1VkFaX2pVeMC9iaVd6ofH+fMqtWGxaqCiDDG6q6UQF2VbWowTE00jBwdkPVV/We3
 9LLXlnQATig5OIPdZ7nb3iM6wvcAgAA
X-Change-ID: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: NeXmoE2WMaCSJn53_WUTCoCjqPwqhQXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfXxZEbyv6cLdjK
 kjSPfwo/VZJ+qH74tjziJKdQxLcLrO6sHQ7BwU79lJbOLKEh9+zZLChxCto0fEFLMCnjT0XPqVC
 doSlp5rTE4G085ucnmk8N/pfRlQiCRRy/FR1arPkMU9NVAGwGPRbZnHY5V17iIOfMEvKh1f8YUt
 pdZjnu0uCBZO3pEu2kgJKbWWM/AulIdezZIcEzOuh8qIp2NFQb0v5BKHfCxj0ldiw+Q/2zE+fEi
 bkdle0pSvxtKWTfMlGI75mAqk1xzsnDAneu0mHJpS3saTUwUJDieCY6Kg1VZ6C3a3Nqq2WnHs2d
 QCioV/C2Y4fjCrqTgwf6tQ9drAeVGl4F3EMwfGDuj60RqURSTPWPC+q8Ilfr3dlU/o+wgYqhsZl
 mQq3ZrzKY7BnOkCG6wyO/+FPpNbx3OJC0wHnlrCTxPWFQixG0Y0SEBgCWE7x2TeHTt7MSBSn5BT
 BJMldWkarhML6+1sLMw==
X-Proofpoint-ORIG-GUID: NeXmoE2WMaCSJn53_WUTCoCjqPwqhQXd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfXyT7rgdxDhSW/
 7Q0Xjda88vwWtFBfNNoAMBpEC93FAWU42h4rqWLdhcYzcpAAVYQigUR9jvgY6JpEXWiTPfIWfsO
 hFcvqC0+vSsmtf7gMNkkOjsunPwjAHQ=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5dc391 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Iq4hiD-WU0-YEpfp37cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234330_583359_6D9C2472 
X-CRM114-Status: GOOD (  12.27  )
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
Changes in v2:
- patch 5/8: initialize ret before goto err handling in ath12k_mac_allocate()
- Link to v1: https://lore.kernel.org/r/20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com

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
 drivers/net/wireless/ath/ath12k/mac.c      | 165 ++++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
 drivers/net/wireless/ath/ath12k/peer.h     |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
 11 files changed, 293 insertions(+), 61 deletions(-)
---
base-commit: 951dc0a744e4dc8490935316d3b76e23990bde3c
change-id: 20260527-ath12k-fw-allocated-ml-peer-id-2b456891157f

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


