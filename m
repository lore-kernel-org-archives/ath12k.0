Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F38CCF9F8
	for <ath12k@archiver.kernel.org>; Wed,  5 Nov 2025 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGgQM1NUA/jBnzd1959ic7ko5gicd5Yv3iA0lVN3Yls=; b=eU33rdML6YgCwK3gCOTM3E89ak
	4I74LelrhawobrI7dizNPg6CcoiiU82bgxZnQQiYa6K4Xi4f7mUU+NfnGzvdKz6x1QiGMkAcTEPS/
	MlE4VwJc8AyCuExJQHRBE70AXIzTKuN9FWEpVz/5k8oivmLTjW1+Pgu2Mh80uPVpC4kq5vDxN7pxx
	s54rl3xyoaWOP/zz1//KCyuiX9n6tleYS1IeVrSDq0SzYMeJ2DEJJDCAedgXPib+dib8PP/Y2wniq
	T0pxjE42+K/M20N4W1f5PUsbd377JPKlRNgiR3oycNrlBi6XiwsNJLfcCWVouP+DU7kV88lKm/o0w
	6J5TzDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGl3X-0000000EWNU-1smU;
	Wed, 05 Nov 2025 21:28:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGl3U-0000000EWMV-0Cx8;
	Wed, 05 Nov 2025 21:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=iGgQM1NUA/jBnzd1959ic7ko5gicd5Yv3iA0lVN3Yls=;
	t=1762378115; x=1763587715; b=CwkHtimZvk9X6or+wL+2gPNe3tF/7tl6onTG8TB+r7057ev
	8MYvywyJBkXnOqZv1bqQG/F1NfAl6BPmGHDakWVyvpruulhejuQ3PtQWNbl3ML37u7YO2JdDz+igD
	V2gku8FGrylwkhC+TTbEt/DjE6xPDoMD8Vzsq8I0nKk7MgxTuk4nKVGQCcjfPsb/3aI50II7wRQjz
	utRDEcVx3aYLqOqu34zzz7MPU4hhAGV40ONNOdmBvalOYm4ulinfYjZF6F4OMw7Yrzg2b4B6pWrZT
	w5PzyNJIYri+EsU4whavOcRAt7KzAcPGde8oVq62hw+znPrcSjgKHNkmvWOnzUQg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vGl3N-0000000FsAo-1Eiy;
	Wed, 05 Nov 2025 22:28:29 +0100
Message-ID: <f7eb31d19a013f9d1375db5db6b1423d1b2ac36f.camel@sipsolutions.net>
Subject: Re: [RFC][v1][Design] AP Architecture for Roaming with Wi-Fi 8
 Seamless Mobility Domain (SMD)
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Sathish <quic_asathish@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	hostap@lists.infradead.org
Date: Wed, 05 Nov 2025 22:28:28 +0100
In-Reply-To: <ca61c6dd-b1a6-4f5f-aff1-341a8c5f88c6@quicinc.com>
References: <fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com>
	 <c618e0e8fdee9f7aa2628aefdf2dc04c48e6e9b7.camel@sipsolutions.net>
	 <ca61c6dd-b1a6-4f5f-aff1-341a8c5f88c6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_132836_109927_F59C34A6 
X-CRM114-Status: GOOD (  15.15  )
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

On Wed, 2025-11-05 at 13:26 -0800, Aditya Sathish wrote:
> Continuing on a message excerpt I missed from Johannes' earlier response,
> since it is in a similar vein to Benjamin's response:
>=20
> On 10/12/2025 06:51, Johannes Berg wrote:
> > That's not _really_ a good argument though - mac80211 will likely have
> > to process this in process context, likely acquire wiphy mutex, etc.
> The ST Execution sequence =E2=80=94 which includes receiving the ST Execu=
tion
> Request, sending context, receiving a status code from the target AP MLD,
> and ultimately sending the ST Execution Response =E2=80=94 is largely cli=
ent-
> driven. It primarily involves parsing management frame content and
> handling context data embedded in the skb as extensions by the vendor
> driver.
>=20
> From the target AP MLD side, we do need to access the generated group key=
s
> to include in the ST Execution Response to the client. However, beyond th=
at,
> interaction with core wiphy data structures is minimal.

Fair.

> While it's likely that mac80211 will operate in process context, if our g=
oal
> is to minimize latency as much as possible, we believe it should be feasi=
ble
> to implement the ST Execution logic without acquiring the wiphy mutex. Th=
is
> could be achieved by isolating the ST Execution path and leveraging a
> high-priority workqueue, thereby avoiding unnecessary contention and
> improving latency. However, this is, admittedly, dependent on the toleran=
ce
> for complexity in the mac80211 versus the demonstrated benefit - which is
> something we are gathering experimental data for.

There _is_ a possibility also that nl80211 operations do not need to
take the wiphy mutex, though of course that might be more complex.
Probably less complex than pushing everything into the kernel though :)

But yeah, I think data on it would be the best way to settle it.

johannes

