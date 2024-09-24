Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8D5CF9C6B
	for <ath12k@archiver.kernel.org>; Tue, 24 Sep 2024 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLSN6aKvWEAWG/OaCv6nHLEInGFls1mSq25bVQJTH6M=; b=duh0cVOf17tCzwYdoA9FKu8AGK
	0oCaYHKsvZsJhcZJ+rmKr6rdbBdxBEs52RzqtgUR2JQlLhbZDBbExWwXcnewfsYAOWs0TdelUdh8U
	nNHEPFaAaitoCjfpN6+4Uwt187yEePZplcUEV+6HekCUIxAaPa4pce4f8wNp/kcfR7KbS2M9c/h48
	FxuS9ST/70/I7rdlQVkgVj7heTtXgysQu6Eb1LVSSlKC9TrlmMiJJn2qaJ4WMBVl0MWUI1WMWsLkW
	4ytdtOIWn4a/8gy8PyBZIcEsfIAUTmAwEJAHuQqlv0osd7kBLJgYkmfK3y1ZFvNxmHOmEqnnUgybX
	Njntyx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2oQ-000000020KL-1n3w
	for ath12k@archiver.kernel.org;
	Tue, 24 Sep 2024 10:30:30 +0000
Received: from s3.sipsolutions.net ([168.119.38.16] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1dn-00000001lAZ-2YUQ
	for ath12k@lists.infradead.org;
	Tue, 24 Sep 2024 09:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dLSN6aKvWEAWG/OaCv6nHLEInGFls1mSq25bVQJTH6M=;
	t=1727169325; x=1728378925; b=o766YaqdwANzFv/d4YN20tK5AoqOzXC/z9xysR4w5NKwSht
	qzLHZeSu4/+0hMlax2sF2zHE1jyXC5GdSFBxp0tHksCIdFHn6gNcbHveVBe749E4XzmfsDbGDIHzL
	N2srp5EJBDbD/mhPkQkAzOgnGCLpZ1mh4qnxT/TysXLJvgwSZFma5/eHaUshVBIEgB42ddxd/RmpE
	k09VC/NCZQO1D91Tyg3eQ9FW42Qw+pC1ljadVlx+MJ38BSqeGz4MsebQfVRIJuww1tmF2RvsU9OBi
	+syO+uTddVBKtP5qqfYQCMD9OuYK952MqBwROAZAC3cFacEp0EGYt5+2RhEAsm9w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1st1di-0000000FyHH-2n3D;
	Tue, 24 Sep 2024 11:15:23 +0200
Message-ID: <9ba6cee6834966401f125a697308cf9faed0d078.camel@sipsolutions.net>
Subject: Re: [PATCH RFC v2 1/4] wifi: ath12k: switch to using wiphy_lock()
 and remove ar->conf_mutex
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Tue, 24 Sep 2024 11:15:21 +0200
In-Reply-To: <87o74da025.fsf@kernel.org>
References: <20240918181042.91891-1-kvalo@kernel.org>
	 <20240918181042.91891-2-kvalo@kernel.org>
	 <33ea3a62b4257b6ef789c30fa8f7bf7e9f1865b5.camel@sipsolutions.net>
	 <87o74da025.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021527_674503_EF1169DB 
X-CRM114-Status: GOOD (  15.04  )
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

On Tue, 2024-09-24 at 12:11 +0300, Kalle Valo wrote:
> > I don't think this is an issue here, but I'm not sure if you're aware
> > that in general, locking the wiphy mutex in some debugfs file handlers
> > can lead to deadlocks, specifically if those files are later _removed_
> > while holding the wiphy lock, as is e.g. the case for station, netdev
> > and link debugfs files. For this, we have wiphy_locked_debugfs_read()
> > and wiphy_locked_debugfs_write() [1].
> >=20
> > [1] you are not required to understand how they are implemented ;-)
>=20
> Thanks, this is good to know. I'm not that worried about that, at least
> it's not showing up in my tests, so my plan is to fix that in a separate
> patchset.

I don't think you'd ever even find that in tests, as far as I know
lockdep cannot track these dependencies, and to actually deadlock you'd
have to have the debugfs file(s) kept open by userspace while they're
removed.

In any case, just wanted to give a heads-up that this might be required
in some (future) cases, I didn't see any here where it was needed.

johannes

