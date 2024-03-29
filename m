Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A765C6FD1F
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MxyLAQKLRPBHf7X1vQ8DGlS+2oCmN/Pbo3XLT9STCQ=; b=W+HRPl8zsXV3Bw/tBNJ1d+2gy5
	yX2Rr8FzvX2ci4sb/50ZxUXxOJzzVUKp/QhGcyXMOjcKJfKE1jCmcr6XJUj2bmEb2Sb3PZ5h/x1qZ
	9RA3HIngnLwvgdckABrT4Sv9v/ahITgH/45MpgjxBteVrUBHVCdLq2vzKhxNlehG/lKjX+UnCOwES
	HdikMhNU4XkMsWOX6caQqFZgiERRMBn4fahGOyQyUCd/vIUYrmc7/HV2JBcnJAAOBoxzjeaaB6IVP
	k5oIDLceejWyCS2tU9g7o26hQ1BLvgC3y2ZFo3c7QrnIDMseCLaE6/rgOTMsm0pyoAFhWzlqSkGrV
	4cB2/AAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqDFw-00000000uro-115h
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 14:30:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqDFt-00000000uoj-29I6
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 14:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4MxyLAQKLRPBHf7X1vQ8DGlS+2oCmN/Pbo3XLT9STCQ=;
	t=1711722648; x=1712932248; b=LS6pXnKepLpBHz6z8LurZvo42666125ivovaUJQujacGgss
	EXOhFNFeG0O8FFHWuGM0ujmCu/oNqy6HA7I/rFXgcWX9cITcG6dbyOTsDkkxX62jefbU5MWrCTVLA
	krf5HBDeDYCAstYIk15Z6RpGU/4teDZkXSon5RXEkGn3tOPveS9eNNo/0VsFLu0CTUa5avjMw6nS+
	7BFSzyB8N8IGpdcYvy3MRs2dAGnKj7irqwaFCUP8mvNOl5te2my+7/YOK4tthY0gvuksY5uee1+F+
	DA/YpIckX3BeQQZbjkNbHGDMvZL9SG1xlqIy9qtsWXtb3y7z/ny9Jmlpl4cx3Qhg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rqDFj-00000002j9b-35Wc;
	Fri, 29 Mar 2024 15:30:43 +0100
Message-ID: <ef6b6a7a4a9d3b01c0eb6abf0991e7e27425e102.camel@sipsolutions.net>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Karthikeyan
	Periyasamy <quic_periyasa@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 29 Mar 2024 15:30:42 +0100
In-Reply-To: <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
	 <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
	 <033185b0-f878-a50b-d0d9-57fa79439bdf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_073053_572519_64D61E7D 
X-CRM114-Status: GOOD (  13.61  )
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

On Fri, 2024-03-29 at 19:41 +0530, Vasanthakumar Thiagarajan wrote:
> >=20
> > > + * @hw_chans: list of the channels supported by every constituent un=
derlying
> > > + *	hardware. Drivers abstracting multiple discrete hardware (radio) =
under
> > > + *	one wiphy can advertise the list of channels supported by each ph=
ysical
> > > + *	hardware in this list. Underlying hardware specific channel list =
can be
> > > + *	used while describing interface combination for each of them.
> >=20
> > I'd expect there to be a limit on channels being within a single band o=
n
> > a single "hardware"?
> >=20
>=20
> There are ath12k hardware supporting multiple band which need to be=20
> registered under one mac80211_hw/wiphy. This design is to support such=
=20
> hardware.

Oh OK, that was something that I didn't have in mind any more, or never
knew or paid attention to.

> I agree, it is adding complexities. I was thinking if this can=20
> be done in steps , first limiting to single band for a single hardware=
=20
> then extending it with multiple bands later but that may bring in=20
> different set of challenges...

Probably not point, yeah.

johannes

