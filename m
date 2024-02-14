Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D5CC48BC3
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 12:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wanLfYbJ2tHdQIp1/CiOHnZb98Y6ccSrG3y2MEXG+/I=; b=OdNTfypUvKy65wIwySZmsgGXiw
	b41n0m1HsIjti30vJ8ZyPMoMcYdQb9qXlScrYLqTaTUVrxcxNt6dJrCC2qm7ESg5Jj2MaJijJSbab
	elY8CpSWdhWSP44iTJbs3Knh/KdGzqJyJFhTWreUIxvQyxyv73mCtPmByLSgLdQx5I0XebN03eOjn
	cwrrBrAMV4bDeSSB6b1GFUaIjKSeyHTBf5Qiurq1iMd5KU5VyIN6EOGSn2hIXndu5yYiZ+pkZUppL
	yx0mDOEmViSkYA8qbl5eTUxDynQb9sgBF64Bf4tNObBUZkZgyEEfpKBnOrm4tBDfDVXR2bh0+GOoa
	d1SPYRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEH9-0000000Cmrp-3pvl
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 12:22:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEH6-0000000Cmoi-2JF7
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 12:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C87E0CE21FF;
	Wed, 14 Feb 2024 12:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DED9C43394;
	Wed, 14 Feb 2024 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707913322;
	bh=LwkFI7+p8oCAuVQnG1sefqZieJrN8VzUlf25gAJ1Yq8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=d7Zu30X57/BUn6tN++GQwykOX1zQ/ldlz1/4mpNR/fWZTQDtLONUoVNnzg6kHhmEi
	 oJS4KUlnDqog/S5cyA4FpylbBbMRgDSQY8oklsPzb6C1PbR5X3i2yI98pFWpxETpMi
	 S7tXQVKsiV/hM505F9bWzvUkW081aofqJouSEt2TawT4uQ+r+KLl3HFvDunSyb6ecw
	 /ivOXN/5nc7dPr71QkB4VRi9bDngqy2c3sCXHShEnsRG4rA7B76xmCnxDREiJ2g99i
	 sHL7aRuTwDt0Fudxc8f9uEXWAHoLnoMIFQM3Xp7merrX9XJeIjwREHLbUgBRmZ3laA
	 51SuZ1SCiDi0Q==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>,  "Jeff Johnson"
 <quic_jjohnson@quicinc.com>,  "Karthikeyan Periyasamy"
 <quic_periyasa@quicinc.com>,  "Aloka Dixit" <quic_alokad@quicinc.com>,
  "Wen Gong" <quic_wgong@quicinc.com>,  "Muna Sinada"
 <quic_msinada@quicinc.com>,  "Aditya Kumar Singh"
 <quic_adisi@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: sanitize ath12k_mac_allocate() return code
References: <20240213100912.459018-1-arnd@kernel.org>
	<170790025305.3179441.138152315558305278.kvalo@kernel.org>
	<08ac32ef-610d-479d-a3fd-a3c3b8c4c697@app.fastmail.com>
	<87plwze34l.fsf@kernel.org>
	<d9a7ad2f-c9a7-4886-8bbc-7a77771c0aec@app.fastmail.com>
Date: Wed, 14 Feb 2024 14:21:58 +0200
In-Reply-To: <d9a7ad2f-c9a7-4886-8bbc-7a77771c0aec@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 14 Feb 2024 11:51:02 +0100")
Message-ID: <87le7ndymx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_042204_832673_B70D552A 
X-CRM114-Status: GOOD (  15.58  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Wed, Feb 14, 2024, at 11:44, Kalle Valo wrote:
>> "Arnd Bergmann" <arnd@arndb.de> writes:
>>> On Wed, Feb 14, 2024, at 09:44, Kalle Valo wrote:
>>>> Arnd Bergmann <arnd@kernel.org> wrote:
>>
>>> but I see it's not in linux-next yet as of today.
>>
>> Yeah, it's a problem that ath.git is not included linux-next builds. The
>> commits will be in linux-next only after ath-next is pulled to
>> wireless-next :/
>
> Not sure if that is intentional, but if you'd like to change
> that, you can just email Stephen Rothwell asking him to include
> ath-next into linux-next as well.

We haven't done that as Stephen prefers that there are no "next-next"
patches in linux-next during the merge window and we don't want to stop
the development for two weeks.

But this is not the first time we get duplicate fixes due to the first
fix not being in linux-next, so we should fix this. I guess we could do
a similar for-next branch trick like we have in wireless-next? I'll talk
with Jeff and we'll see what we can do.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

