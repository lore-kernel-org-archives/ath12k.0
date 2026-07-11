Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E463C43458
	for <ath12k@archiver.kernel.org>; Sat, 11 Jul 2026 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9VA3RYDnEanCBIXzD9RQ338HU/KiXn5kJsmKUAiyXtg=; b=QIdKPxEeNI+me0pvl0MVc/C0ez
	Qm3h1s8HVO+LfmvrRUugQmttA2MBVVvf3oDqIpH6JzMV8l6+or97g6Kiwpq/Fr3RbnO1nuiRe8XqR
	b92KwRgJAx49oza/Fx+HtBvUm1x13BaypsmmtxyB4HTuwmBSy4w/dobAQP1PxXLIpTaYIlAAPY+50
	8uzhmyxo+iE+cgnMzOmRediHJDWRxQUIx4KlmSDxMf9pSuuRS+yKWdbC/QGzQCnxMHddWwCEIST1G
	EUm5phlnniDd87enJ5GfMOLKNOmiBZquPjTtzwdSy/0k3J6B+S+3Q+FwTM8dGG3oOk+lC655NNosg
	j2+e3Wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZfi-00000006elD-3PUS;
	Sat, 11 Jul 2026 15:31:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZff-00000006ekp-3RT6
	for ath12k@lists.infradead.org;
	Sat, 11 Jul 2026 15:31:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOPQ63871836
	for <ath12k@lists.infradead.org>; Sat, 11 Jul 2026 15:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9VA3RYDnEanCBIXzD9RQ33
	8HU/KiXn5kJsmKUAiyXtg=; b=bkIYzITz/SZk2s23M5FWnbefAFvi1huGYX1OTz
	OMj8YKnSkmkxV0kpuPrIKIHRvjXl79kE03qrKnN3jjIx1wLhRA2+TuROay4fRIt5
	GjsynZgqNrV5Eal4qzFW67sXgcrE5Y/g6Mg27Z9zVvre180/oSUY4GwPl16TCMAw
	J+vBE1oWdf6/q7RtYKIiYHLrerGTD3rjIxp9jcvoL0/S3X+i/dIVUHzl1qx0TpLV
	1Fq/o/lbkGO3cFOuxMQZ8ZqLALsdSzDNMtvNipbarwhlfhieZV3pYFV2IKw4C08Y
	Rz04Cd1FPmyG/BPgLuh81NiRjOLay+gGyg5p6srsFcw1/usQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gh08e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 11 Jul 2026 15:31:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so1783656a91.3
        for <ath12k@lists.infradead.org>; Sat, 11 Jul 2026 08:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783783874; x=1784388674; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9VA3RYDnEanCBIXzD9RQ338HU/KiXn5kJsmKUAiyXtg=;
        b=dNo1IQVv5+xdx/F2DcLYNQUqqzib7UyDRb9mxTFQgkZ0BpOQURD/UyQ2/Vju6cesgV
         MvuAOOXh+Q+K51uWERssLA62Bz3vQBDfkF4ykLe8NTcx2N6ZV4Xy2VgPDgoeyv8pp8rD
         s/69+t/3Ks2xarBeW5y2HlFOW6YbuC3uyN0Jl4wyQuVS/12M/j5ks4KrEWCrB/CUvBsV
         nklo1/yacgvxbnI7/kyhy2W/br92HqCHdRJMPXk4WgAUteAPud4AbKDk4pCPpyx3tZYG
         uUvEalPFHm/4DmaG8F3647b95RohIuu8nm8m3vqT7wBys4c5hcBJnajAT7pNfElR+KAk
         ZM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783783874; x=1784388674;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9VA3RYDnEanCBIXzD9RQ338HU/KiXn5kJsmKUAiyXtg=;
        b=nyqaKyMefI0wlF89tNuDqxpXUIzXllCXr1qh9opiMy0XHSXscP0L2cMYr6W2VNnVoT
         uJ5BaB34tjQh8V9XYtg1nk3uA7FznVJ1WRQN9F9G4+5pUFqWUZXljiGFj2BqbOCVRfPz
         2Kt98csnyoZEFFYAWPno9uFY0BohkiPowvNQKowiWlH4iiwu2mu25qj/EoLEWzHU+YiF
         DJCUi8Da2gwW8GTWj21T4DJnseSR6lrnin8/urcXxmWdhUhL+NdrEa+hGuop64km82Rs
         p4pGtujoO926pZUiHLioSVlosRMuvqJDNpFDv0Lif/tIrr+8FyJznxrExMdiANJpiTPW
         T1pQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9m7p+9QUMI1nxyRXYY8aec6iXp2C2mB00qwZZNAMTv5kJcBIbmZgyw6F/d3wPOT1hAsXWLoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGPmsjutMiPqVsYVdlcoEl043nt+2lVU7jVhXGnd2W9BYRCjVu
	CKJhgF3QpwTtowx4Tv0qHWrqeymaCXxqK4bWEO0WPis+HT+cYI0omSFanOQM842HhIxo8l4IpZd
	SfywRr5Y50W8AQf3PR56Yviyv2p4DS4+mKR8f1vwUk2lw7lgNkEMj3unJ6qIaTDYc
