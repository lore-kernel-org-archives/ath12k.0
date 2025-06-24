Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92CC77B7C
	for <ath12k@archiver.kernel.org>; Tue, 24 Jun 2025 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEQOzs8SVvofoslNTAz19kCIeCVN3Dba7QorZcl9RBw=; b=srvgReF3KYf1C5i4SWCjIPvFGY
	NUZqYn/E7SbscllxVULhEdCBsIDwMpxVtvayJSJinsM3u0sQ4siSVB7FyKOM/OgM71oADUvP7EzRl
	7vRRbnCCnAx3czWVYZmNq/Lh7WEOyIoSgP1V8AFrkDP+aX/6AoBdKpDPyGKMg61l/tZWwBnq4/NCc
	VKOnkymKWZMDlfW6Ft2KXzci4dm4otcLQ+1qQ63adqlCtzeEps9dCAPJcYJAwSV0NKKuc7SVtK4JJ
	8YWM8IaV83FWhejSZaC0svxjURVuqKgHA01SkISyWfMF2kmv//q4mU0C0Aq/FFkb6OTOjnkWBWVPh
	6dz8i8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3vA-00000005kbi-1mBN;
	Tue, 24 Jun 2025 13:42:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3du-00000005he6-3wqb
	for ath12k@lists.infradead.org;
	Tue, 24 Jun 2025 13:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=qEQOzs8SVvofoslNTAz19kCIeCVN3Dba7QorZcl9RBw=;
	t=1750771493; x=1751981093; b=tEOBGsP1QDSgxx270IZF3YFhkA9Y+SLjwpd0wosVhtX6g4N
	hvByJSOg8zWe7+Gq8ZSoI6O6z2kpNxEaXs4OJ+Q9pKZRZY0IUHB9PPAirMHhLNrNLWzpCgFA/RNdU
	ZvWa4CJhkMlwMu+Th5lmIn+bl3eb3qmmLqglIx1FRLq+3WZMYEBuwE9m+eK51KTSuwLTwJX+6Qe/T
	dWn/BZZoLlXCiTHqlOGbx9h2S5Mgkdw3gYQ4dZ6ktpdQH3IHfe+xrAmqX0NPf9JwclAmvAg4a3duZ
	S7J2r5AWU7tlIiIDph8I3qTj8mLJePXgLGVLfdhHosyhzIQeXpYDhonOjopfiuPA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uU3dp-00000008rdh-2oFQ;
	Tue, 24 Jun 2025 15:24:49 +0200
Message-ID: <a8ff80ff5a811a09cf5556e20c7232eb1e201c2b.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next 0/3] wifi: Preamble puncturing support for
 mesh
From: Johannes Berg <johannes@sipsolutions.net>
To: Ramasamy Kaliappan <ramasamy.kaliappan@oss.qualcomm.com>, 
	ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Ramasamy Kaliappan
	 <rkaliapp@qti.qualcomm.com>
Date: Tue, 24 Jun 2025 15:24:48 +0200
In-Reply-To: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
References: <20250609001048.2263586-1-ramasamy.kaliappan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062455_002411_C3AA6823 
X-CRM114-Status: GOOD (  14.44  )
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

On Mon, 2025-06-09 at 05:40 +0530, Ramasamy Kaliappan wrote:
> From: Ramasamy Kaliappan <rkaliapp@qti.qualcomm.com>
>=20
> Preamble puncturing(=E2=80=9CPunctured 242-tone RU") refers to the transm=
ission
> of a PPDU in which no signal is present in at least one of the 20 MHz
> subchannels within the PPDU bandwidth. Puncturing might be the result of
> the unavailability of 20 MHz subchannel(s) within the PPDU bandwidth,
> such as a busy channel indicated by the CCA or the setting of the disable
> subchannel bitmap field (16 bit field) in the EHT Operations element.
>=20
> EHT disable sub channel bitmap is a 16 bit field where
> each bit corresponds to a 20 MHz channel in the given bandwidth.
> Bit 0 corresponding to the channel with lowest frequency.
> Bit set to 1 indicates that the channel is punctured, otherwise active.
>=20
> Userspace can send the EHT disable sub channel bitmap via attribute
> NL80211_ATTR_PUNCT_BITMAP in frequency  param as a part of join mesh
> (NL80211_CMD_JOIN_MESH) command. The received puncturing bitmap is
> validated and copied to chandef's punctured bitmap of mesh interface data=
.
>=20
> Build the mesh beacon=E2=80=99s EHT Operation element including
> disable_subchannel_bitmap based on chandef's punctured bitmap.
>=20
> Validate and update peer mesh station's puncturing bitmap
> in local structures while adding new mesh station
> (parsed from peer mesh station's EHT Operation element)

I ... don't really understand how this is supposed to work.

Say, for the sake of simplicity, we have an 80 MHz channel, the lowest
channel is the control channel (so puncturing 0x1 is invalid). Possible
puncturing values are 0x2, 0x4 and 0x8.

If locally we have 0x2, that means (I assume, since that's how chandef
is meant to work) CCA and RX is always on the control channel and upper
40 MHz parts. If you're now going to transmit to a station that has
puncturing 0x8, you didn't do CCA on the 0x2 subchannel, but ...
transmit anyway?

I mean, maybe this could work if the remote puncturing is a superset of
the local puncturing? But just blindly doing it the way it appears to be
done in this patchset seems ... questionable at best?

Can you explain more how this is even supposed to work?

johannes

