Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC670C47DAF
	for <ath12k@archiver.kernel.org>; Fri, 19 Jan 2024 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSfCDH5uADR9r5TrhJad2qDNtqsaQlemd9lDwgr5yTM=; b=MxZ/bjLIa/ewj7Vr87/JjaXJYz
	2r1WtzNWM11E3or2WtjOmTQDSB6vH43LLc8XIOQ8i5KwjTbYtRwga5zKcI56p9hH6G72CKAS5YWXo
	/+1j8AWnUF8i86mthjLG6Jno8V11nkQhI6n+cMDpZEP2Mux1OSs3ImY71WXi18JweuwWy4z2KUA69
	bpfSZhCKtEaReN1d/bNJboTM5DYgael9D1p6K7eplKZ63ZIawZuBDYzSoYLfXr9LrrRBcrGvZFM/t
	ccP2NUZ0HZDdN6FBwPhHJAEI5Upu6aFbUn7qQXS1JATFgPeyTQ/IU6DjQvTTHeVjkogJJfHzlSjBW
	IqDyK6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnke-005SJR-1f
	for ath12k@archiver.kernel.org;
	Fri, 19 Jan 2024 12:13:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnkc-005SJ4-1V
	for ath12k@lists.infradead.org;
	Fri, 19 Jan 2024 12:13:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D5BA618F6;
	Fri, 19 Jan 2024 12:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AB2C433C7;
	Fri, 19 Jan 2024 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705666381;
	bh=5mZvSN4DyG3Cb3bpfo/8I2ddlUZ7tMZETXAVvjEZktk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QlP76Aw9voyycdSq1hz1Idl4X3pa7gS8KRuLC62xnItZ70i4kYlLTd8X8llRbE7o7
	 E2jMuaNmkBIB8lXp4JZRRRzqJqfvPleXbsI3wM4s2UmHBDFQ7Gu6yIgexq+92F/Z1S
	 ip/h3tNwyoSy0vO4uI66Onwy3A9jvDEDFAYxAloCEh/wP7pNHyL/tjMVMMh1Whbdj/
	 t+ltQ8+k/1Fz9GcdbSOroCkQ5PyPz4Hkxt3Duz/Pux3isBjSP2SabxdKWjS2TdNQ0g
	 HgPVTnkh1Jpyd+2bG8OpcFSvfHuGu9fy4317TTUy6gZiwwmNywpFVagRozPqdM3QBQ
	 QtQpPzaq/gegQ==
From: Kalle Valo <kvalo@kernel.org>
To: GreyXor <greyxor@protonmail.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Subject: Re: Difference between WCN7850 and WCN7851 ?
References: <r_LAIMwF1YgGlpJWWQBKCsCqurisqY5ZzmPQ0QesUAXwqziwlbTWt8NLn0DA2fJAL9ukIX2T8kHs0pOABysXUcMDOh5RdRgBu4mAg6xCeuM=@protonmail.com>
Date: Fri, 19 Jan 2024 14:12:58 +0200
In-Reply-To: <r_LAIMwF1YgGlpJWWQBKCsCqurisqY5ZzmPQ0QesUAXwqziwlbTWt8NLn0DA2fJAL9ukIX2T8kHs0pOABysXUcMDOh5RdRgBu4mAg6xCeuM=@protonmail.com>
	(greyxor@protonmail.com's message of "Fri, 19 Jan 2024 11:36:48
	+0000")
Message-ID: <874jf9frn9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_041334_572704_FA619725 
X-CRM114-Status: GOOD (  11.57  )
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

GreyXor <greyxor@protonmail.com> writes:

> Hi, I'm interested in acquiring a WiFi 7 card for my laptop, and I
> came across the Qualcomm QCNCM865, which is Qualcomm's WiFi 7 card.
> Upon checking Wi-Cat, I noticed that it features a WCN7851 chipset.
> However, when examining the ath12k/linux source, I couldn't find any
> mention of the WCN7851; only the WCN7850 was referenced. What
> implications does this have? Can I still obtain a WCN7851, or would it
> be advisable to opt for a card with a WCN7850 chipset, given its
> greater number of updates and references in the kernel?

I don't know what changes WCN7851 has compared to WCN7850 but in general
these changes are transparently handled by the firmware and the host
driver just sees it as WCN7850. But I hope someone who is familiar with
WCN7851 can confirm this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