X-Gm-Gg: AfdE7cki5bkr1Ip/H9BCX2eX9CdAJ2diIFLKvkfhBKGaP9mX93Vo/Krl85U1QLd3sk0
	r1ag0IYfbZybFA+LHdEKGpb9nj5cdUGLhZhz+kV8WQ87t1xjAR1q//3Of29eRTFyTyqGXldW1GC
	lNoOBDbotlPJFhkeAuMoWWomF7uLSqaR3ITi3j2nS2PPgOU76vz75mXjJhmMyhnGMxB8z6/43Qd
	qgJTOug0/g7H9TkOE+BlrP4wC5/w6GatQTz4ZhaFxU+7yyDuz7OXEiWcUUXcuhWLvQ9UylDn30p
	yoie5V17NJM3Yskap0/k9zLK/dQeC+nnX3bM/NF6QovnhAvysN3t4uusUcniTcB8hZwwO3r9bVd
	+JpxCRI7J0Ab7CJOMDZGdDxdjJKAZ81cy1E5KLCAaHJ6GobjsHfSDA7sJnPGuR2hziQ==
X-Received: by 2002:a17:90b:3c85:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38dc7ba2ab1mr3720613a91.34.1783783874317;
        Sat, 11 Jul 2026 08:31:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3c85:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38dc7ba2ab1mr3720563a91.34.1783783873804;
        Sat, 11 Jul 2026 08:31:13 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm34111533eec.24.2026.07.11.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 08:31:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 08:31:10 -0700
Subject: [PATCH ath-next] wifi: ath12k: Fix ath12k_wifi7_mac_op_tx() style
 issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL1hUmoC/5WNQQqDMBREryJ/3UiiqWJXvUeREONXP9XEmtRax
 Ls3eINuBh7DzNvB40Lo4ZbssOBKnpyNIC4JmEHbHhm1kSHjWcFLnjMdBpE91Yc6KtWkjXKzChs
 bySIb0fZhYC1KbKuik2WVQTyaF+xoOyUPiHtmcQtQx2YgH9zyPe2rOPt/RKtggnHZXGVhuGlyf
 Xfep6+3Ho2bpjQG1Mdx/AAf6PuG5QAAAA==
X-Change-ID: 20260703-ath12k_wifi7_mac_op_tx-line-length-de4ed96f4792
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a5261c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oPDdWr2l-k5Rtjfzfx4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: DOX9hApklYDvB6tM3nkFByidg2bgzoy8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE1NSBTYWx0ZWRfX2mg0KQKOav2u
 QiiWgfNWGrwG/SdJ3L2yVUQIJ5+6C0wEzDYBti/EdsUkspxdaP8LTD2lPToSEEQByGfe6KP5Rne
 4cwehNhk/Neyp12txUDCTfOObK5zxlerL1Fk+q4NOcbkag98eLOc/h7GWDv1tpHQRnGCgNfWSnZ
 dlV/sMWN3y8d57XhjsZ3WuC3MEQxej2JVTsQQLadQQcIz3uH87kYsqlYE0qvire8khJbVLHo4Aw
 CulYE7JIF7srqjPm8LIjDAeDlOALEanvvrAdOrwdn/UVx46RcEkZCChgVXZvqlyYfaKfJ9Wumby
 61aZ7O5KIpKsk72obtwqir4OjkTT5rtp2PGRq54FR5Mhk3gd70cfWojo1NuKt6QEfmYX4a5m9Zf
 o1CNd54kKKpuarAZ0w9A/9EVOwM9qN0N1SyXmUo3xI13HF60Ne+siMM0LauaHIBvJ1sV/Vs97pI
 omQVe6OYGmfnNqinzAw==
X-Proofpoint-GUID: DOX9hApklYDvB6tM3nkFByidg2bgzoy8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE1NSBTYWx0ZWRfX27vy9ZARQTcB
 ZsCVUTno/K5ZevV+lyGX22X+IwaUQpXDqUWh30C/3pz/bHNFk0Wb0FFa3hoC+yudDnGjPUtbDaX
 jklIY9m0KjEjUTJ0JfhJjJa2irRWnM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_083115_867622_D4D48844 
X-CRM114-Status: GOOD (  13.81  )
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

Commit e47d6c9bb416 ("wifi: ath12k: Advertise multicast Ethernet
encapsulation offload support") introduced a few style issues.

ath12k-check reports:
drivers/net/wireless/ath/ath12k/wifi7/hw.c:1042: line length of 92 exceeds 90 columns

And automated review did not like one if/else that did not use braces
for a single statement that also included a block comment.

Fix these issues.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index e5bf9d218104..d54c2a6d83b2 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -1031,18 +1031,22 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw *hw,
 
 			if (cb_flags & ATH12K_SKB_HW_80211_ENCAP) {
 				/*
-				 * skb->data may be modified for the iova_mask devices.
-				 * It is better to use skb_copy() for such devices
-				 * to avoid any potential skb corruption related issues.
+				 * skb->data may be modified for the
+				 * iova_mask devices. It is better to
+				 * use skb_copy() for such devices to
+				 * avoid any potential skb corruption
+				 * related issues.
 				 */
-				if (tmp_dp->hw_params->iova_mask)
+				if (tmp_dp->hw_params->iova_mask) {
 					msdu_copied = skb_copy(skb, GFP_ATOMIC);
-				else
+				} else {
 					/*
-					 * ath12k_wifi7_dp_tx() should treat cloned HW-encap
-					 * Ethernet multicast frames as read-only.
+					 * ath12k_wifi7_dp_tx() should
+					 * treat cloned HW-encap Ethernet
+					 * multicast frames as read-only.
 					 */
 					msdu_copied = skb_clone(skb, GFP_ATOMIC);
+				}
 				if (!msdu_copied) {
 					ath12k_err(ar->ab,
 						   "skb copy/clone failure link_id 0x%X vdevid 0x%X\n",

---
base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
change-id: 20260703-ath12k_wifi7_mac_op_tx-line-length-de4ed96f4792


