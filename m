Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4EAEB64D9
	for <ath12k@archiver.kernel.org>; Thu, 15 Jun 2023 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijycREwfUjWdrRaXOcTZl3bAQInAiJO5kepBuZBREI0=; b=Dy3Owz+GZDNfbe
	TYiHJG6jyPwzCdxiGQpC8HGbX4c1RhJhZ6DoIe/KJP9oyGbBcGwRMM6kANaThdY/Uvpt/pzJDsf/T
	/Se+8FTmz1PA19mwy+0dHzSjT0k4ssaYMIscBvuuJ1GzcckG5sjSZFa6uDqdgj/rhC2nBgdPvqAbl
	2nTmZvG+9GJteKFUxB2YsQodd71WEHNSK0JuMdrvQ+LMPggmTgblHeAOnoNVr8ChEROr4YGx1va7n
	lqwC+bCdMxgmpWycDMs2TqJRLzj08AimnT9+oTdLMbZlThXHIARAi2gVeJmIHimcxhztyarfigU+k
	erEKMtmBH1kmO1JRdxlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lSC-00EliJ-1m
	for ath12k@archiver.kernel.org;
	Thu, 15 Jun 2023 11:47:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lS9-00ElhV-2b
	for ath12k@lists.infradead.org;
	Thu, 15 Jun 2023 11:47:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C62463A1B;
	Thu, 15 Jun 2023 11:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC377C433C8;
	Thu, 15 Jun 2023 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686829668;
	bh=ETjfqbV35FydXvtQT6glIanv5Nl5Ltd28mo9+pNNqaw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UpjKZs3oreG5S+ux9roaMSwCGte48DJrQnHyfkZp+9pf1J27jvZhR0P/y4ShdmyUD
	 eVo3rjRKYQFsUgi0pis74aM8FYSw3wcfRNum0lSF8r0m0E8qfDJ6VUxy0qzeKtVa0D
	 fE5sQzKlVkTfMActgAtT8s+lL8SNpx/IXXKCg0gFn5I3IiZk94aPq08WHcdxGQ9qvZ
	 r1qBa9By2moxGPmt/Hd8qiYeEPWmVFKreVpoOmUksrVBW70fjNyawpfTDwOWrTFUy2
	 H2owO5Z0Hjx7T9B2DFcM/zQ293qBo8zl+cNLeq+zlp38dqkPvleSW/W5PWwWPgI7gs
	 n0J/BkqrNsmAQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] wifi: ath12k: (v4) EHT support
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
Date: Thu, 15 Jun 2023 14:47:43 +0300
In-Reply-To: <20230602235820.23912-1-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Fri, 2 Jun 2023 16:58:09 -0700")
Message-ID: <87y1klaqw0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_044749_879422_A342ABE7 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Aloka Dixit <quic_alokad@quicinc.com> writes:

> Add driver support for EHT bring-up, association and
> preamble puncturing.
>
> v4: Modified patch 3 to support WCN7850.
> v3: Modified patches 6 and 9 to fix some issues,
> changelog included in the respective patches.
> v2: This version modifies only few commit descriptions,
> changelog included in the respective patches.

I did some minor changes to these patches in the pending branch, here's
a list:

* patch 3: ath12k_wmi_tlv_mac_phy_caps_ext(): remove unncessary cast and add const

* patch 3: shorten struct ath12k_wmi_mac_phy_caps_ext_params due to
  long line warning

* patch 3: improve error messages

* patch 3: move struct ath12k_fw_pdev after struct ath12k_pdev

* patch 5: ath12k_mac_get_phymode_eht(): add extra spaces, improve error messages

* patch 6: cosmetic cleanup, extra lines etc

* patch 6: ath12k_mac_set_eht_ppe_threshold(): move declarations
  to the beginning of the function

* patch 7&8: use BIT() for enum wmi_tlv_peer_flags_ext

I have two more comments which I'll send as a reply to patches. I'm
hoping to fix those in my pending branch as well so there would no need
to resend anything.

The changes are now in the pending branch, under tag
ath-pending-202306151144. Here's a link to few of those commits:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=974310a085acad9cee462b3f343e8c05185abc67

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=e4b7f51541b4ae79baa1ab9a8389fd4d9e0fe219

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=ae4b76c40bc7350d52d42de6e8633f6e52d905fb

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=3594ef351ae29788c00fad6c69d60b9a41dc1bbb

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
