Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF656CD5BD1
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tgTqJZZ4hdDQa1pyin7GcKIAoNcLVYXlrapflaewZA=; b=ZXVjTka7MxO5VUjiDgQgV3GBbU
	pNkDI32kc6GFVn9kZHWZU5C/awsej7ZA0GDYoG23CZMizZAGKvGKLas8TH/9yjkaPknjQ202MRpqF
	eORlGase5GhfANYg+0coArnPhSRenHGKO+bR5ocUDC0PMyD8SoaP0Y9CQddIlt3DBwzCMugDH+5v4
	6c2vbVp5btoUZzBwxRmVIstQZV/yTC/KhkLAScxETnK67cRDCCoj8DZin9r+rn5V/kRcjNXKu36xZ
	sWtSY/uWuZF3FvNQaq2A3HqTJLZuCVxSx5qhhKR6dRJsFJ2f4B7VkyhB9RPQV8PyNQoWoQEX7S3a0
	HE3rajCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60L-0000000BX6f-2gCE;
	Mon, 01 Jun 2026 17:00:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60I-0000000BX2M-0YTl
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FeZT23372584
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/tgTqJZZ4hdDQa1pyin7GcKIAoNcLVYXlrapflaewZA=; b=LM3IbbwMsbYqIP0o
	s9da7RLsz2jfXauf2H8xyVlRTHSFp/74Pk3ANxpMaad42T0KVl46G21j56LnUrMA
	6XXcbLjG8T98asxYc2P7gO4onkyw16J8JPSMLUMGAIjgleO7A6mDaM5K/uAQMHeT
	dcYMuyhimnfxCkdP/K4f+S7JwgoBRJz4ZfmrJJ9BKFYXaRgpGabIhitQ9ur9f9Jb
	x2Rq5W7OhquXoStwIxTo9NOM359uawCaLCC4Fvb8svSzRMaOXeVgBUQ31n+Y8zW/
	mxsP4LW0/BEtN7hOxe6oul/r91aNTKHlYi5al/kzHi6+u9ShDIbpFN0uKI+m1NDY
	yR/Vcg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh9vf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-135f2aa4742so7423178c88.1
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333241; x=1780938041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tgTqJZZ4hdDQa1pyin7GcKIAoNcLVYXlrapflaewZA=;
        b=RCfWy3igXCDSnk8xLeqy+6yjjMJlJKWhTQkwIDte722qr/TS5qvDJmlhC8ZBoQKMzS
         ZM/EQMDjo76O+s0k2wo/GIG1Pd62oCPw40Dwb1d9IWa59x1IkxzW6+58udxrxl7HvANQ
         MkdQJskaLJTCR6B6Q97wTWEM+QK+OTuUW9bDHgCwQsbMJYpkcq7wHaM50UK6E7gOemp5
         xZz2ATATsYI2x8dN62cko5Xym9FX4nUA2xBGuO98iDnP3GYQNCbPQrBzKUD3YLBK/LOP
         JCUI7oG4TgInbxj91OYwZTnjpL2XVVidUu2f8r5o/Bk5RQ5m1bpBBRZRuMFLIPOhlJEx
         leiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333241; x=1780938041;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/tgTqJZZ4hdDQa1pyin7GcKIAoNcLVYXlrapflaewZA=;
        b=Gnlw0aiyI6PoULkKpbTDR6KqdC1fEcqe4HbFCVy4jNEGivEiiNivW0sMbru2smo2NH
         3Rk0WZYjQ9nqBA+4MmX3/jtDzSsOwC4nwrYZJG5bbntRvGCkNquGvvfx+aekSqQfEaEb
         y1+6gYcbL5h208YSYgvpm2KfYmF68YKD1sI+fCyVBv8JffGRDldqF6/7fnCpiadVHgxY
         baDdJ0Z65qQhxs5eL2SqyY2iJc9nO7RSmxjRYLoN+V5s2IYD2VU5dIKqLCEE89Q2eqWV
         k/lPhNyB+ZtmXPvX10jtJRS2FnqUDfw8U074m6NILxiVI7oOrLrggPbEI2ceL+5fmdsZ
         LzMg==
