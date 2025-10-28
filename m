Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4ACCF9E0
	for <ath12k@archiver.kernel.org>; Tue, 28 Oct 2025 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4LpyJwg/5ltHE3unTKLRRHwCp5ckUw2bZQgIpby6e0=; b=PAjZbKJi1X5dVj+yQAmR27kXG3
	fxps+7NfYPUTIHZYF+zsedNuEFBqb7JKOCibSPX76dMeqYF8inbrgJYo6XQve7l3QhNnnscL8qrm7
	lSAY9HImqK41DtMfb/egJpnZUfbcs+0rqpj4OEtsYIVBQizd7i3gIGSaAxwJ2NIfsiIBJXjEeGhA9
	ZaudHNUIMHw8GAHTFThcAwmqHwuM2asAiwtZsl8fmtwSrDpOx9IvaksVgP/6x8CU5PR4ujhImscG2
	APhEQfCZrx1NU2/VcqjPRgST7DBe0Zta8nHKmZeij1I3NerqE/KZ58bFhBPHV0CCBgyCA4oGwMN6C
	XFJQB6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbQA-0000000FCvH-1ctD;
	Tue, 28 Oct 2025 04:34:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbQ7-0000000FCuu-3ejC
	for ath12k@lists.infradead.org;
	Tue, 28 Oct 2025 04:34:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RJtq1n2546726
	for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 04:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M4LpyJwg/5ltHE3unTKLRRHwCp5ckUw2bZQ
	gIpby6e0=; b=Y6jb0McacJPIoU/W7EWtoUMRY7JiAHAjriccRNqMOlTz9lWVttL
	BLdl4a0Iyn8MdeLReD5uDxR1faASYJB4Don56X0jyohglYZfpfE4ucptKN4AjYnV
	/Vqrtq2P7ax5iY031lwEOItxPkSpA+TmE0onRHY1ugJF83MJ8ISNW+CSXsbYoPSs
	N9VM5pFg5vJnSoTPcSBZGtDjfsl6ZJqAvZUVa9vd1asq8DAs7gosL5mMTZbxSM82
	OS/eiOehu+xPTy95rjWHRG+N7bHzmfVHfKmHlcAepHb8eZbA+NLgkgHkb/MaWbmO
	8+L9So1ge6zNnSHcdeQ+95I+rQM029E5PnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2js4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Oct 2025 04:34:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so5119605a91.2
        for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 21:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761626092; x=1762230892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4LpyJwg/5ltHE3unTKLRRHwCp5ckUw2bZQgIpby6e0=;
        b=NsmAG+glFg6UXbXrPTK8KrGkFDuk4cYXlQbN3296/Nb2fiRhyCT9IlWxM+CBs5pBIR
         gDNVepW3pmaiq4fkBuW885l1uIVKkLKIHkJ1ZS0+I2dXKcqggx1B0S5oN2nen1EHEHec
         5t5kmzsAOqIeSvKh5qWw6Tjjztzfe5OvWCjzZCxCbx56NXHjo3kephZQ4fgGF+g3ogSe
         hMf6UG3H+QsXQJaup15nxtrhmpw8ZjoDLh9NgZhy1hkNeCwZMgA3KE5O6/k6l3hcnhIk
         U2iO9XNPTUunvGGeWfPgJb+3+PgkEHb1C2j4HoqvKvCv2wCsyYESBawoE/mXVA6S8Sfy
         6TLg==
X-Gm-Message-State: AOJu0Yzxz+wi59vpu/pe1nBt7zq4+Hr62KdL/3Vxlf1V6HS8l6jcoNtJ
	zlM5iGj2z3Ac6ckOD1keLEDPhJ2MOxjnyzw2xoAW04CYkyXcTIKSLUlBnSboJwQUoW+wQ2Y2idf
	5kgeG+ns9BHBalnCq9s4UyGxI5rzwpUFgq1pEcAgraL1TwxVObDFbQdtUNk2R5BWxNzRe3SFE
