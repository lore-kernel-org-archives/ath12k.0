Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EFACE7CE5
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 08:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fDoOHkgwj8lqEsUdx0mUeTNs6SRSDLbN2FOUo40l5E=; b=2B1ZhiRzbnSW62N6p4f52R5grf
	zCu+Z95IWYzp0vtfa1CgbgZ/Ogh0iWzMAOGLCGJchRDqGX+XnMQQyRJCTCMD2jqtGm8l2JLg+1M3g
	Y/xhjZ7/rWJPDWKNOm8V2Z/To8gBTScJG+ciuODHopiS42OQcTzi39vVhFeWha46pM4QRbdHMUc/o
	liy77AT65y4SHZUikZevLRV9RyaGpFo6ODR2tf8qmkRnHz1f02wEU7ShYvdciC07P2Lpt5HoVjfcT
	I6DXbqmcMyjzuBbNly9MUjzZNDYfsvGJ3orXK0biwPWoHvEBZvD/kMDCVEQpM8JoibBnsXSGw/DPN
	8UAGU3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXvV-00000001zt2-3Los
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 08:08:09 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXvS-00000001zsd-3aip
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 08:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=6fDoOHkgwj8lqEsUdx0mUeTNs6SRSDLbN2FOUo40l5E=;
	t=1727770086; x=1728979686; b=a2o0noESoJT+yf+ck7FqJvr3lmTRtcnwTwJ01QnTc9nXUmj
	6XNfGtSgSPvyW7L6HMPfSQVApK8+EbSxNFqhHaBVQku/JV9SwTTb9iYy+DktAMdh9ae2NofrBIXf/
	ieVXGlRK6Xl6+PiGhjoyrF4YEziikk4XVFaq9c3JayZ9qhuh/1O4XknKbcu3YaxW66FyyD1DBCJU+
	bYT7A7bOYqwggERRMO/n9Ke3gJm4aTGTsP+omqYNCK3gZ/kvv4t3wSnpoZRVwqj/IGW8J7wYjrqn5
	z2/DjAZHhPDogamt8W3Z2XmkcQd+SAeoQM0cePCuki1rTvxpJsRbuth/921E7jTg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1svXvO-0000000EfUM-48VG;
	Tue, 01 Oct 2024 10:08:03 +0200
Message-ID: <16ad03533ab6aca65c3fe9db94ae53ad11fdb9d1.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Date: Tue, 01 Oct 2024 10:08:02 +0200
In-Reply-To: <5fe9fdf2-ae5c-4d15-a095-0203a814e4ba@quicinc.com>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
	 <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
	 <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
	 <c103db90ed53a75cae10baba0ae52dae85bf1c3f.camel@sipsolutions.net>
	 <5fe9fdf2-ae5c-4d15-a095-0203a814e4ba@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_010806_916561_C361C455 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, 2024-10-01 at 13:07 +0530, Aditya Kumar Singh wrote:
>=20
> First iterate and do only _ieee80211_link_use_channel() this part. Then=
=20
> let the flow as usual and after stations are added, do the=20
> link_info_changed() part.

That would seem to make sense, it also matches assoc flow better.
Although not sure that matters too much, since this is necessarily very
different as it's while associated anyway.

> > But also this seems to break out driver for other reasons, because it

type - I meant "our driver"

> > initializes rate control somewhere here and needs a station for that.
> > Didn't look deeply into that yet though.
>=20
> Okay so doing as I said above could work -
>=20
> if (add) {
> 	...
> }
>=20
> for_each_set_bit(link_id, &rem, ..) {
> 	...
> }
>=20
> for_each_set_bit(link_id, &add ...) {
> 	_ieee80211_link_use_channel()
> }
>=20
> list_for_each_entry(sta, &local->sta_list, list) {
> 	...
> }
>=20
> ...
>=20
> for_each_set_bit(link_id, &add ....) {
> 	now call
> 	ieee80211_mgd_set_link_qos_params()
> 	ieee80211_link_info_change_notify()
> }
>=20
> ...
>=20
>=20
> At least I tried both of these ways in hwsim. I dont see any failures.=
=20
> Hence I thought why not move whole for loop to top instead.

Right, I don't know - I guess I should try with our driver?

johannes