X-Gm-Message-State: AOJu0Yy5kzxYwkOIr6VO3FEjkJySueLit1kuDLKlPLXU+nwMdEiiS0t8
	83DybfyrgcNBHkAZfl4Kf+ahDv9ugt8HjeT7/WwslAQnq5zBotOmtXt1+tObbVtoRtsIRTjyJTV
	mmP+wDF4L0Vi4Ih9qdegjl8RlnjB2fwrXyHcWl52tgdgtf+2QSYESrXLgHJXIJ0a41PFUtweV
X-Gm-Gg: Acq92OH9Y7GDmdj/dum0MnU76wMN59NTewgrM4y/hCtd61cFU/MHnWVhoWojh486vq8
	EiKHT08Ztt4xcolVS9Pe6mvI+EM/GWKIp6QdyFJ3YRG8Ul84PsV/yHi9AmEZJjZKPMmvdo3F5tH
	cLMUsS3mKeFKYUjqjmPPpTOxkj1SNqXF1BGXxX1mIejY0khnH7bFE/2pToxBLpvvdAyCf+z19wi
	kogr+EJK6BUNK+YMq74w3diXOozkBMVO3YbkK4IrDqbMnS/7Q8HxA/s07I9gfyz8P7hCGy7LIS1
	TcfDaCLZdbOOZN4TGcu4FruJ2zSwW0qcz9vwyhdN8xDYQWVLhzzMa6kEGtpwiTCJZQn47eOPb7z
	9nBpAiZU4VzQmLJYB+q+PtNYDoEwUlHugenTgvkshnKVx128+3tITmDYhfWE099LEmodPPBnogL
	M2VdJ9ebaULY4=
X-Received: by 2002:a05:7022:2215:b0:130:760b:77aa with SMTP id a92af1059eb24-137d42a82c0mr4882313c88.41.1780333238244;
        Mon, 01 Jun 2026 10:00:38 -0700 (PDT)
X-Received: by 2002:a05:7022:2215:b0:130:760b:77aa with SMTP id a92af1059eb24-137d42a82c0mr4882279c88.41.1780333237498;
        Mon, 01 Jun 2026 10:00:37 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:35 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
References: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix NULL deref when MLO
 link activation fails
Message-Id: <178033323580.2045173.13952603126118431049.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:35 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: _-atLeni-U7ohzMMdogFiRqj1UGR4FGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfX6+PdtYEOpV6r
 FNfrLFob1DEveYUw5bTs81JfdIv9QcjIYeAwf75V8Ys0Lg2uEzQWAyGbQUMIG/yI+B7qoP5ISCP
 fEyfeP+V2F8MT7vZBHPB8QCHBVQ3E9+FMvA1bTV71dAYKhr5XyFAX2J4zvpb48xEKHIJZ4TwTLR
 7KgIgxRo+JQmA3fYnyIiYpLKRwzm2eugtq4+neq/DK6ChZwZTsv2ks58veJZImYu510dfvoabbB
 goRd6uF2Nm8Bti4ZTdV40CwFgz1kMxYEuSiDstx6poAANfq3mFjDqv6Sd/bQuvd1n3xLYG8V3Jr
 /KpOYQISjdB4ez+fJcHrSj5M3epKgMgSx87pCLyxTKFy70DLRNFNn0KCPNpOCHjr18TtTw4QZW3
 EhgkLsJpe5UXsT1+ZbUWs0UKJXdawyXJWVwoTk9MnSxlrd4f8apdqcIMHz7c5KJLE1xeF4lxt2h
 2uUgdWv/TTOdUF8QbrQ==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1dbab9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=snLEJlJ34RS3NJav8DUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: _-atLeni-U7ohzMMdogFiRqj1UGR4FGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100042_191061_24B47FDB 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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


On Mon, 11 May 2026 21:49:03 -0700, Wei Zhang wrote:
> ath12k_mac_op_change_sta_links() adds a link to ahsta->links_map
> before verifying that the link's vdev is ready, allowing broken links
> to be processed by subsequent operations and causing NULL dereferences.
> 
> Patch 1 fixes three error path inconsistencies in ath12k_mac_vdev_create()
> that leave arvif state or vdev resources inconsistent: a direct return on
> wmi_vdev_create failure bypasses err: which clears arvif->ar; and both
> failure paths in err_peer_del skip the DP peer cleanup and vdev rollback.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
      commit: c972636efc63f0f43d725b59805dd1ae5bc4b31e
[2/2] wifi: ath12k: fix NULL deref in change_sta_links for unready link
      commit: 47809a7c8348bc4a332ccc26a37c7145a5f609f8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


