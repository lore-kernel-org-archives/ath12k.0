Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F580C52D6F
	for <ath12k@archiver.kernel.org>; Wed,  7 Aug 2024 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PF5UQCbT3YAwsc/QrIAVx1KnxYZ6h3pnfLXquMhOGo8=; b=LSvrORjS3ODvypHBZNggMK/MYq
	eOtghFNiYzU7g/cjQRiUWF6/dEtY8LdDzOkPav/niX+M0Y+I3MG46XTVSDLXgg/w7s2TWrCEp3+tA
	8FIhMGQ6gqQShKZ0NQ0FZvDqnHmbEulbyChN7FjdBoZDT0M1hmMOAiwxN567EocqN/5XddFnElYyZ
	ytRqL77UmzaJrv0Kw4PgTij/gupg/b83nZXepj/cU+SVzyWMUt11fCwjO3/Ow5vD/tS86PvdIRQta
	5rFKPBUY9iZXLQ/duEe3lbn/EzugCPna3pqifRBpmEYkA7Id4Pxr4mufhJ5+ixNmY4UpLS1ZbjYmA
	4Oa47Jsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZrH-00000003xIW-00X1
	for ath12k@archiver.kernel.org;
	Wed, 07 Aug 2024 06:09:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbZrD-00000003xHb-2DY2
	for ath12k@lists.infradead.org;
	Wed, 07 Aug 2024 06:09:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BDAE60FA7;
	Wed,  7 Aug 2024 06:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B830C32782;
	Wed,  7 Aug 2024 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723010950;
	bh=SuxFkzjIjdP0NFpzTyDjZFERVPF4wIASkMgOigUWRKE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HdnzMYuZ4TZqqo6zRJqsZ1OqX4n9QZWmqMK2Ravq5beXVYX2GfvZ35zSAh7jRSFVa
	 5pFyfHVfZX267w/aCG2i7RGUcIa4O8csXTBfi1VYg9uWuYRZO7OiWPIzrghDRsLDOR
	 HD6DpjRfKcltql+7jDkgAEdzzW4qMztE/rbb6hAO6gY3w8zDgsqI8B3bDLT0KNvhB8
	 pWtzVlG4RvXK7ZZm8FyuQcZM7wR7o33tcDzWu1GFMabmr1j0sXo5aBVCTvSNxf8RqH
	 UYbBiy/FwgFlOExS3jscuP/9rhafdWSktC5YU8dSAE0uumyTgOU9US0NqxilIGIzJf
	 LPFzujPS4yH+w==
From: Kalle Valo <kvalo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: linux-next: request to include ath.git tree
References: <87ed7163yd.fsf@kernel.org>
	<20240807080423.45efb506@canb.auug.org.au>
Date: Wed, 07 Aug 2024 09:09:07 +0300
In-Reply-To: <20240807080423.45efb506@canb.auug.org.au> (Stephen Rothwell's
	message of "Wed, 7 Aug 2024 08:04:23 +1000")
Message-ID: <87wmks50fw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_230911_682555_BB320130 
X-CRM114-Status: GOOD (  20.36  )
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

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Kalle,
>
> On Tue, 06 Aug 2024 18:55:38 +0300 Kalle Valo <kvalo@kernel.org> wrote:
>>
>> ath.git is a tree for Atheros and Qualcomm Wi-Fi drivers residing under
>> drivers/net/wireless/ath/. Jeff and I are the maintainers. Over the
>> years multiple people have been requesting including the tree to
>> linux-next and finally we are biting the bullet.
>> 
>> So we are requesting to pull two branches from our ath.git tree to linux-next:
>> 
>> git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
>> git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next
>> 
>> for-current feeds the wireless tree and for-next feeds the wireless-next
>> tree.
>
> Added from today.

Thanks!

> I have listed just you as a contect, should I list anyone else (or a
> mailing list)?

Please add Jeff and our ath10k list (all our build reports go to the
ath10k list):

Jeff Johnson <jjohnson@kernel.org>
ath10k@lists.infradead.org

>> Because our for-next branch is very active one problem with is that the
>> chances of having conflicts between the branches is high and that would
>> be extra work for you :/ Do you have any suggestions for this? For
>> example, should we create temporary merges for you or something like
>> that? Just for this reason we do try to keep the number of patches going
>> to for-current minimal and only take important fixes.
>
> Well, your for-next branch should only contain patches that are ready
> for integration i.e. reviewed and unit tested, so it should not be all
> that busy.  I expect you may also have a development branch for patches
> you are still testing.

Yeah, we do have a separate pending branch which is used for testing and
review.

> Otherwise, you should concentrate on your own tree and I will notify
> you of conflicts (and ask advice if the conflicts are too difficult
> for me to resolve).

Great, that sounds good.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

