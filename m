Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF56CCF2C7
	for <ath12k@archiver.kernel.org>; Sat, 17 Oct 2026 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNk/jEhUnYIWFSc3J5De1EcVZmfoIjXCVyaScwDTK84=; b=HK4011f4t/IPmg+wK481/VydFF
	bYOSr9QyUHryHebWRYMvbVH+LHpCpekvqE53A67Kc0sfnkSizrovk/e2iE9xxlc3o6qQKMalOlZQz
	wsxGlJl9kj5+oO4+bROUN1iSVKmOOtCaRC6vxQHLzsDYlDHwRkquJB0JWP9SoU/1aVzUjA3clZF4Q
	iHqKRJJlcOH3nWV4e3rQ4hbbnx2H/jy7zaW1p0SlwxVNVBwCv/aCQMrZZ7aJfFj9tdFlQtM5tano7
	bdX/rvIaCk8pN0/90hDIP/WH9prD+sAGAduDQk3rtO3XMimBd0Gp6qFtYLfrsAJj18nxDN6e37RAp
	MMjoSLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0nD-00000004cUM-40Jy;
	Sat, 17 Oct 2026 09:33:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0n8-00000004cTb-3huz;
	Sat, 17 Oct 2026 09:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JNk/jEhUnYIWFSc3J5De1EcVZmfoIjXCVyaScwDTK84=;
	t=1792229606; x=1793439206; b=SMHB91riQ9TsGKeQPzlDppZPcL23AnZBuojJvwQOdUX2KnH
	cO2rQe3tYRhWwHeaQ0oNCszLEVxu57lv5UzT/XlH9uKrMN5dI9rgZPD+b0bhuTmqOBYVgI8S/nOVW
	hfEZeEjLEjAzO6Ch3QcTncRaJIfMGDD01qQB3mzA3OU1TxzhQHecFS9fYDPo/wz4/sZJRVFjmopfG
	eyO1jNwO6de8MkMBOm7QzYl8/AkCTtbCPhMHNqnbNTaksrAPaCsKFgcJZdkHgMPiJUlRVTgOXdkdv
	U8iiJZ14W71Cti59r2mRVTzbgdvGCvowFFRcl8D1rb+FAyhkdFBabwrtpT6nCswQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xI0n2-00000007nvr-3T1m;
	Sat, 17 Oct 2026 11:33:21 +0200
Message-ID: <1c8bd087a5cfd54fbe2825f2fa19a7851357ba86.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix MLO station firmware crash
 recovery
From: Johannes Berg <johannes@sipsolutions.net>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jose Ignacio Tornos
 Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 17 Oct 2026 11:33:20 +0200
In-Reply-To: <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
References: <20260804175004.1761075-1-jtornosm@redhat.com>
	 <20260804175004.1761075-2-jtornosm@redhat.com>
	 <aaf175a7-86e0-4da2-a3fc-df87d906f800@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_023327_212066_64E637A6 
X-CRM114-Status: GOOD (  21.04  )
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

On Thu, 2026-10-15 at 13:51 +0800, Baochen Qiang wrote:
> I don't think patches 1 and 2 are the right approach. Guarding every call=
back that can run
> during recovery with a RECOVERY/CRASH_FLUSH check doesn't scale, whatever=
 callback we
> forget today is the next crash report. Besides, such guards don't help th=
ose in-flight ops.

So I can relate to that, but ...

> The trouble is I can't see a clean driver-only fix. The driver knows the =
device is gone at
> crash-detect, but it has no way to tell mac80211 to hold off until it cal=
ls restart_hw().
> in_reconfig would do exactly what I want, but it's only raised inside res=
tart_hw(), which
> is far too late for a device like this - by the time it goes up we've alr=
eady taken the ops.

mac80211 has the same problem? How would *it* hold off rather than
annotating every callback from userspace, debugfs, ethtool, sysfs, and
the rest of the kernel with checks? *Maybe* at the boundary _to_ the
driver, but that's bigger than the boundary every individual driver
has...

> 1. Do the whole recovery inside the restart path, i.e. move the whole thi=
ng including
> state reset, power cycle and firmware reload into the driver's .start() r=
eached from
> ieee80211_reconfig(). Then it all runs with the wiphy lock held and in_re=
config already
> set, so the sync is free and no new API is needed. The downside is we'd b=
e holding rtnl
> for ~1.3s, which I don't think you'll like.

This is what iwlwifi does, but it doesn't take *nearly* as long. :)

There might be a chance to disentangle the RTNL from this given the work
I did recently on disentangling it from cfg80211, but then on recovery
*failure* we have a problem with cfg80211_shutdown_all_interfaces().

> 2. Let the driver raise the barrier early, right after crash is detected,=
 e.g. split
> ieee80211_restart_hw() into two parts behind separate APIs: the first sto=
ps queues and
> sets in_reconfig, the second just queues the restart work. That way ath12=
k can do the
> time-consuming part outside the rtnl lock while staying in sync with mac8=
0211. This would
> also need a few op entry points that don't currently check in_reconfig (t=
he scan entry,
> for one) to be filled in, otherwise raising it early doesn't actually fen=
ce those ops.
>=20
> Does either of these look right to you, or is there a direction I'm missi=
ng?

See above - I don't see how we'd really implement the latter reliably in
mac80211? Sure, we have a bunch of in_reconfig checks, but ... I
wouldn't really trust them and I'm not sure we can guarantee them given
the surface area.

johannes

