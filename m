Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351DC7EE2A
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwmvDhTcrHgX2bXqmwGk5bn8Pw45rRhVdOHMG8vu+Bw=; b=XP53uKf7pC7E4UMI2yeuXACeeZ
	3Lny4gqsd7XjlkqHz2vI4rVgP+j8M5AOqnw4GHY00rKAL4qdPeyuQx7pbJ7ifylLGoGW3qNlvDJp+
	fQ/uI+FmJjnyMR/M3RloHFQpf0B6qlP7N1r2jXvAVq4FogP7SGMwbnGlawTCD9/CbZ/3fiHDnNdag
	pYeBYekWICjXb0cqk+M9w2U7Lz2C5ctyopl3lKkIJbkdXnM9gBwof1nzBBAjBZ3kn2cDHi7TbzVTD
	RRAcNoLI7qgFeSu6vCs/Xbyk/CCZpugP9yEFWpz/UDDnz3RY5qUqmafcKbagJe4k+PKGHS8ZnZ7mG
	Rw2RU0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUs6-00000009ZtM-2dLb;
	Wed, 25 Jun 2025 18:29:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURZ0-000000092sx-0fyU
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 14:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29B5C5C418B;
	Wed, 25 Jun 2025 14:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4398DC4CEEA;
	Wed, 25 Jun 2025 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750863445;
	bh=VS8Oe5TcNPQQJw9J+j+AnUHFH2WyAvcFZgDmG5vDQYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cv9utmEV2fnWju69799elbmfrSNfyOT15Vfs4DTZcjww/e8GF5Fq0tsukmsgUBvv2
	 SXsj4F8L90Eqt5dhvNfvv0SCak2H7wjAwbLkQJANBF2/2mP04cyPI5ruXeDvn2DuH6
	 J896FZ1jRIE3HglmkBcGDvgxNhXrmnIQ5gBn8nNjwq45+Sdfmia49u317QJpnxmyZA
	 wkjIQlgT+V7lrwVI8ggMThl0Z7pE8Ys8ZB00ZqZCCkYv82T9unlTAVWIlr8KKnTUXo
	 FY7JjwwJb7nSM+7dVX43LMTzC5USEbewG4/5wKR4yjeuPBBc0qefsikW9OiTNWoJoo
	 77C0sV0owK9cg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uURYy-0000000014F-28Mh;
	Wed, 25 Jun 2025 16:57:25 +0200
Date: Wed, 25 Jun 2025 16:57:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, Gregoire <gregoire.s93@live.fr>,
	Sebastian Reichel <sre@kernel.org>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Message-ID: <aFwOVGGHOHbko9So@hovoldconsulting.com>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
 <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_075726_246004_341DE9E0 
X-CRM114-Status: GOOD (  17.25  )
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

On Wed, Jun 25, 2025 at 07:48:54AM -0700, Jeff Johnson wrote:
> On 6/25/2025 3:15 AM, Baochen Qiang wrote:
> > On 6/25/2025 5:51 PM, Johan Hovold wrote:
> >> On Fri, May 23, 2025 at 11:49:00AM +0800, Baochen Qiang wrote:

> >>> We got report that WCN7850 is not working with IWD [1][2]. Debug
> >>> shows the reason is that IWD installs group key before pairwise
> >>> key, which goes against WCN7850's firmware.
> >>>
> >>> Reorder key install to workaround this.
> >>>
> >>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> >>> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> >>>
> >>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> >>> ---
> >>> ---
> >>> Baochen Qiang (2):
> >>>       wifi: ath12k: avoid bit operation on key flags
> >>>       wifi: ath12k: install pairwise key first
> >>
> >> Thanks for fixing this, Baochen.
> >>
> >> I noticed the patches weren't clearly marked as fixes. Do you think we
> >> should ask the stable team to backport these once they are in mainline
> >> (e.g. after 6.17-rc1 is out)? Or do you think they are too intrusive and
> >> risky to backport or similar?
> > 
> > Yeah, I think they should be backported.

> +Stable team,
> Per the above discussion please backport the series:
> https://msgid.link/20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com

These are currently only in linux-next but would need to be in Linus's
tree before they can be backported, so we'll need to send another
requested once they are in mainline.

> This is a 0-day issue so ideally this should be backported from 6.6+

By "0-day" you mean it has been there since the driver was added, right
(and not that it's exploitable or similar)?

Johan

