Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BCFD2F02F
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVtcWUcwsPJ2e6fDQcV0HjIMSTCFLqhjU6lVjT1R/oM=; b=UU8TvZ4U/piTyGMA56AqaVN17B
	xOO6TM5PGw827iN7/A768yYp1CY2+Tdu42vYtqDqBDWGzbN5YfkGzFvE5kKyygAm8k5WR8zvtRgbw
	KR33FpXCpf59BnzcHVPfCL3QTf85EeHmFsuTlktlG5gYtjDnlZTyLeajUuxbzGb/IItnRAZ45lKCj
	jNVR0g38MoeXzDw+fnj6z2wH8XrDGAXepMxsrlsNug1+vPed1k1g1DT8ophFlE+Pvf1qSnHZRcteh
	MRpwnZfOe+yFUIzL1yL9a5yJYxfmu8T6ncxDsB1NAX3FbjJ5JXDQ4Fr7bBpohexj2uFuSURLYvFFX
	+At1kehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjZe-0000000ELWy-0Kdm;
	Tue, 27 Jan 2026 13:57:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjZZ-0000000ELVB-3qKU;
	Tue, 27 Jan 2026 13:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=aVtcWUcwsPJ2e6fDQcV0HjIMSTCFLqhjU6lVjT1R/oM=;
	t=1769522257; x=1770731857; b=Dl4iBG8hwms4JEQ2TXWowi3DwRqpJAt4/LGN1es+EhcABQl
	rTnsrAgNY//dQ3VVJhXoa0ZNRrCahz1GXsuAXoQfWVwQpcW6jiyNRiavYGIw4+kNpg/zad7FD/n78
	baL6TRlEFFUv8LbN2fdJ8QIq4RYqZ+75iO2qX+BJOjWTO21JvwOt1PqpNwzTYAT5WrWB5jCKKmXXm
	od0mrP5uq83qSgjIV9Ls+sL6PhZKRk8INjkHttixO5zUqgYtVA8nNNnMofGB+9/1qyPkMtGFegG9S
	XAn+dubjse8ccjFSlHLcuXtV4jIX8xkYexSO1tVCe94lMz3DKyJTajy03kl9Gphg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vkjZT-0000000514I-2Id1;
	Tue, 27 Jan 2026 14:57:31 +0100
Message-ID: <9ea4b65c3fa5750ef57e93dd04b70cc4ec5df445.camel@sipsolutions.net>
Subject: Re: [DESIGN RFC v3] AP Architecture for Wi-Fi-8 Multi-AP
 Coordination (MAPC)
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhishek Rajkapur Suryawanshi <abhishek.suryawanshi@oss.qualcomm.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org,
 hostap@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 27 Jan 2026 14:57:30 +0100
In-Reply-To: <88f05d03-2742-4b61-964f-54beafdd2e70@oss.qualcomm.com> (sfid-20260122_094252_172709_97D85042)
References: <653a4207-38f8-408c-8067-c4960c11a71f@oss.qualcomm.com>
	 <05381371a41f154058429f0a1079204c4a454f45.camel@sipsolutions.net>
	 <59cec65b29ded381c85d1be943d88e956a4b7e74.camel@sipsolutions.net>
	 <63ff0362-4ee4-4f13-a212-dc1351eefe08@oss.qualcomm.com>
	 <52356be3d21920d84579d1a8fd803540c6f9644d.camel@sipsolutions.net>
	 <88f05d03-2742-4b61-964f-54beafdd2e70@oss.qualcomm.com>
	 (sfid-20260122_094252_172709_97D85042)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_055737_978285_DAF72A41 
X-CRM114-Status: GOOD (  12.94  )
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

On Thu, 2026-01-22 at 00:42 -0800, Abhishek Rajkapur Suryawanshi wrote:
> > Taking this specific example, it basically says "FW sends a request to
> > hostapd, hostapd does the handshake and installs the MAPC station. This
> > is how we think we should handle the MAPC stations."
>=20
> hostapd controls and manages all MAPC related discovery and MAPC peer=20
> creation part. No trigger from firmware for MAPC Discovery Phase.

Seems to me you're splitting hairs. Clearly you have the *negotiation*
trigger (NL80211_CMD_MAPC_NEGOTIATION_TRIGGER) prominently featured in
the diagrams etc. Sure, it maybe that doesn't explicitly trigger
*discovery*, but if hostapd doesn't already know about the station that
the FW/driver is requesting a negotiation with, it probably also has to
do discovery...

Anyway. I went to write a long email replying to some of your individual
points but deleted it again, I feel it's not worth your and my time.


Clearly, you have already decided on the architecture, and aren't
sharing all of it, based on reasons you aren't really sharing either.
Which is fine, I can't claim that we always share the full reasoning
behind architecture decisions.

We should all still make it transparent _how_ it's intended to work, but
that could also be just part of the documentation added to the kernel
when adding the necessary APIs.


Which then means that really in all the hundreds of lines of text you
just wanted to ask whether or not "Option-A" or "Option-B" for handling
the MAPC peers should be used, and I'd agree that duplicating APIs isn't
good, i.e. taking "Option-A". Note we did something similar for NAN
stations, even if they have different sets of attributes than regular AP
client stations or mesh peers etc.

johannes

