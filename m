Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409F2CD1283
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bEh8pMuO7/YkXZZAvcj6nn2I/pQdQYEtIYGN/UIft4=; b=0lYQ5wQuwc6OMuP+Zm5qsboq+o
	X8eS1tglau3qcehD/Gmd8v6fTh4WJNx3jDmPSAPY8dYFhxnNpeGVpZepGHieZVtlFDr1UJgzaaRH6
	kMe/d4OP4oUIaWF8ODfffJbkPsjiSKyq2JkK/qUSvm7Nv7xzTGGFoZsMZqa1UW9cOVbDjXKGUepJX
	n81kUKxuRDbv1VO8x2J/jJOFE6fXhmUOd7+Sc+gYuIBj/zJAlSrahVzPs+q3jplZel9qr2OOypugM
	8CyRNw9q5aVRRhlXcJ+DAJNltvKvwPp8LkOKYRYoRWxVkASOegL8dBf9+uv1t+YxNYz8qtWvTTt+a
	coVk2gpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsRi-0000000EhJn-3wi2
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 16:17:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsRg-0000000EhIi-3F7r
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 16:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3bEh8pMuO7/YkXZZAvcj6nn2I/pQdQYEtIYGN/UIft4=;
	t=1711642660; x=1712852260; b=gUrB5b6Lo0bPhTqRV4l7xSK/nZMY9VrmqWQtFLuXo/FJiJY
	wvJxyFpCdadhHC2Ru9yZ7rHLWM3tSwsKnJ6sPR/No5u4V3opG+/gTVMXJZIcWJKUhilYlxPqSkFSN
	P8KOv58TX4x7GIsKvmUuGM7CJJHCe+pLJ4cQhD5L0Bkq4uIJzGpsGA57Vw0p0EYRnlw5VJB87Uv1W
	k3DTh6kMWk0lL6+uhl7fGpORFdPZvyJmz+JP5Upn8gMMbznxi/qRSH0rlPck6KRcvbzVOMPgf/UhQ
	3AhPw4HEGeZZZJ69UHY5p/TSrHvoSln8YhK6Zp7jPn9sVUKMrxmYtgjdhlycu60A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rpsRe-000000017mB-17cw;
	Thu, 28 Mar 2024 17:17:38 +0100
Message-ID: <3cc984766a2cf1452ac44054cd736c913c356469.camel@sipsolutions.net>
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Karthikeyan Periyasamy
	 <quic_periyasa@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Vasanthakumar Thiagarajan
	 <quic_vthiagar@quicinc.com>, netdev@vger.kernel.org, Jakub Kicinski
	 <kuba@kernel.org>
Date: Thu, 28 Mar 2024 17:17:37 +0100
In-Reply-To: <2b5fdc14-85f0-48ba-9797-c1f43ecab86e@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
	 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
	 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
	 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
	 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
	 <14b739c9-18da-0d58-b58d-cccebc505950@quicinc.com>
	 <3f61f18fbf3372ff88da54cdfbd309e74b2aa4e9.camel@sipsolutions.net>
	 <2b5fdc14-85f0-48ba-9797-c1f43ecab86e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_091740_920578_54C69A06 
X-CRM114-Status: GOOD (  13.65  )
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

On Thu, 2024-03-28 at 09:14 -0700, Jeff Johnson wrote:
> On 3/28/2024 9:09 AM, Johannes Berg wrote:
> > On Thu, 2024-03-28 at 20:40 +0530, Karthikeyan Periyasamy wrote:
> > >=20
> > > Can you point to any attribute constructed in this way from kernelspa=
ce=20
> > > for the reference to explore more ?
> >=20
> > I don't have anything directly, looking at the code finds e.g.
> > devlink_dpipe_entry_ctx_append() but honestly that's really quite
> > trivial, it just adds that new attribute while iterating whatever list
> > you have.
>=20
> Note that we are trying to maintain the same structure used by the curren=
t
> wiphy global advertisement since we actually refactor and reuse the exist=
ing code.

Partially, yes. That's not true for the one I was discussing _here_,
notably nl80211_put_multi_hw_support(), however.

It's partially true for patch 6, though even there
nl80211_put_per_hw_iface_combinations() doesn't need to do it that way,
since that's a whole new attribute (NL80211_IFACE_COMB_PER_HW_COMB) and
can define the content anew, as long as the part *inside*
NL80211_IFACE_COMB_PER_HW_COMB_LIMITS remains the same to be able to
call nl80211_put_iface_limits().

johannes

