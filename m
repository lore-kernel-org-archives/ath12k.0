Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044FC52D70
	for <ath12k@archiver.kernel.org>; Tue,  6 Aug 2024 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/sv6gYkp7yTjivrZVJtBmBg2T3ZWK+a7WwzkedgCgi4=; b=dQ6dYWU1dYpvFr1DWFkk7mh26s
	h9DqEheZDSE/75uN5qLXa5z6jqFKaow2f/K4F87NWrStvbipoD0yT1krj63gDETACSI0t/NgIOXuY
	nsT6yxB2texATISsM0aW3zaZx4a/wUwHsGiwMW2wfksS2KkAYbfXJ/5Who55rbc2UPIRfk8FjELlw
	2IU67367K9ILeU/Vnpd8a9Fc/Utuy8sPlQ+TWYIx1tjLo0cW+wFxjCzB1YNuSXjlkH2IC3MKlsbOD
	SsoS3QGO1pRv8eUnxy+lFFhOCSOSgP4pbRuetTkBLFCWePVBtD7fG1ySB3gD6kYyA3FpQ2ACoPVOL
	9hCIJmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMXK-00000002FJS-2cuR
	for ath12k@archiver.kernel.org;
	Tue, 06 Aug 2024 15:55:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMXI-00000002FIN-1oUO
	for ath12k@lists.infradead.org;
	Tue, 06 Aug 2024 15:55:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C319CE0CE8;
	Tue,  6 Aug 2024 15:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20337C4AF0D;
	Tue,  6 Aug 2024 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722959741;
	bh=/sv6gYkp7yTjivrZVJtBmBg2T3ZWK+a7WwzkedgCgi4=;
	h=From:To:Cc:Subject:Date:From;
	b=AM6gUj4zDo8RBtW/yokd4Wp3CxllTGy0yjxcNIbFloc1CEQc8GSrusZ/bNNJCEZ11
	 BzxwBuxP3TNzIZ/+i9lNKX25xgFeVpivK4mR4ZZX5NB19E4e+DVlGscpUdHq4lBgBz
	 w3VuODDqaCYQ8UnNzygR0BIUbn1M1vqk1Wt43pzA7Vmbdmy9HopaQRBKlW9ryvZ/eJ
	 tp+8FsBCXSU0MUf+PUJA8S5Z9ftkcP7Ub3nOnKai5Tv0AyqI5QTnwmoecJ0KJ45qAW
	 dkPMhAajKPvKsCjWnqZnE6Swpg0xdW3u8CQIcD/NZQY2mVW44H9ezUHAB0ERXjWt2E
	 QzamZ+4dVd3bg==
From: Kalle Valo <kvalo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
    ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: linux-next: request to include ath.git tree
Date: Tue, 06 Aug 2024 18:55:38 +0300
Message-ID: <87ed7163yd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_085544_668007_B0FBCD1E 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Stephen,

ath.git is a tree for Atheros and Qualcomm Wi-Fi drivers residing under
drivers/net/wireless/ath/. Jeff and I are the maintainers. Over the
years multiple people have been requesting including the tree to
linux-next and finally we are biting the bullet.

So we are requesting to pull two branches from our ath.git tree to linux-next:

git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-current
git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git for-next

for-current feeds the wireless tree and for-next feeds the wireless-next
tree.

Because our for-next branch is very active one problem with is that the
chances of having conflicts between the branches is high and that would
be extra work for you :/ Do you have any suggestions for this? For
example, should we create temporary merges for you or something like
that? Just for this reason we do try to keep the number of patches going
to for-current minimal and only take important fixes.

Kalle

