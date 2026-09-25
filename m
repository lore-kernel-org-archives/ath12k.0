Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E242CC9830D
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 05:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFcoXXVSkx8CQQaBN5Ddz12CZaRAt4PFWTscMpo1XAg=; b=j/+VAlN02ppsXHHtRk3Tjs2z3y
	EgZb5Pt0sTrU09jWj+Vd/GzstyZaE+sCx8xVbz26tEB3K2222KFs4P7nQsyl+UiEqcXW8DKxXinNt
	VH2yue+x52U+caX2mFc6D8E+TbnU4gNj6ngvravcetb4yj/DiW0iyP6Kc5Wv9iwzfjdIQnnBZS/Qi
	fUdrqYba/FHPWxyvNu1Lbq/c617ijtQdJjQDCe8sMCKY3sEXwusNvcITY3FrF13XreaJt1UMMwErv
	3zMX16WUs61CRgWrzxjcbHF2sDOLDTgEn5fCgsL9me2YxMdGxZ1SDsUAIURp5L58i1Iq3RbSBerVM
	VzWD78pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yCx-0000000Cfml-2ge5;
	Fri, 25 Sep 2026 05:10:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yCu-0000000CfmE-2qzz
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 05:10:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ys9S3536012
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFcoXXVSkx8CQQaBN5Ddz12CZaRAt4PFWTs
	cMpo1XAg=; b=Ln/1ShJriqJLkH/9IPxrIaBZTZJq/1irE/dZQ5V+ewDCDTCaAbA
	p6I6GnSFrgncQXkuP58636qANipzXhdHzLkBtM08lYOXHzn9PpvEfeG4EbQo4UrG
	UU+w7wuGtxljMAqIcypge+OSYb6SHOeeqN2P4gqhm50gS38O4NZfC5JOCrwFPkGJ
	5vHiMaJxknNAoYdi2oXrWoPw8cc4Vj03ZfhscAIOmwEov7S4FPORDAexvjkpOoya
	9b6dO+T7vGZWlzmTDz7/WFomRAwNYQLhi0HAXHFVuLDSxKvhq54l9nDB61X9yRXT
	98ynBwsRZAlKrttC/OncjJPynoZqCFSQrRQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7uwr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 05:10:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438492fb40so806825c88.1
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 22:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790313046; x=1790917846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFcoXXVSkx8CQQaBN5Ddz12CZaRAt4PFWTscMpo1XAg=;
        b=aQs01SBM55IemUlKX9frQjuwlGiPbbu6IB7a0Nl4nd5iWLXSc8kABQM+hDoqUnPylT
         Lc6Nyiw0wbF1JVbLRvZX/knVZjAF5+z9UKqezxAtIpO/MPQhk77/Nz8ugT607n8ydpqb
         xOKWDQqF09yf52IX/vMSCZ+Qg4Jnl6UH9VD+/lX7BslibW2YaeIBFsX0R++3l0aSVi63
         KoyXuTWQBUPbZrD/vFf50RvYYNROOB9M4uLaIBmKFfMw0zZscCyuP1vngJ1pJA9uUwuL
         Nm8Fz5rgorE2JzmLZSRQ35h5RUq3rWwRJBrRAoUV4RtfNnRO+/uYxWaRPD40eu/CEaJG
         j0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790313046; x=1790917846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFcoXXVSkx8CQQaBN5Ddz12CZaRAt4PFWTscMpo1XAg=;
        b=rcIpWDobRWMqoEiAbinxZZPVokGDQyJAjuLQXuGe4VPXK2p64w7uZO90VJu4ZLG6rC
         w5dRGgHutPeGNCRFbC4/8HNy6wNLltofwTNMCsl5UuIqmYED9joGEF0v6vvUL7dWun91
         OKQLTmUceZnCu7n5QwNt2WGCCU/vIO6rluwrY0vPyBKr8YKgyEUj0wRBVdKzawr+zcDG
         VD35nSmBCoHWr1g/fbzQ9FGOf/ZqeZVoGGmEPxeEOgZD0yT0RaN6F175ALiASNDwBh2l
         /zlfOBHtt86rmTPgK7UmPgkkrxVyF4nn9heabJROfq9rueo36+ojIvgSOEBPPEkTKb0B
         WWxQ==
X-Gm-Message-State: AFuF++mgAIsbBCaOlsQmxbGj3miVwtnE6DKIz1PHS1scnR83FxBuOnb9
	g+4C2dBRMGwU+2ZegfDser/blr0JR6VLmxpnfJ+0LrP+kapDwAaBQK07tDkap769+M6P1LN7P/L
	0h7FY9GpqBDXrOgfBl214dU8QFYerXyBwO29TekZ3szwc3UCJq2Jn/98znLD/vlwRSoL+cxJN
