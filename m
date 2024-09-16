Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E27CC3ABA2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q/ryCJ1jUc4/TQhMon+R+KXan6cqMWZAVHqikfTN3ZU=; b=oVUMI/SbRWpqd1K0tvgzrCEu7q
	3a4QPK+YTKQb5krkuEEivSWJXkphc8/fild65X0ZIeZu4zBsxUDCCc7H6+JMH+n8E/CXs9kKr+ba0
	FJKWYD/QPVudGlocZRt04hEbGWIUSiwdB5e1p6GSxHAWygL0zigtrIgjFRkSu7Dv14iQwnN7NuQJ4
	CQl15g1xPz9mNmIt43sXjQ3sxOKpHKKlfz9uKWVYah54sc/ZukueDzG0/z/QnyxJM0CLwtuzTtYrn
	EOiYCPk7M8ez73rM+sJOLc8QKQN3w6OnNEPaCKmzV3vvN6JJktK5AttFkl+ud15MTvrUY1gkmVYTk
	cpcUADVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDc9-00000004Li5-37Zi
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 15:26:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDbH-00000004LeL-0A8c
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 15:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 690DAA429A6
	for <ath12k@lists.infradead.org>; Mon, 16 Sep 2024 15:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE4FC4CEC4
	for <ath12k@lists.infradead.org>; Mon, 16 Sep 2024 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726500313;
	bh=q/ryCJ1jUc4/TQhMon+R+KXan6cqMWZAVHqikfTN3ZU=;
	h=From:To:Subject:Date:From;
	b=rofzcrILkOgPp1/kAPcjCDE102ZarqO84DMxLkEUVPCc4SP40XVKtfTFk3YVJTsjp
	 nlVmy8HJSH8EVf0kayr5acXDaQCpHDHjkuqPXVd+s8GleRGAKueLBB4iaF9pmolZab
	 +eiojRE38gfUJmm3GwQRBKhzKX7fzOSeWgK3idsfVajLe7kBcc5fXjn6rYPnLCKy7h
	 EbjZZpN01PgrEJbupscgchghbpxlzLFoR0En4Gr54PvqGbzXNitUzKAbCWrNfVW3Dn
	 f5lfeDEre5J5AuUIv3LQO9TKWChGTPngDc4fTTRzKgZP/9jYFVRBfznjPDV1W4akLp
	 ncNTf7bwkU1VQ==
From: Kalle Valo <kvalo@kernel.org>
To: ath12k@lists.infradead.org
Subject: ath12k-mlo branch ChangeLog
Date: Mon, 16 Sep 2024 18:25:11 +0300
Message-ID: <87wmjbd3jc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_082515_175330_C53D5453 
X-CRM114-Status: UNSURE (   5.05  )
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

Hi,

We created ath12k-mlo branch for managing the MLO patches:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath12k-mlo

The branch is rebased and tagged everytime it's changed. We will use
this thread (ie. reply to this mail) to send the list of changes so that
everyone can see what's happening.

We will send a separate announcement once we have a branch and a
firmware which can be used for testing MLO, unfortunately we are not
there yet.

Kalle

