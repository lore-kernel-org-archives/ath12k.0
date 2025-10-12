Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C38CCD184
	for <ath12k@archiver.kernel.org>; Sun, 12 Oct 2025 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaQt7x72t3yoC/DixjUylo5c1dLbXf7xBbx4j39w4wI=; b=omDEn0EgRYg4YwK66ozqLNACMz
	1NeEtTvLaKnHQd30r8XLzS1rCEpzaQNVlfkJVEKDXAr/+8fTsi20Zaun9U24ZZT//klhz2bR3J/Lx
	Ik7YlPFxrjoEv7mqqHXqq2WZNZZYZDKVbwIFi48WUSE3Cebf+YvJjVa8eSPoxkkMhGceFnWwwtXSw
	og2wqOwO8N836utZHIK40Dcm3Dr5Ty3azssxK8jANpRpB/z6PQTMGeNWkoQr2BB4/NwDA10sK8QXO
	3nuvDEdGLQyXkPx+bQMaHdBFSaWhniXNbyqt1t10QnxqadWlUz9UPvuU8Vlm00yqatECVrJAyV9vY
	cWDcIxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wU6-0000000BNz8-2FON;
	Sun, 12 Oct 2025 13:51:38 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wU4-0000000BNyi-2dKh;
	Sun, 12 Oct 2025 13:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=DaQt7x72t3yoC/DixjUylo5c1dLbXf7xBbx4j39w4wI=;
	t=1760277096; x=1761486696; b=my3tu6/2eHv36imHFsW3bjFBojWOT0xTkF5X1CDAUti38t0
	ZRz6CHrKB8ZQEcAnwgiBEiGe0D/gK3qVtJ7DCBuUm8w+SdKoA0cITJ5S00ApTx6ynGEfN0atGBbe1
	vC47rAr0whxrKTEPVi6eWBDOIN91cPb6B+asTtSQ7JDEZBb4fDi0/uS1O1IM6Ie7UZfUcvDbWayjB
	N7voUbotENZtwXMQPJWcmKG//W8PCuf/CKTdA1i257KslJyptLE2FJGaSAdqHA0BG8dKDY/qk/60y
	lLK4Ja5ty/Z1ixdX5Mv3pK2CDs1VzNAdjPaUj+aPHU3+bjU5yZ6InT8yQodZ/qMg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v7wTx-00000008EV2-3t5R;
	Sun, 12 Oct 2025 15:51:30 +0200
Message-ID: <c618e0e8fdee9f7aa2628aefdf2dc04c48e6e9b7.camel@sipsolutions.net>
Subject: Re: [RFC][v1][Design] AP Architecture for Roaming with Wi-Fi 8
 Seamless Mobility Domain (SMD)
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Sathish <quic_asathish@quicinc.com>, ath12k@lists.infradead.org, 
	hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Sun, 12 Oct 2025 15:51:29 +0200
In-Reply-To: <fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com>
References: <fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_065136_690698_D4B5E2C2 
X-CRM114-Status: GOOD (  11.45  )
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

Hi,

Some quick feedback since I'm going on vacation for the next ~week ...

Would be nice btw to get feedback on the NPCA stuff I posted, now that
you can apparently talk about UHR ;-)

>         [2.3.2] Endpoints
>         -----------------
> 	To enable faster and more scalable SMD roaming, we propose placing the
> 	endpoint for Inter-AP (IAP) SMD messaging in kernel space, rather than
> 	relying on hostapd-managed messaging as used in FT roaming.

I _really_ think you should _not_ design it that way right now. To the
point where I think I'm going to just reject adding that to mac80211 at
this stage, unless a real need can be demonstrated.

> 	The motivation for this design is to reduce latency during ST Execution,
> 	especially under max client concurrency and high system load and avoidin=
g a
> 	direct impact on the data path transition.

That's not _really_ a good argument though - mac80211 will likely have
to process this in process context, likely acquire wiphy mutex, etc.

> 	DL/UL traffic transition latency to the target AP MLD depends on the IAP
> 	messages and the ST Execution Response arriving on time. Therefore, thes=
e
> 	actions should not have to wait for pending management frames to be hand=
led.

A good part of this argument - "pending management frames" - really goes
back to hostapd's architecture and single-threadedness, but really I
don't think "hostapd's current architecture implies more latency"
implies "we must put this into the kernel."

johannes

