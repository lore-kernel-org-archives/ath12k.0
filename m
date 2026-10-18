Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E87CCF2C9
	for <ath12k@archiver.kernel.org>; Sun, 18 Oct 2026 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=; b=4WuodFlo8fCZMh0rmP5w7+/TGY
	NznU48Rv4MX4+R6eiBfk6/46I+EmlKeFesVZnDe+LR2/VJ7vq0QPG/4se5T2DlGHsI+yzKkYV59cB
	ehjJqMx1mM0QOleQPijoDxWq+tCyIEClgyKN6+484J5AZ+Y0tzBs3NowuV+9uo5NtmH5jYs8DH3aN
	akx2e/agSn1o7u4QL+FBB03KdmB+sXtI65frdSFuHAFfkBiT8iAlFvZzuigmqnhiUklBhyMfhtf5v
	Axbnej1kNtqPQF5NGB+JfAWEseydkpQJZapcE2tilNs5ANx5LV3I7FuWWiVutHK4YRkCukJrE4Gly
	GTRnGdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQnb-00000005t0r-1YJz;
	Sun, 18 Oct 2026 13:19:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQnY-00000005t09-1gmG
	for ath12k@lists.infradead.org;
	Sun, 18 Oct 2026 13:19:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c423b145922so81502366b.3
        for <ath12k@lists.infradead.org>; Sun, 18 Oct 2026 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792329574; x=1792934374; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=;
        b=OGKh0IBRf7JojR3NmKfzttiJpaBzLQ7mrXbV1jq/G1yhE1HKCppfq3g4/B+S3IQrSy
         u2hIQVwR4DJLgBgpzfRgR+Gl4zevqS7iwv26j9C8d9ayAUKdCdLkXapB6blfdD/8LSot
         Q7SvlII0yxjW8DyMC6imkVjUC2PonaO+8JDt7SldC3qwfMShhjCdK+/jM/tPN6nYzE7u
         DqtRN/V7kHGdVNTJnFxI+XNmGINqCf2RKTbLj6sWwkFbfKVs7CO5m0FpOQ23XqMPkpum
         bEmABKbnxXBXoObnJTt7Sz/iOA+KJq8IhH4ghmdFdQSgYiYBpoAhn1owEt8kIGYh5HIK
         H4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329574; x=1792934374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmlLkQ6dpljXtahKxB7AlkZKnbyW86lxsHxYr9rqtM0=;
        b=11hid7Joe0Tsqe2lGfudgIaBFGitW0o/znjUXxHfaCtypn5VE1InPY5BFoxYUAQbV0
         hM+C5QHPIIUVJZdSJ5VoxE2gloVrcRRdjG36hDEiNdtCA1MOqAwNlR8ez4cScGhJf1my
         FwsTizathb+nBAokZ4rgVv9K35qRLYJxGQLSM5SIKcq4ZKhoeTslqs1BIbQfFefGiw1Y
         nXQSf9wk2yia6Zv9qKYXJfIkSz1aSeMHDk0j5kHUuD61CmSmlZhehbvmMWWrZ0DOhxf9
         bWkfs/8MlgXemFULcIwMrLXdqbBbboiQMYTxfAzFthNL36rUdtIDGmz1h0k50c+Nnqr7
         elxA==
X-Forwarded-Encrypted: i=1; AKwUvBwH1D9VU8RqYpCCdFWi8bWWRNzfXi6lFEsEarV/vCRgsH9g05RnLHuKMkLqUfF/SlNwZ754t7k=@lists.infradead.org
X-Gm-Message-State: AFq9FYLGKwxI/j7PGWR7haVuchb2bLGreab8vYStWfzEexn/XtH+H6Bu
	TAmyTWrveAtowg5jQ2pvANI4/QPqAjKu5vlot5RYSMInxK15ohUVImI3lm0IJAqALT7I8Ssaen/
	U04TQbplof2g=
X-Gm-Gg: AYBFou1NIzqWXKRSpMqPCgRF2Hz2usPUJhFCPLu1h3pb7DMFBbTVuWIlECV/a4L/Zox
	N91DZJI4+7lfJeWcrstgT3BamD3L6U2TxZ8xTaJVmxZn0EOUrJ77f50WRhLORydo/TIGu8YNYBR
	DB5aH6GKIVJSUps+9BtInUy1Ym3NYkOHL+GpIuV59lEdNEGvNtySV4jrCUZ1q5zqrOFVE3kbySn
	P0lczjsatSbB4XFcM5NFN8+YGONvUZG4VFDggRNk/EELXxymlinHVC8OVUE2/5tdwCxIvH/84kR
	iqJBbMXc4nZuX7y/MSsKYyNyADNoizm4eSVAIDoC5YVOFCA7R3HTYhWujo6St7WUtseZUj0sf7i
	8zX+RgZVIvZmoC3tUG1fJ+0cC19HALI4XPGweUoyVcDDTg4114iypSdw5qSY8B+5VMwGotQxzfv
	VXqk9ptranR6I0+WLtgFyxvKt1ckHTDDNIvndXvDKhjfXH39YQsKzV+RwbM82zhISN6BE9h2tCP
	pjkz8LJ1CeBpl2KfQK6Z9G6uw77jdkJ0NXkbdS96BaGwZ0lD/v/76s76WSQVCiOI9mh4d4Sp6WN
	wMoUA7oFkP4//NZStqF1zLwt+U9wJf53CLS+ez5OIOGBj7fERcNh55syECCHdtRQJpZEZKJH1PY
	hPIea6RrOPh9DvpGlDu4LMTM462QAP9o4LI3ud74tzykIxNfMFOFm34y/loPA7gnfLMr+ndrXEW
	Xom1Wplfx0rauxft0/ah0=
X-Received: by 2002:a17:907:d643:b0:c2e:7da8:f54f with SMTP id a640c23a62f3a-c419f80267amr348395066b.38.1792329574061;
        Sun, 18 Oct 2026 06:19:34 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm264093166b.27.2026.10.18.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:19:33 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: Tamizh Raja <tamizh.raja@oss.qualcomm.com>,
	jjohnson@kernel.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Zhi-Jun You <hujy652@gmail.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
Date: Sun, 18 Oct 2026 15:19:30 +0200
Message-ID: <20261018131930.1116724-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017074012.35602-1-jtornosm@redhat.com>
References: <20261017074012.35602-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_061936_463458_34F98FB7 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi José Ignacio,

On Sat, Oct 17, 2026 at 09:40 AM Jose Ignacio Tornos Martinez wrote:
> For ath11k, my series is smaller (4 patches, 7 review cycles) and has
> no external dependencies, so it may be simpler to land first. Julius
> already offered to rebase onto it in his cover letter [1] and move the
> ring check into his scheduling round.

Agreed.

One thing on patch 3, from reading the code:

> +		if (num_free == 0) {
> +			spin_unlock_bh(&tx_ring->wake_tx_lock);
> +			break;
> +		}

When this breaks, the frames stay in the txq and nothing restarts it
until mac80211 queues the next frame for that txq. A sender waiting for
ACKs then stalls until its retransmit timeout. With AQL I measured this
in v4: one download in three stalled, max RTT 347 ms. A restart from
ath11k_dp_tx_completion_handler() fixes it.

For patches 1-3:

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # IPQ8074 WLAN.HK.2.9.0.1-02146

Julius