X-Gm-Gg: AYBFou2RQ01iyoHwUqPpqarK9i0ZGA1Uyy5MIPP4SWrSoVtdYnr+UNeJUjiVXGGmBh4
	fxOjyVdtFYiSBmYZUXPKePhPbByRFzGwVGY+VUS3s5omkrImugSGBGu6FMb67Nm677wxrMdEKUF
	PaatSX1Y3vphwDt0WMOeWr4XVesiwMviT6NWmW4EG07C+3KZ34uwXVT6/Az7W/fkKMb2JZwVdAr
	FEDYyAMWUGPg9t5CVC1d4XJcd96iOEY0sukqmbhH3mjt8saPuBDvSk0ORtsbfTQ2WBkRisGjUyP
	ifxwDLj/dFQ9WZihVwcQGceLcHly3gEudbLZfVp/AgnAX0yKBlN0SO13X807U3XGxSaoIptTQUO
	W3sMs+Ac4XoyWeCsHc9BMWmEzIQRKiF52dx9NdH6BAdD3e48JKxWZstdEGSvEHY+LWCEyMw9381
	TUmvZauXv3PtGrMg==
X-Received: by 2002:a05:7022:b90b:b0:143:271a:308 with SMTP id a92af1059eb24-145040eaa94mr4239843c88.46.1790313045479;
        Thu, 24 Sep 2026 22:10:45 -0700 (PDT)
X-Received: by 2002:a05:7022:b90b:b0:143:271a:308 with SMTP id a92af1059eb24-145040eaa94mr4239819c88.46.1790313044741;
        Thu, 24 Sep 2026 22:10:44 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm2955163c88.5.2026.09.24.22.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:10:43 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: remove duplicated STA state from link peers
Date: Fri, 25 Sep 2026 10:40:34 +0530
Message-Id: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uJbRaXbjnusD1tdnkIrDe2xHimdi7PRv
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab60257 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=UqWUxUh_XSH1bq3hZJ4A:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMCBTYWx0ZWRfX/WEcvlCQ0zG/
 7/NAdbpL5dOUdBc16Xxx3F0sHUDnOsVrHz0H4HMfrYBPEdbiouWpuGtgo+86zS2Lq1SOoCnWhK9
 88mZAYka8nCAWzwvMdXPpmG0S1wRdSjBaV3Hzg3umTHwWUlQE3aR70DCcoMxuJSuXndJ6DSnv4A
 H3HtjLzp5E5nT/MaoQEPkbxDVHRoGVMXxEo/OvrB4FCxxE3xfJgtHUew/oY+nbGd4cLRSwCL/oN
 bMU5jywjXjx+KAJ3g74nxo+UpDRFuxtFt+hr0jzkNAd2GvC/Fe4MXxlVlIuCYxDz/nYv6U/3hrO
 eisuQU2s/wt3GxNfM9Zg8d+jrZgc8eneWjjOXQ3z6p4Mx61Z7iNfcL7QYnVJeKwqxS3TC7ivYja
 za21a838BZ+AAeBMsZJ/PoNZokioUGExB/PiTLfPDEiuGI6pxlSedXLXJJm5LakLuDFXefuqmKp
 W3zxSlWE+LDAnB30zhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMCBTYWx0ZWRfXyGlUSfkTzY4B
 n/0G+uo0USIh/EwjgGE0h9lMBs4dk5l6ggvUz68tzRshh3NfyRYNtxNPUh7ENmwQP2uOoCvbhtx
 OSMgsUZR0/0jMSP0LKEwA72r6Pc965c=
X-Proofpoint-ORIG-GUID: uJbRaXbjnusD1tdnkIrDe2xHimdi7PRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_221048_921517_79CADDED 
X-CRM114-Status: GOOD (  10.44  )
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

ath12k_dp_link_peer currently carries state that is not inherently
link-specific. Both the station pointer and authorization state are
shared across the links belonging to the same logical peer or station,
yet are stored separately in each link peer.

This series moves ownership of these fields to structures matching their
actual scope:

  * Store the station pointer only in ath12k_dp_peer.
  * Store authorization state only in ath12k_sta.

Doing so eliminates duplicated state, reduces bookkeeping required when
the state changes, and makes the ownership model clearer.

Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
updates users to retrieve it through ath12k_dp_peer.

Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
updates authorization handling accordingly.

---
Changes in v2:
- Rebased the changes
---
Aishwarya R (2):
  wifi: ath12k: store station pointer only in dp_peer
  wifi: ath12k: move is_authorized flag to ath12k_sta

 drivers/net/wireless/ath/ath12k/core.h        |  2 +
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
 drivers/net/wireless/ath/ath12k/peer.c        |  2 -
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
 9 files changed, 35 insertions(+), 83 deletions(-)

base-commit: 414f2b40f7b0244ea3ec1f7411d194a6d9c89c33
-- 
2.34.1


