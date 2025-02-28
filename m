Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CADFC282D0
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9y/X4woGoV6thmMJzh3rYyjcSrpjUI+L7VLsGt3e5s=; b=hI5HFKeT0wgAz8ooLzs2uNiH87
	cGLmt6JFz+iguKeSSVS5Ga+6S9wHNB2z0itOkNbpGzvSjRmb2teUlSwHt9HpnJI8E127hSjCL4jRD
	kQldRlxqZA8WKzqKserGsAU1uEyNtcyWVv0UNKCQgKT023brXnUcUTuo0vIcubVxddkOvEn29es2X
	RZ3GGy6XPJKwJgVS3fYTo21rkHEG9J97zdm8O1kUipe3UldEhg2mSsYQuoIaBnu/xa/Nbm3y8K0pz
	41DAhHcD/KXM9xshOM9nGaSxbD9bpemfhYsMbd02HWwCkIO2Y07uE4FIQmxpNKRRroXsjTpp7rVaQ
	tLqewHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6de-0000000CUwO-43Z3
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 20:07:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Tc-0000000CRsE-0nl9
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 19:56:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXGdh011006
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9y/X4woGoV6thmMJzh3rYyjcSrpjUI+L7VLsGt3e5s=; b=Pqkq5q9zcXCCigNv
	BhtAgnQtUgCcDbYd0HidlT7gCkc9cPBe6Xhqypdv1Oyjw3wc5KsSRqoyQz0t/AF2
	WtbiipqzSf5bvVn889boBxc9+e/7+SwGzZHYEv1OpK28hzIicdDvE9PVOIDhTeNJ
	RPm+Um/lXECM6o1GC9AB+XPcZLRBJnNsa7SMiBfIOGAxaP6AIUUPhaE+QjIk2ShO
	0QdqOL20XukxwH5U/cjB7kiigiA+wUBg2Q/u6I8O+E3+zJt0wZrKcURDMwMWkX3V
	Z7lQRGt91DVeGyj5x+tkfQ1UeeS55BEG823FBGH7Vo4FzcwrTNd4CShFX5ECE29v
	HCBWqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkah99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22350e4b7baso45850075ad.3
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 11:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740772608; x=1741377408;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9y/X4woGoV6thmMJzh3rYyjcSrpjUI+L7VLsGt3e5s=;
        b=Lt+/ubXIAGIBICbZWwpqVcbrjdMcGjJLoQDIQDEisAPpSlsdcfXhMe2N9kwNB6nj2D
         4AXPGOiDnXYmfXJ94XXYbo2Ci96vMLvtOmk0h508TY8oDBl6ZYmfmkihtb48pQciBfRe
         rbktm/x1IaTX6APPjXiwF5Foa2B8aFQLxwBkxZba1o4q7z9TIjzKiPeCNM3jHBht5aZ/
         Exuxdk+dWaES+g8MTj4gZ2UxY4CV0rbpOPhICzgyNnfd0AGWJKzCrXXbK/JhACNnUO0f
         nX/0lgiSB1XIJxJ1s0fNDUUWdBLXQj72VknAxPJ9k/GINuaxbMulQjGhSut6oaft6vxn
         +Rww==
X-Gm-Message-State: AOJu0YyfQHa2+vjKV4p5z/SqQSbY2tQ5fiB4bqV21dOmzMhyP9Da16w1
	XyQ4RAdx8928iJvlbhEAuqZBZN1adp8oQS4GKJG7CYdNR7s7ZI0f1g0+Ssff72xjTufkX28hMbr
	SzI5RQlAXceI9NpMBbWsV5JqDA60nq/PKOj8xKJ63TJsG99YzH2naqB6As/Eqa3hONlLE
X-Gm-Gg: ASbGncv9SuE1Rv6Lh25qLwZ8Fl2kbtdoip32tp5LTynbe+FHBVVD1LHQdIoR/4V+0KK
	ckM2oRvZgZcofDo5BgRDWguDnhwIMuX7sopxWtSwjBnF8TBNqmdoulgAf9hSMpStcE4j9NNqjhz
	5J+vb8AiRpLweh64nE1vEpd2fFWKYPC/q4LJUC5N73BHhOjD+W2ISqsw2qcjEawYLh0YFVSMiRC
	afl/iZA2GLo6yPNoaiy0p/LFbaLq/EVNmNKlHZyIx4C51jSUBQlCliWwZ7hlC7TUgtStSYWiJA2
	GXR3m+7UQksl7YNS9LZv07DScbQt3MEZ3VafTrjPC/Ji+He8E24e
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr67121395ad.4.1740772608496;
        Fri, 28 Feb 2025 11:56:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4j10JGtHmNwKP72SX75j17DpyBXdLgOH+c6J+R8rMSYaNZsEjsrcf7abSJqj4W0twfzCrjg==
X-Received: by 2002:a17:903:244d:b0:215:9470:7e82 with SMTP id d9443c01a7336-22368f71b7amr67121175ad.4.1740772608147;
        Fri, 28 Feb 2025 11:56:48 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505336ecsm37140165ad.244.2025.02.28.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:56:47 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: linux-wireless@vger.kernel.org, Vinith Kumar R <quic_vinithku@quicinc.com>
In-Reply-To: <20241122173432.2064858-1-quic_tamizhr@quicinc.com>
References: <20241122173432.2064858-1-quic_tamizhr@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Report proper tx completion status to
 mac80211
Message-Id: <174077260737.4132177.15272767288760816552.b4-ty@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 11:56:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: bWFJmRMb7Zf2kiiLz3ITxcGpKJiElk1R
X-Proofpoint-ORIG-GUID: bWFJmRMb7Zf2kiiLz3ITxcGpKJiElk1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_06,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_115652_446533_76A81DE2 
X-CRM114-Status: GOOD (  10.89  )
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


On Fri, 22 Nov 2024 23:04:32 +0530, Tamizh Chelvam Raja wrote:
> Currently Tx completion for few exception packets are received from
> firmware and the tx status updated to mac80211. The tx status values of
> HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP and HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL
> are considered as tx failure and reported as tx failure to mac80211.
> But these failure status is due to internal firmware tx drop and these
> packets were not tried to transmit in the air.
> In case of mesh this invalid tx status report might trigger mpath broken
> issue due to increase in mpath fail average.
> So do not report these tx status as tx failure instead free the skb
> by calling ieee80211_free_txskb(), and that will be accounted as dropped
> frame.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Report proper tx completion status to mac80211
      commit: d2d9c9b8de725e1006d3aa3d18678a732f5d3584

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


