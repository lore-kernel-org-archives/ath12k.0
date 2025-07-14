Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10EDC83F2C
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYe5JEQ/NJBdGO052CLNtnqKAn42FRtb4sm7urxF55s=; b=ejy1SwP4hdy2ofRLiMI+7Xf5fH
	no6SzkmKv8Hye4GVJGDeZcJEwwuqbBtwLL0oeAIWzofYYn3caSYHVnRdKMHx9jOVimJBmLqqlvBbM
	Fh2NK2YZWFQBk+fbsE0NJ9Q+QqcK+yDBlqeASkbVbcBPZuCQaLWV48i3fU/WhS4oAsmx/dcMePZxX
	Y9c4VNJOZEZdkzAVGes5/JM3ccjGBtM6kOaErEWGDpUXhQwejAOnzpf4Y4MDYHUZfUCZrS89VuGvN
	Zhtdn7aAY6L/6gQihGD+uGGj9Sp6pa0Yz6X1LJOY/1ZZQTnbR5F3mHzM1wdbrNtamsmeJXILFxLrD
	oYjYkK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnD-00000002ZUV-1ALc;
	Mon, 14 Jul 2025 15:08:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubK08-00000002RbL-1hGo
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 14:17:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7QfdB008136
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 14:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uYe5JEQ/NJBdGO052CLNtn
	qKAn42FRtb4sm7urxF55s=; b=bLYNq9MzOyM9dXurG4DhYAHNGDH1bJRR6TXm72
	BEFhSQQsLvNca2nzXu0l1OY06y/nS6AJz5wZyHRltNXGqRLM0bHNt+1yPT0HiFAb
	Yb1B0i3mf7R8Vt+BiizpO/7WaLhcCko1TSdqYMFP0fThmqNJQtlqBSAwM6wOmESr
	/LCniaT7GdG0RVhu9hRPx44sU5xFL/GHl59/Sc3ify+F42HDKiWM/ddwAALPEdfq
	2QhTH7R3c5hY7pwME5+qAZsBZsUEialXU3a1jMVeHJwC8fCNHVC0PKpKzX3Gv1Jp
	8winSY1KHLLlog7NtRRsLXPn+7Y2c/Xq9TALALu+5Iop2zSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vwghh7rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 14:17:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748fd21468cso3609079b3a.1
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 07:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502670; x=1753107470;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uYe5JEQ/NJBdGO052CLNtnqKAn42FRtb4sm7urxF55s=;
        b=rFXzEH/PTAsaSVYm74qxStdu5py6LPsuiI4EOzrhh2qh7KZKjYiMvLorcwK4J69UJj
         NY6AKKyrr2B2Qmdu4odoPbiZEbh+IP9e9UI4yS6jB5rJ2il9dFwupzqQPi0eAhBEQC+3
         h1kl6xBxgQiAHixzYeSFz3R6QJ/9H0XeLITUHJsUUKFksFCe1lmKyENJH8Z1W657ztoB
         iURYFFYEk/H5s8G2YtihJb7pKDrTZmnPcG2b1iq5Csib7aXdIBhPAvI8zIPa5utak7rw
         kmvr3+w2wA/rcRZcJQp8eEd8CweJhjfElIz5h45lUdtU6Q2eD213zxT2wAJR4xjc4KK6
         ft2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbZGhTw6XMKQ3ONbOnW73kzkT3IWb2BGLcm5K4B0XuTfS+kPTY0ad2AYVOvQ83z9iUQyS/TSg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi1IsqDJ5mdFfcxR61eIK9gCwMoPiHrsAbD5+zoX0qfOtI88gl
	gpTRSTbY5aOiMCChBnQgGjF79gsAbKFu2Sa0lBjRLFEULy2HNsC+kJB7XFjsNfNOE3X4FydYz5K
	uW9M0J9hDJ7THZsr+rd3wiz7qJeqXhM7/p3BeNXeYiTXoxXGLiGQRyOqZw8vLRo7h
