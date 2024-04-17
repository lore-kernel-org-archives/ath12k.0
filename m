Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50F4C4345F
	for <ath12k@archiver.kernel.org>; Wed, 17 Apr 2024 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZBtMK/m0FBHCiOq6yjBx7dH9Y4CEmd/5l1j8OocR+o=; b=ye+44zPSMOyz0/WjlS41JtYY8I
	x1E7DziRJt6g/THUe1+QQdIvIw8VJ7Pb2gZ3Yl5Ir6pXXayoC/O3/5gmiiVENRLDh+AFvIGbb9Gp/
	qsyM6GAFCfx6n7C0ow9DQ4hUtztyegaZM0S7WkSJqtG3/wyAr1dajxtj5+3oQtDpWlwf9Fm0t/Rk0
	mWtuqlVntSSGY6Xc3CSbO7ciFgcNbXj8wO7MLcJJpP06Eb5HDJ5EftkSLI2yhCzErO4DZ0qUvJz6j
	cA9b4XpR2nK+GcnoDJYaxCTWY19/rBXjnkvYsauebLTAfgOBCGH1DULfR1CNDPsQZ4yWbFo19Ub5f
	yzN7fAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzmo-0000000F2ls-29hD
	for ath12k@archiver.kernel.org;
	Wed, 17 Apr 2024 07:32:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzmm-0000000F2kv-1sdB
	for ath12k@lists.infradead.org;
	Wed, 17 Apr 2024 07:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=lZBtMK/m0FBHCiOq6yjBx7dH9Y4CEmd/5l1j8OocR+o=;
	t=1713339170; x=1714548770; b=oXMGb/DyQ+KPw+MvVAi4W6Tz7vTTRwAmGzntJTYKsQIgmEX
	MbVkicW5Km3UTQzILDa2IwQe7VOUbeagDG8f9+XWawbN1XmQQDTkThHrIXDKktWwtW1Zxx66nG98B
	Nyqqw9nVb6bKxKJROq2JY/BjeMOClEWtdKP+lbkO//xXQsLPXnktVIFkIg8nYsK8spcE4CwD7Bh2L
	zlEmZo6fvu3QGrBOmZPSwWYPd7koTMarR7P/pidmC0Jbz2oVsD1chTpcGool1cYYWdKbTSwn2M7UY
	fPfzVxa70E7XR+M1t3eDpIxtinaAzUNNPTGUmp/XDSXHWTApO8guiS+x8msSRLnQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rwzmh-0000000Ak4c-1arl;
	Wed, 17 Apr 2024 09:32:47 +0200
Message-ID: <fb1b47b6c06bba25230a5dbf144ca5d6c245b0b2.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: cfg80211: Clear mlo_links info when STA
 disconnect
From: Johannes Berg <johannes@sipsolutions.net>
To: Xin Deng <quic_deng@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 17 Apr 2024 09:32:46 +0200
In-Reply-To: <20240410031048.23372-1-quic_deng@quicinc.com>
References: <20240410031048.23372-1-quic_deng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_003252_642551_79F73813 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2024-04-09 at 20:10 -0700, Xin Deng wrote:
> wdev->valid_links is not cleared when upper layer disconnect from a
> wdev->AP MLD. It has been observed that this would prevent offchannel
> operations like remain-on-channel which would be needed for user space
> operations with Public Action frame.
> Clear the wdev->valid_links when STA disconnect.
>=20

OK, so now we have a version that actually _works_.

However, I'm not convinced it's _correct_.

You say "on disconnect", but also do it before connect (where maybe it
makes sense?), on roaming (where it doesn't), on connect result (where
presumably if we do it correct, it's already 0), and finally on
disconnect.

And also in a function that never even mentions anything about doing
something to links in the name.

All that doesn't feel right to me.

johannes

