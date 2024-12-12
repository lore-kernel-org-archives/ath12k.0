Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6140DE77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2eMvU291GdLpGosYTmNJSeXZQQFTmjOgOqAF0EYYTI=; b=AWuOSH9dVOdmCpQjqzLTvRPG5c
	2nhkK4x1UnXypGYj0T/aRA+uDwiqXa1eerl708rplcKUD8HuI5WPyKOUOywU0L0w1EqhnbCK2yaiz
	n5S93tIcTkp/MIdkZdjiKMhaIk+XNpkxkY++YmCUYjp3AlcIy01VJK+wBn2cetS4pTNSmdam0lQCc
	M86xYrx7qCTfUGgJueES1ElGzRSO0blwto5Z82joHD87YklaAbZFETHZiQM0NEy2FAAWGptHmLN6D
	DHVSzHYkuqy6A37h2u5aLxBrIT0OLaHguZoCVQ8T+n3LscWQO4/FGhS9/Hsc+PfKQlZmlAWaedbZ4
	3LujFOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLduz-0000000HCDo-0gqg
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 07:47:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLduw-0000000HCDR-2syQ
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 07:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0EFE5C42BC;
	Thu, 12 Dec 2024 07:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3841C4CED3;
	Thu, 12 Dec 2024 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989645;
	bh=EdnkbNF2Mlev9vCi8Q3xsS92gcktwZrJwJ/KyMHrPe0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Kr8i8xILaCgvuvofBGCdMGyNh0iC5n0z0uTF+i7O/VU4ojfzLAfbZopWeQhtBc6cE
	 7lwuI2XQBL5lyV0KfZzv7vSyUbjjye0Gu3DQi5AGFHd9xO9cFvtAD1luzZRVZ2PxGi
	 LcHIMzjcehgg3F3cXqYrsELiQqkQPRJ/3YDwxK2YLZ9zn8vmZEhsf7jmbRKkvNojta
	 +o79PgoM1noOFHpBwrh8UrMzWFFigGR4QhCZuL5LJwO7PMI410Zqy+RXZUC3vC33FB
	 xMWSJgtbPKk6RjKd4BCZeXTC8F04bpAqFDbd6vmVY7PifWrOA+XEm0Mf0/41AVdOFq
	 HFxbO1Lr9Mg+Q==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/4] wifi: ath12k: Refactor the ath12k_hw get helper
 function argument
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
	<20241212004906.3087425-3-quic_periyasa@quicinc.com>
Date: Thu, 12 Dec 2024 09:47:22 +0200
In-Reply-To: <20241212004906.3087425-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 12 Dec 2024 06:19:04 +0530")
Message-ID: <874j39qr5h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_234726_766483_97005D4C 
X-CRM114-Status: UNSURE (   7.40  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
> ath12k_hw get helper function takes the device handle and the index as
> parameters. Here, the index parameter is specific to the group handle.
> Therefore, change this helper function argument from the device handle
> to the group handle.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Why?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

