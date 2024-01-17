Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8905C47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/soqrlL1jVYYiE5ZP9x2aaQXAVgI+I2vH40YX4brxN8=; b=KDKLcLmLzCULh3qMW9ur8FTrCq
	sfTD6JScxPeXyVilTpoHPvGWdvmg3ciH2wFxH+F5Ob7z4+NeUFSh3OTQj8xSq8NC2eJRwpnAbx00B
	vA5InHp9yn9Urqk32KyUJdgy8wH59stqK+94gMgbypV1Bx0KSQhtLx4fRzIQCBQNgqvZI71H8Krkt
	D8W4hubrGPidjD76SMbsR15LyD7AYFUxU6wtfClK0djLG3N2GdYG5pWJM7XiEmTNisJLkPT9FIqE3
	vx1n7cwygdY1LqAThPjCceOq9oZu3DFN0kKPApCDqGIGp71+2jQafq72AcnMFh3z3kaNm8oitIfDx
	bezA9UrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6Fv-00Gghj-14
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 13:46:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6Ft-00GgfE-0C
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 13:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B5550B8116B;
	Wed, 17 Jan 2024 13:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E72C433C7;
	Wed, 17 Jan 2024 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705499215;
	bh=e3JTofgI2+PhasG9mKkzSWi1yrgoiuyT4q7TbhSdBq8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EJg/+hFgLtiLLcBu6fyJinitqbBTGn25BNaE/vgzRaHObfB/nJZvG3JjKOVb0POr9
	 ZKEHoEz/+W3H9GVzbbkOaISdGvpe8mIlID6JSzyexFJeOwbdlv6GEmkYZ3Op6cMDnn
	 VnqNhjjjkuMf3Uj1PqTef1Pk4IjuV0b23sJrlQQRlYo/+IhCCJ6XjqE/cw/uoNhypi
	 LCtPZTijIYCvrKYatB+/FefLWOvCLG4Q4Xo7kRjb9a0+0lDcx+FCKghBdK4CHHZS1q
	 ux6o40PcjxYGlN9i35DXQjc/KZEIB4YNKas2Jp9CM43koLDMHYcZK2aZU4gp9yghd1
	 iwvyL5vvDX9Aw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] wifi: ath12k: some improvement to RX throughput
References: <20231129020414.56425-1-quic_bqiang@quicinc.com>
Date: Wed, 17 Jan 2024 15:46:52 +0200
In-Reply-To: <20231129020414.56425-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 29 Nov 2023 10:04:11 +0800")
Message-ID: <874jfc5ayb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_054657_284040_B2907FB7 
X-CRM114-Status: GOOD (  10.90  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Some fields of hal_reo_update_rx_queue are wrongly
> defined, fix it in the first patch.
>
> Currently the maximum block ACK window size is 256,
> with the second patch, it is extended to BA1024.
>
> The small MAC buffer ring becomes the bottle neck
> in RX throughput test, so enlarge its size to get
> a better peak result. This is done is the third patch.
>
> With above three changes, more than 6% increase is
> seen in RX throughput test.
>
> v2:
>  1. wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
> 	no change.
>  2. wifi: ath12k: add support for BA1024
> 	a) s/doen/done
> 	b) update struct hal_rx_reo_queue_1k
>  3. wifi: ath12k: change MAC buffer ring size to 2048
> 	no change.
>
> Baochen Qiang (3):
>   wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
>   wifi: ath12k: add support for BA1024
>   wifi: ath12k: change MAC buffer ring size to 2048

I had conflicts, please double check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=1ee7c1872873d82a71e05a4e17cbf9a569bc8ec9
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=4d75db679457b5b7e04271f5174d9128d7d73ecf
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=db549be42740d286ee6ec8b2860b4e4789be2167


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

