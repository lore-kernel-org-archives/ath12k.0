Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE5606D803
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fluPZQcB;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ommyusu+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0+WaOeK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Gz3p90Mwjj78yrY6+KCh5AMVvJlH+FYsm8LlGXSt+HQ=; b=fluPZQcBm+N/8ed3zupbrxcyFJ
	77muws/qK6onYnXNCylNF4qMg9SCXK5UdN7eE1vlrF2+0Sc9LiF1IPPHiHTZ+61CJ5yyosIhHtWAd
	AnCCRhmfNl+SP0JmVn0IrdJgHsEM5GC3vjh27Xg4HS7QErc/4cvbLaHULbY9e7PB9/ksiW43He9aR
	+corwRFn1ccxpsCoWZqmuNrUeOkQtj3Dx/Ldjfj530Qu4PoBkZKHd4dv+glLfgiTD+YePm+Lk27fM
	7kyTEmj2ZqWX9c6qt3aMNnuVwNSg6YyCY0kjpINcNqbkA35T2Vjby+Itbxv+IS58jdrRcMz2+hmZ4
	WeKYJVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWg-000000042rD-0g3q;
	Wed, 04 Nov 2026 01:10:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWc-000000042q8-2cVj
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RLT4222122
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gz3p90Mwjj78yrY6+KCh5A
	MVvJlH+FYsm8LlGXSt+HQ=; b=Ommyusu+wiTp5j+qkiyBYUq4/ImZOYRPss9mum
	5tO4Tx2M/7ahYNQ0MSphQ6fJQLpbvT9zC5xYSCcNYwTacbU7/VsXIAPDQzwKZmgL
	eKbCmRGWZUQJvba1NuuU946yZXw+Ja/3VU7Zz1AEelaqMLiXV5+woamJtbBiHLEj
	YexzEzh5ZCwG+5xOSCdOKfuOrlOwc5MijPJqnHCWLblZ70mLIdIwtwwypUS9gmYa
	b3kQHFUWI+RDzq5trr6883ilz4Cd8y5STRmmXqvPrOHu01yLAVkZYJEh6oJSy7gZ
	jPzo0As0we6LLCoEFDRenLlyXaxsEwEqzQ9WDkjyFBThGFpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubj22a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso43165eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754646; x=1794359446; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gz3p90Mwjj78yrY6+KCh5AMVvJlH+FYsm8LlGXSt+HQ=;
        b=e0+WaOeKKxS85KC+fo33xKPBQTsZ07yF/8+AgMn8NiajhZJkvsv8jQaPj3M+tOwkAj
         m8RDGFXhKfhT+/Hm2NfG4KSnbsuBhpW9JpHsz5OHznpnqU95ALNrf8B2abncCKkcML8t
         JNJyug9uSLCA+R0JAQ3/tdOfjepL+RhyHPpgdOyJuwklnAie62VP4OWiNs6ma0tiTgSg
         8i8jtDibyTX02VzZ5l6pXp98o7PiIz8fMIMgF9bYdKoLJfkyUNVUSIj/7lxCEItQ/Xzx
         v4vGmjgwwTVRBQWdQOfxon/x5LG8XDDQz5GB67NrZ27r1ZbKGC5FCiB7DGdvU+a95eXM
         ZsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754646; x=1794359446;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gz3p90Mwjj78yrY6+KCh5AMVvJlH+FYsm8LlGXSt+HQ=;
        b=SDdi+BDWXN3J2svVf2DqTSPg4nGXP+Og76ITaXNMT7x9S9GcUFaEgKoGZGpLXePp1i
         zwbWwv25RVpc0cdbTdt1hBY9DnlB3MIiP+8859Bar2BHpwVPMfTrnhKdwJZLmOilMOy4
         gA14JJXXenOavDP30krVG3rN28pB8hqITpo1RGNrNmoTZg5/qOTDuUbB3nR5apmjbmnV
         bXAFMees9HWDon9hqouhdTLw00DSwHkQQHH4oi9DURZimzeJpo6jVR89Yu71JD7dLPZB
         AW1X+TKRS7MW1nZ4OVecNPSjKbyXwMagMZ7d/d3a0l5SbqWNgAG99gE5g51CfyP2l29a
         cQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCpU6eaYYA17By8dyk9BfjW2rFJWGU8BiWzrUl+XrqNiu0COiO4IBgzCxcCfRvrB5N36GYaqE=@lists.infradead.org
X-Gm-Message-State: APuU4Z+6JsC/ODVdFf/UKs3Y/2DWAraxBTyq4BEzoSzIa8ZGoYDKb0++
	ZuPYDSHXGsejCRtqaisuNTTCCbXO4vES5DtmZlJfx5dJjQ/rv4bpVv2shPA01iS1ZKuJ4ngAjXa
	60G+xEfpOLTq2fL7ZDOL5OVCD1MyySe1pBhxbRpWF7zPF3N7aVaNVOGhYgq6MNdUa
