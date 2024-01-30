Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4D8C47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yL6xtIPS2USoWxSsdR3wwBD8nN8ZzRfbGsJdTYamzyM=; b=GulAsXi4IJJXq69PXmm/EdkpAw
	gztYe0X1FODTEzWKPbif9XTAvNG4echbzn3eJmATnwOzfc8e7gbYHyExjtQBBLGimfiXd0V1Z7idL
	JIx5r3L/jmAvYtnHL7w+jhwiw7sxK0eDmheBBLAzo6e29YyhnCdDGpCN8YTgXg34D+B8DqPWlBhJ+
	Gq+150wMU2ZP2PuJemXei81lOdD5jTpixl4hsw+4aIJTqTRQHCcE7KbnQ/K5alr8XzE1GbSDYANn5
	FMhxgRRN+zh2VEhhw6HKTzOhCLGVohvxcx2mzzteNspWq/SZfbzUaY5LgOAzjr3Nm52PoiqHqIlWA
	5eZgCXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUsQZ-000000003YG-2W24
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 18:01:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUsQV-000000003XF-2S2a;
	Tue, 30 Jan 2024 18:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E678FCE1BC3;
	Tue, 30 Jan 2024 18:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06875C433C7;
	Tue, 30 Jan 2024 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706637697;
	bh=KoSlChzPbN1luVkVxR15iprRA73XaF1uhQs4tygUHo4=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=YKgD9gZrix7B29e7sUr7A89+zy51SzBYHIQY3aGJLuq0jIuYhOue2S0INyeboX4Kz
	 waRLsPMYt5QGPNgx6uHeWXN7+qzxw8wJqWHrefe+RRZIMSWF3vp7RwiNQhg17/49y4
	 VV5ZpCXaJWIi0ItHytXHEJyPX/PLQTTlTkjol5zkViwaN9eVC75sJYXdXjlbpc28pZ
	 jEN00STfIbOGJUhjrdlrXP+BOAkvbqoNoHpmTHIA3ge3tVJr0bYoZqGfyc9mRyVG+x
	 BK0/isf43HfzD2ssNcv1bdrDl35RsR7lfhBaqP3CMIHXrRFKIBp/zYzgGikNo4ZLH/
	 zmX+cjd3qyU6Q==
From: Kalle Valo <kvalo@kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 20240130
Date: Tue, 30 Jan 2024 20:01:34 +0200
Message-ID: <8734uewvi9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_100139_824203_02BE5240 
X-CRM114-Status: UNSURE (   7.63  )
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

We have one important update for ath11k WCN6855 which fixes a suspend
regression reported by several people.

Please let me know if there are any problems.

Kalle

The following changes since commit 1a9518c73c4b54854c9cd8f416fd3b8f8e3456e7:

  Merge branch 'mlimonci/amd-2024-01-30.2' into 'main' (2024-01-30 15:55:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20240130

for you to fetch changes up to 5217b76bed90ae86d5f3fe9a5f4e2301868cdd02:

  ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37 (2024-01-30 19:58:18 +0200)

----------------------------------------------------------------
Kalle Valo (1):
      ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37

 WHENCE                        |   2 +-
 ath11k/WCN6855/hw2.0/amss.bin | Bin 4988928 -> 4988928 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

