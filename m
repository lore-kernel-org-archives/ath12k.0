Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F49C54E67
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EERVwLfnx9UxbLLME3eZTuSPk1hWRplKd/lN6v8KhsQ=; b=qIYbzg6XlGQtl1BLNkF/Vmnqky
	Ov5hJtbcdG/NWz6PeipmoD40YlLeqr/jbJAcWiEpaQv0vwTv3iJqbiW5aGwJGvnrB0nROneXyJ5BA
	cs7sDFW0xemylW5eDtfyZS6KoHMbFeuTTVCNE5QDShgdoSY08F5cT32Px4G+6J+NpvK3b2LrNLZyD
	6G5sUuhEoERkunFYf3A0HwaURgLAMKieTtODbwkYt4yTXY0mVc2TOmhWaiKcONxnh9iJjgsd0lYAl
	uLbEYPcAO8mnFRfVJlU3A7LYl2nbxjpidv/xBpPHRY8noWT1VFtERGHC67Zpx8GY+hUhJQEwX+ofZ
	m8Szx5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkTU-0000000Cw4I-227k
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:47:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkTR-0000000Cw3N-1ABr
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=EERVwLfnx9UxbLLME3eZTuSPk1hWRplKd/lN6v8KhsQ=;
	t=1711612015; x=1712821615; b=B0JLLXsDiVBqzCUgUoFvzrLmO9Uj0kNzPLt6F9NDR1IxTm+
	ph2t57e26R15QOpV0U/aUFjKEe1udByGXDn3hrkAdxaiUXEz7pBaf9oNoun2x/iBL1c8KgfXlc3Yc
	+lZwDMiRVpKGN8CNizTK1vAjZjAgsJZ7NwBelsggsGn2rfxKUFKNeX3OmIuDBjhWrTI4taPSfTSoP
	4467+J2Rgl2iUQHUa+W21LBVoY9hM/yqBNThWfpEvX/Hbws3PW6oFCjT2RD6rMZGt/kDXUDQFsRvp
	f1Q4oqn0TrmkZWCk7d06bCg92n7V5ieDllfPnHaGWjDZR72ffzpfjuo1xkVcORSA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpkTL-00000000koo-3yZ3;
	Thu, 28 Mar 2024 08:46:52 +0100
Message-ID: <e36599d3269496de59505b36be46f873976f8706.camel@sipsolutions.net>
Subject: Re: [PATCH 01/13] wifi: cfg80211: Add provision to advertise
 multiple radio in one wiphy
From: Johannes Berg <johannes@sipsolutions.net>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>
Date: Thu, 28 Mar 2024 08:46:50 +0100
In-Reply-To: <20240328072916.1164195-2-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_004657_344533_A23D9E85 
X-CRM114-Status: GOOD (  11.87  )
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

That's a big set, not sure I can review it all at once :)


> +struct ieee80211_chans_per_hw {
> +	u32 n_chans;
> +	struct ieee80211_channel chans[];

That should probably use __counted_by() these days.

> + * @hw_chans: list of the channels supported by every constituent underl=
ying
> + *	hardware. Drivers abstracting multiple discrete hardware (radio) unde=
r
> + *	one wiphy can advertise the list of channels supported by each physic=
al
> + *	hardware in this list. Underlying hardware specific channel list can =
be
> + *	used while describing interface combination for each of them.

I'd expect there to be a limit on channels being within a single band on
a single "hardware"?

> + * @num_hw: number of underlying hardware for which the channels list ar=
e

"number of [...] hardware" sounds odd to me, perhaps 'devices'?

> + *	advertised in @hw_chans, 0 if multi hardware is not support. Expect >=
2
> + *	if multi hardware is support.

>1, I guess, not >2 - and =3D=3D1 makes no sense really, maybe it should sa=
y
that?

> +static bool
> +cfg80211_hw_chans_in_supported_list(struct wiphy *wiphy,
> +				    const struct ieee80211_chans_per_hw *chans)
> +{
> +	enum nl80211_band band;
> +	struct ieee80211_supported_band *sband;
> +	int i, j;
> +
> +	for (i =3D 0; i < chans->n_chans; i++) {
> +		bool found =3D false;

So if there should be a limit on single band per HW then probably this
check could be written more efficiently: finding the band first based on
the first channel, and then checking all the channels exist within the
band.

johannes