X-Gm-Gg: ASbGnctZvnfTEUCj0ZAwCBqFdLXbxaW7Pn/E5c2Wwjz3AHZCIfxlBE/bteaNCGr/dpp
	SSIjIphMLLTmwO1Dtm+x/aM7Nu85AF4bL8vC1h2K9pONiEFdKToldSK6cV/YEIZT8OiocrfQ6as
	IkXG77deVMAuKj9GwPhhZFL9o+JO/6KUo2mUojD6UKmod+YhtDimi3WZMm/F2jkS+cT7Mqhoa3E
	aPf+kI4kSwLjS0iugaJdjk/kIEgn33uH4m3feNrl72yk70FBWiocOJQrt/xxdac9xAOBb9WM9PO
	RFwKeNQdiZhqoPe79eGBEDhY5K8ESeVhBvrk8QEi6kgShYw6eq0y61UgoBCfuHTd/lN3W6Hju78
	1KtLaHYlWdMS4gVswcAsLmko3ZQFZqaMGKA/GT5zUYpoIs/IaAbpDradchWdFWGW0u3JtjjsyE9
	c3iwZV92rhnDd8n39LrsmoBA==
X-Received: by 2002:a17:90b:56cc:b0:332:6356:86b6 with SMTP id 98e67ed59e1d1-34027a04268mr2336688a91.9.1761626092327;
        Mon, 27 Oct 2025 21:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIhTEI69DQ6bryc46vnkxo3dp2xWAB7AIWv/c80+DCh1lgO2+1GRRV3V10olRbCWqcUSRyyw==
X-Received: by 2002:a17:90b:56cc:b0:332:6356:86b6 with SMTP id 98e67ed59e1d1-34027a04268mr2336660a91.9.1761626091873;
        Mon, 27 Oct 2025 21:34:51 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3402942f298sm529568a91.5.2025.10.27.21.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 21:34:51 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Thomas Wu <quic_wthomas@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH wireless-next] wifi: mac80211: Allow HT Action frame processing on 6 GHz when HE is supported
Date: Tue, 28 Oct 2025 10:04:42 +0530
Message-Id: <20251028043442.523647-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1uhQXyzB1iAF3tjD3mEjN8_gjqtAZq7v
X-Proofpoint-GUID: 1uhQXyzB1iAF3tjD3mEjN8_gjqtAZq7v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAzNyBTYWx0ZWRfX8vMM+h6nycN4
 y6zqXE1Z12yMj1OIrbN4oyDkGK1ohTlfPnUjMHLr87t3vyyafTUEObN730W/IjVZPNoPZyoa8NX
 Wyrd09/v6dUsspYNQRJj2UIHlJlBdPN+9g2J6qS+mkHg2L2xg90BF9MdsGjuonl8zBlbC9/wlfk
 qARP8uW3F218VXv2gS/9p/4cTpaSM323D6HGgkH2A3rv2/uXOv5zE9aRBQ4zb+vf8plmwj3u0g+
 dWTB45UWO/9Z6MUd4FUs76aTQ+BnKN/mUItVovjXWtP1jmHZ3PHSOR/30suNPScT7Qy7kUuDgTV
 LCh7R7pEC2httJoHrrF+j0l/6XI+currBYETAQiUqRkzVRy7zBE09PuHn7pM7ghv8IzTd4fhe3y
 bWmAzkrhiA824sPPaArl218+tf+7rQ==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=690047ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=TfuwYnTvkOvh0IDu4YEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_213456_057624_BF109A58 
X-CRM114-Status: GOOD (  13.47  )
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

From: Thomas Wu <quic_wthomas@quicinc.com>

Management frames on 6 GHz do not include HT Capabilities, causing HT
Action frames to be dropped in ieee80211_rx_h_action(). The current logic
checks only ht_cap.ht_supported, which fails for 6 GHz radios that support
only HE and EHT.

Update the condition to also allow HT Action frame processing when
he_cap.has_he is true. This enables support for HE dynamic SM power save
as defined in IEEE Std 802.11ax-2021, section 26.14.4.

Signed-off-by: Thomas Wu <quic_wthomas@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 net/mac80211/rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 4641a2a80856..d9553e8854b7 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3570,8 +3570,11 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 
 	switch (mgmt->u.action.category) {
 	case WLAN_CATEGORY_HT:
-		/* reject HT action frames from stations not supporting HT */
-		if (!rx->link_sta->pub->ht_cap.ht_supported)
+		/* reject HT action frames from stations not supporting HT
+		 * or not HE Capable
+		 */
+		if (!rx->link_sta->pub->ht_cap.ht_supported &&
+		    !rx->link_sta->pub->he_cap.has_he)
 			goto invalid;
 
 		if (sdata->vif.type != NL80211_IFTYPE_STATION &&

base-commit: 88de08348af8ce15dc563e0ebb5553eddd821c06
-- 
2.34.1