X-Gm-Gg: ASbGncvmTA1n9KGkvECmsJ+jwuSpRP+kIgxI4tHkT+KBaKEguBoXfaxgCf7VQ8FeXJB
	Je5ZWMEf0dUangQkdL3ACbuoaVIoe570k7iPxHCDM1SO5gGtWNUoq09uLXlKKtkUvBWe81glmmk
	9TDA2bN7QBWdLB0YEbxZRU/Gi5j4HCrmUDihT9Q1h0YPcvo+8PzCnVS1OCBD47G/UBcj3o8Lx1o
	vnStZmAxOcdODfaNYdnLOgPyVO4w2X4nXOeVaRZQAJjpbm+hLaHMQM6oTuN1+/vkhi3DYMGXZqV
	iU/P1R4BmjdgNrWlGu8INm35Dm/st/SO0PBgNYZJsKNB1TVWeT0vJI6y97W1eRFXsBlhsigZj70
	c
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr14544865b3a.16.1752502669685;
        Mon, 14 Jul 2025 07:17:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgfKx6sUk0FX4r+rgTdQmHFsfNOtS1CTSqL+Sp9TUZPq6HVE3canvzPacPiUNgm7i7hhR8cQ==
X-Received: by 2002:a05:6a00:2d15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74f1ebccf03mr14544818b3a.16.1752502668996;
        Mon, 14 Jul 2025 07:17:48 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ebfd2d26asm8796236b3a.76.2025.07.14.07.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:17:48 -0700 (PDT)
Message-ID: <eb5bee18-e267-4fe8-9200-5a371a15539b@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 07:17:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250714
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbLIQOmC c=1 sm=1 tr=0 ts=6875118e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=Yt6yo0lQyOCnsUEz3GcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: JREYY6XdZgy5tmE3A2oxG__OBx2ON4pX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NCBTYWx0ZWRfX7EzSva6xNubc
 v/2PXqSdJySD/vzfUP0Lm+zdaiOXvE11J7RmDGnCCJtuI4WIAkCptgWJ+qejK50tfnTjK1HC1/4
 daQ25eLV1uEE40fjuh2kVQjzWy8CMuEA6F4V7GDc7q35PZzEu07sB36/T0cYwf/yCV5HY2p/QP1
 KJW/LgV91x8SZNP2bMFUVcZoRMfxnAjgfyxm1IyGm1tg/SGk46TP9kgOhDyeMJqeiazXlutD76w
 TnekhkDSAu4L/pZUUHz1Z3rJL0btfs5RLaIVpY+9X5MYgI7Ze5/fySCPcbk0dbIzhbqHVpdFdwq
 +3VSH6GMEjoMbP33BswmnblH0wPwEnh3EQJ1YwtD+9tXpE9tzvTkeOQtpDBKGf9+gSXo9EOPHdn
 6y6guCruBUCXLPyb4vpLzPWx3y56cVykPBUGx++9XPMR433vt9y1QkcFvANI3fjBR9OLUGHJ
X-Proofpoint-ORIG-GUID: JREYY6XdZgy5tmE3A2oxG__OBx2ON4pX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_071752_453431_73160835 
X-CRM114-Status: UNSURE (   7.87  )
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

The following changes since commit c07981af55d3ba3ec3be880cfe4a0cc10f1f7138:

  wifi: mac80211: add the virtual monitor after reconfig complete (2025-07-10 13:27:14 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250714

for you to fetch changes up to afcefc58fdfd687e3a9a9bef0be5846b96f710b7:

  wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled (2025-07-11 07:35:02 -0700)

----------------------------------------------------------------
ath.git update for v6.16-rc7

Fix an ath12k performance regression introduce in v6.16-rc1

----------------------------------------------------------------
Nithyanantham Paramasivam (1):
      wifi: ath12k: Fix packets received in WBM error ring with REO LUT enabled

 drivers/net/wireless/ath/ath12k/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

