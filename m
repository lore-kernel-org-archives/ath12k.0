Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF8FE7717F
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFhMu1fwbpGC/2f9UEuLOTe/A06fLH+an0c7D2VqBpw=; b=sE0YcO/AyxGp6OfgN3AaXABicR
	06kP1el/yC7N4hMHenW721PcB8KJYQIv8l9p/0V53pwt12fDpkoqgKFuLUVI02VS2ZdDs2e1vkDAU
	gxXg92mIbgXSfdNnfuz9LKJ0oaUdKA21j5xbFQEa8bCzbPQBqTIxS+29mErkDbOAM021vyGwEn2XZ
	tY6F30M3PTtwMsc9cb/EJOVTynuIKMEtsy/cn5u6z+GrdjtLpaEs3s29c2jgZQC/TFP0bQo5SZDkN
	NoihqfCe/3AGlKTgB/XIeDChZlIIBMMNDIBTaF7KtN00aF3NvXr3LrLShjsdaRv5QJD0GIIeeY/wI
	+gA6cqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZcB-0000000Dyl1-0FwJ
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 15:36:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZU1-0000000DxLP-1UeW
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 15:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B614E5C3FBA;
	Tue, 17 Dec 2024 15:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CB3C4CED3;
	Tue, 17 Dec 2024 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734449256;
	bh=X6fhOCIws3YMr58Boun0EIq/EQYH3sARWR30RF1nuik=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LXmfk+g0k8nqUIPgdc6P4Piy783E65cTIdYdt2UwRTum3bsO0mKgRrvqehX9pu0/e
	 4ySj1CjCMsDlwL8tstxkCoAX8EDu5MF7auqwEt8KqLhTxJpXFOnvebSPyKenK5ie/z
	 CGRsyu8lyWNfwQnt3uo6wTKWtbUNv1+d+sfcS4qL/GEa4kWB7zhJ9QKUUe5w3Xyxin
	 fpJ51Ntw/GACYvigo8wM+2QXUoZRYggiMkf9Il5VG+YoaRRWfx6uAMCY/4d+/MgNb3
	 WTk2x2EoWqV2vvy4vbnGmx9dljn1sY9hvlabxuGl4la1is9fY+eGmcs4noJDi4sx1+
	 LeV01bgvpaetw==
From: Kalle Valo <kvalo@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  ath12k@lists.infradead.org,  kernel-janitors@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] wifi: ath12k: Fix spelling mistake "requestted"
 -> "requested"
References: <20241217105505.306047-1-colin.i.king@gmail.com>
Date: Tue, 17 Dec 2024 17:27:33 +0200
In-Reply-To: <20241217105505.306047-1-colin.i.king@gmail.com> (Colin Ian
	King's message of "Tue, 17 Dec 2024 10:55:05 +0000")
Message-ID: <87pllql47u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_072737_431771_A8F446AD 
X-CRM114-Status: UNSURE (   4.64  )
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

Colin Ian King <colin.i.king@gmail.com> writes:

> There is a spelling mistake in an ath12k_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

My bad, thanks for fixing it.

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