X-Gm-Gg: AYBFou038pRUkOWW6OqwahmD5VZR6epFYPhwDzF3JVZTRcOsgFZ7pzmb26nprmHZ40V
	aATFV52de3UvGySJmx/NWuMakTrds8y3hy+DwFd6yZ0wwpAy7GGRxu7pGJcfnlBoPSiglbiidOD
	a5A8gw920sKfsylI6Qt+QLr059Fg8xWwn2V4gIwcwUKVFe9SM4AkzfLCWF3cAd0khDUIhAucuvM
	vr2C4oN2g1m6iqJ5EGlV+DnAxikpKVtYLt9XxSKABhuRI35Nm3b4KJ8HCCqzbRypTzQWkhhHVje
	g9ZPxZuzp5A/VluLfdgLKAZqjcdGSql3aieRAyr5301sERZ7XClVCAvcU7DDdWqpOL4bK3kA7dS
	s/+qGe1HwER396WGPn5UQG629oGZxaPxX6FBhK/ScU5vCsTjkw755sfPLNHqracO+TnWrB2/zTI
	XHubVvFLaB8v9eJtx1sRgNMcEFOV2PKIPzUmQR
X-Received: by 2002:a05:7301:2ab4:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-36ca26f863cmr1213440eec.13.1793754646202;
        Tue, 03 Nov 2026 17:10:46 -0800 (PST)
X-Received: by 2002:a05:7301:2ab4:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-36ca26f863cmr1213405eec.13.1793754645654;
        Tue, 03 Nov 2026 17:10:45 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:45 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Subject: [PATCH ath-next v3 00/13] wifi: ath12k: ng: add Wi-Fi 8 REO
 command support
Date: Tue, 03 Nov 2026 17:10:43 -0800
Message-Id: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOG6moC/32RTW4bMQyFr2LMugokUr9e5R5BF6SGjCeoPc5ob
 KQIfPfK0yBAiyAbAQT1vvdIvg9NlknasN+9D4tcpzbNp17gj91QD3R6FjONvR7AQrQF0Cwym3o
 cDXtznts6nZ4NKUBC5wk5DF14XkSntw36NNB6MCd5W4effzvtwi9S1zvz4+8ir5fuu34IzrTWQ
 3fd73zJGWqNJaAldJFy1OgSW87Rl4qSAmrFsnE+VVEFMNcMuUQumhmLklVbBEE5wZhBKIr7V9X
 75CIDR8acKyMUS86P3dIrC6Y+fInZ/qdKShwRYwpQQ6eC+ADgXEjVBoLsAzsb0l3F1MTU+Xic1
 v2OoGdyGLz0eBITKt4Txuqq9Ik0g1otJNvWDlNb5+X3dqOr25b03TmuzliTfMHQDQhGeZxbe3i
 90K+7+0N/NuoVPknOgvuSBJ0kWVB9BtZaviDdbrc/ES0wAEUCAAA=
X-Change-ID: 20260923-reo-cmd-b4-posting-af227314a3b5
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX6JsovfhW1D8t
 F/ZJq2NUbcjsWwXP3bRkm8c0z8OuQrXt1/zzrFKz73yakxs3zZdATx+CcSvuAWNa1BdJc3z9Vk6
 1TfuAOiHqekYR3l3IU73oSpy8OjnptE=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea8617 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=LivKf3GqjHCzdL6wAqQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: bjK_FaExroLFU9fy_qmzoKSUF77JNz4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX9sTj1sDWgcUL
 cnAqsOyT4aceot2o+4wg8Ym/uALaceqoawdTOPgTnzb7st3mSQDM+OO9QGXpA7gwqCAh/Kl4SvW
 YZCPFib9amO0AYKCnUmX2jg2qLBzJRR+rF/jjSVTwG49M6/jcH88fh7DnmToEqN3Xbl6XVRBCGf
 suDUl2o0eYSx2oAelJvBU8JMfa5iSsag2MFyLzyaXnHgJhxH6pAkzE3+/+/C9pNayMrWtstrmuO
 egpLPrXbl9KU6wLg1DQay9ejeUc9aWRjN6ITq5T+3yNUFLPWy9kYR7kF68WhAh2DRnqE8rBAfEZ
 BjMQskSmclkDjfkrRtcUF6ApwIQr0n0O0DfG796X0uk4JcC5t0X7ucxw5y9BtvBUxbzV1RiS5x3
 pjtUilyexCkvFKDkBWQsBzCr9of/dL0g//3gepfYB6g3wiUEiAWCTdUG6AbXA20jIez8iXljnc2
 JacEvGtjFn/jtKeTB+A==
