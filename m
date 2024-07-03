Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D684C2BD09
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 07:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOlTCn1ac2PPG/bpncXmp9ZuSwyu+8pMYDPLnR7JrpM=; b=4YhjaXOl6X56Q3XHj+CZhrb86m
	po4uwUFdiuoRLNVu9ft0/dazudRVzcmei0USyOfRY5slFCODwwEX2zckwPWHQeSggt+dlt07kRH+W
	426mO0Q3l+fAHGCIPyi83O2puAXfTyXOWcI6ddEmjzvP1oX/5zUblwAjaGRcZH3IOE/gzg6eHXOcv
	i8I0il4k9IxRZ2X2NGsZoP6nHWBaDzbI0tlUo/i/UmIyWEyG1ADD3Vw364tgXQKy/Mw40OvyJUsja
	X8TS6/bOrCkmgSP/ShSsFmrTMiDuJ5zkklnodh11rqa163xg1SbpSgGn8ILEgz98kCGFahdHz+xSA
	ElnAmyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOu3U-00000009HmL-43SC
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 07:05:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOu3Q-00000009HlP-33XY;
	Wed, 03 Jul 2024 07:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB565CE28F2;
	Wed,  3 Jul 2024 07:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660BDC2BD10;
	Wed,  3 Jul 2024 07:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719990322;
	bh=ttPIAI/HeeNok4sKnKuFGFXX3xPe6Pu0oAmIpSTF4L4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CJ8MtdbL6/+1VSpLnr4PE1his6MGogfBNWxPbeWu+Kh+G5oQKlQqBqiu7CkA4swNs
	 QQ2byqpRN0M9VRi2yNnd+vgrj56SQaZIHfq4MHhV5bA5bTTilHXnLJej40qFe5CeRv
	 rGVUkMV/bJNP2hV2lfU/T8jBp67HQ2H8IY6AyiBLPpFrT7DouQhuyuScxV8x/umO0t
	 i/sGx5MLFJcCiC42Xc81sGCs3nYZ6myeONAXexpqzPRsLNWZEDVv0Y3mm6Y7UHK6ho
	 +1HDfmQwTCqW3nkg/A0+Lt1m+Ivk44ghhcVajPrqUF0/aRGsdCsGm0QVrhRy6nNutZ
	 QovB3G5s/FmOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath10k@lists.infradead.org>,
  <ath11k@lists.infradead.org>,  <ath12k@lists.infradead.org>,
  <quic_kvalo@quicinc.com>,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Subject: Re: pull-request: ath-next-20240702
References: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
Date: Wed, 03 Jul 2024 10:05:18 +0300
In-Reply-To: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com> (Jeff
	Johnson's message of "Tue, 2 Jul 2024 13:44:56 -0700")
Message-ID: <87zfqzdkgh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_000524_970292_DD33A57E 
X-CRM114-Status: GOOD (  13.23  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> The following changes since commit bb678f01804ccaa861b012b2b9426d69673d8a84:
>
>   Merge branch 'intel-wired-lan-driver-updates-2024-06-03' (2024-06-10 19:52:50 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240702
>
> for you to fetch changes up to 5344fc76f8944249026884157f846f88489edfc0:
>
>   wifi: ath12k: Support TQM stats (2024-07-01 21:57:28 +0300)
>
> ----------------------------------------------------------------
> ath.git patches for v6.11
>
> We have moved to a new group-managed repo, and this is the first pull
> request from that repo, and from me. Fingers crossed...
>
> We have some new features in ath12k along with some cleanups in ath11k
> and ath12k. Also notable are some device-tree changes to allow certain
> ath11k and ath12k devices to work with a new power sequencing
> subsystem.
>
> Major changes:
>
> ath12k
>
> * DebugFS support for datapath statistics
> * WCN7850: support for WoW (Wake on WLAN)
> * WCN7850: device-tree bindings
>
> ath11k
>
> * QCA6390: device-tree bindings
>
> ----------------------------------------------------------------

I see a weird warning from gpg which I have never seen before:

merged tag 'ath-next-20240702'
gpg: Signature made Tue 02 Jul 2024 05:55:42 PM EEST
gpg:                using EDDSA key 3F9AD487CCF522D7A21F0C492C15BBA0898CCB7B
gpg:                issuer "jjohnson@kernel.org"
gpg: Good signature from "Jeff Johnson <quic_jjohnson@quicinc.com>" [full]
gpg: WARNING: We do NOT trust this key!
gpg:          The signature is probably a FORGERY.

It first says that the signature is good and then claims it's a forgery,
odd. Is this a problem between using different email addresses or what?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