X-Proofpoint-ORIG-GUID: bjK_FaExroLFU9fy_qmzoKSUF77JNz4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171050_791648_33167F78 
X-CRM114-Status: GOOD (  15.35  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the Wi-Fi 8 REO command handling needed by the QCN9625 datapath.
The series introduces the REO command and status descriptors, high
priority REO command ring support, common command context handling, REO
status processing, 1K queue statistics parsing, batched command sends,
REO queue descriptor helpers, qaddr cache clear support and RX TID REO
operation wiring.

The last patch fixes REO TID setup on Wi-Fi 8 global-peer-ID devices by
using the host-allocated dp_peer id instead of the invalid link peer id
when programming REO queue state.

The latest dependency postings found in local mail for this stack are:

Depends-on: [PATCH ath-next v4 00/12] wifi: ath12k: ng: refactor DP and HAL for multi-gen arch-ops
Message-ID: <20261103163435.2682252-1-praneesh.p@oss.qualcomm.com>
Depends-on: [PATCH ath-next v3 00/10] wifi: ath12k: ng: Add QCN9625 Wi-Fi 8 HAL register and descriptor definitions
Message-ID: <20261030120743.2687216-1-praneesh.p@oss.qualcomm.com>
Depends-on: [PATCH 0/4] wifi: ath12k: ng: Add SAM support for QCN9625
Message-ID: <20260921090656.1575082-1-aishwarya.r@oss.qualcomm.com>

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
Changes in v3:
- Update the cover letter dependency references to the latest versions
  found in local mail: multi-gen arch-ops v4 and QCN9625 HAL/register
  definitions v3.
- Clean up the global-peer-ID fix by keeping only the wiphy-locked
  dp_peer accessor needed by the series.
- Make the dp_peer accessor typed and local to ath12k, and drop the
  unused RCU accessor/export churn from the last patch.
- Link to v2: https://patch.msgid.link/20261021-reo-cmd-b4-posting-v2-0-e8e3f482bfc9@oss.qualcomm.com

Changes in v2:
- Use a lock-held helper for Wi-Fi 8 REO command queueing.
- Document all-or-nothing SRNG pointer rollback for batched REO commands.
- Use the shared Wi-Fi 8 REO queue-address LUT for qref updates.
- Link to v1: https://patch.msgid.link/20260923-reo-cmd-b4-posting-v1-0-74935135a2de@oss.qualcomm.com

To: Jeff Johnson <jjohnson@kernel.org>
To: Ripan Deuri <quic_rdeuri@quicinc.com>
To: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

---
Pradeep Kumar Chitrapu (13):
      wifi: ath12k: ng: add REO command and status support
      wifi: ath12k: ng: add high-priority REO command ring
      wifi: ath12k: ng: allocate REO command context before submission
      wifi: ath12k: ng: refactor REO command framework for extensibility
      wifi: ath12k: ng: log successful RX TID queue updates
      wifi: ath12k: ng: parse 1K REO queue statistics
      wifi: ath12k: ng: process REO status ring
      wifi: ath12k: ng: add batched REO command sends
      wifi: ath12k: ng: add REO queue descriptor helpers
      wifi: ath12k: ng: add REO qaddr cache clear support
      wifi: ath12k: ng: add RX TID REO helpers
      wifi: ath12k: ng: wire RX TID REO operations
      wifi: ath12k: ng: use global dp peer id for REO TID setup

 drivers/net/wireless/ath/ath12k/core.h             |   2 +
 drivers/net/wireless/ath/ath12k/dp.c               |  10 +-
 drivers/net/wireless/ath/ath12k/dp.h               |  15 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |   6 +
 drivers/net/wireless/ath/ath12k/dp_peer.c          |  14 +
 drivers/net/wireless/ath/ath12k/dp_peer.h          |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            | 138 +++-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  20 +-
 drivers/net/wireless/ath/ath12k/hal.h              | 103 +++
 drivers/net/wireless/ath/ath12k/mac.c              |  15 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  63 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   4 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  94 +--
 drivers/net/wireless/ath/ath12k/wifi8/dp.c         |  28 +
 drivers/net/wireless/ath/ath12k/wifi8/dp.h         |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/dp_peer.c    |  16 +-
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c      | 643 +++++++++++++++-
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h      |  57 ++
 drivers/net/wireless/ath/ath12k/wifi8/hal.c        |  16 +-
 drivers/net/wireless/ath/ath12k/wifi8/hal.h        |   3 +
 drivers/net/wireless/ath/ath12k/wifi8/hal_desc.h   | 377 +++++++++-
 .../net/wireless/ath/ath12k/wifi8/hal_qcn9625.c    |   1 +
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.c     | 813 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/hal_rx.h     | 103 ++-
 drivers/net/wireless/ath/ath12k/wifi8/hal_tx.h     |   9 +
 drivers/net/wireless/ath/ath12k/wifi8/hw.c         |   1 +
 26 files changed, 2347 insertions(+), 209 deletions(-)
---
base-commit: a2fa01354eb39e673f3f09e6c1cec39f82f0f9ae
change-id: 20260923-reo-cmd-b4-posting-af227314a3b5
prerequisite-patch-id: 49882cc69530a316a86f617b0b8649c3e753fc39
prerequisite-patch-id: 6fe238c82896b9f8b39fa0f09e32fb72d82ea6e1
prerequisite-patch-id: f09a16b2b6b388cb3290a14d86f4fbe370929680
prerequisite-patch-id: f7fab6336752c5a6e2e45221157c05a2845b1057

Best regards,
--  
Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>


