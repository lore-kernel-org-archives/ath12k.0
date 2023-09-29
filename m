Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BCE71D2F
	for <ath12k@archiver.kernel.org>; Fri, 29 Sep 2023 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sG3p8vyXwHEz0Nlr+7Mkczwol4mFG6iNCyX6t88ol10=; b=hyHpzwc6M2e3Kz
	cY6mKFDGcVxOqr6N9wa4L2/HIgc4DfpjeRLvlXKjTDCjXgebT9Gl1RBqTn23n5tAXas92+ILpdo/1
	aTgru8s2/RPx0IWIgxY6gBkQZxYGmjYAxl7tJz0eljFsHbh/K2QeNE4eJWugLRgY+LQEpxTYd53z1
	Bvgf/kDgd3yxCbT3M5zClMi9Bus7JRkrGGZ1UhM83k0m7/vVi3KSSxvKUW7yxNaBotcnETpHUfSbi
	VexlATFrJHSe0pZEwdUii7u7Ez0Z+levihEkX4QvfjSOg+Y3FK+PbZ7RYUNNhwMMuk3dYmJsvfBb4
	/QjJXsiC71Z53zVvafSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDHo-007wJu-2n
	for ath12k@archiver.kernel.org;
	Fri, 29 Sep 2023 13:12:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmDHm-007wJF-1x
	for ath12k@lists.infradead.org;
	Fri, 29 Sep 2023 13:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B119CCE230B;
	Fri, 29 Sep 2023 13:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05079C433C7;
	Fri, 29 Sep 2023 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695993120;
	bh=VwhPo7thtDa/O3CwoVZUwDUOz3iWStVOolqNk43Hng0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KQhlqnlzHYnCxgZnIW9X8aFZgEi9U8sT0BW1GANF58FKrfu+sSfpQv0R3Pa+N0OmQ
	 HGGEjkkK0YBKekHzvjVJcT9IDGys2Xhv+jbXgNIaUJVRPfFA4VU+HgaH4St6amIDbo
	 bAz2ami/q+6JViwsgJd6PNHFfWCuUnoYtpmT8h1x6PqdIuKynncE3NihJVkybtGZBf
	 W+S9Ask6O5DLulssR49E3x1jMcDHo668+Wtv4YObQYtnFE5mF7s3ULQ+gezEsAoJgd
	 OFFuyBtlOpcFezsbjZzNsUvWNfOwfMrX+ARGCivgdGq8nDHQhcFFXPn9ALxyZ0xmSu
	 wnCAsStonn3Vg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2 0/4] wifi: ath12k: add 11d scan offload support and
 handle country code for WCN7850
References: <20230914090746.23560-1-quic_wgong@quicinc.com>
Date: Fri, 29 Sep 2023 16:11:56 +0300
In-Reply-To: <20230914090746.23560-1-quic_wgong@quicinc.com> (Wen Gong's
	message of "Thu, 14 Sep 2023 05:07:42 -0400")
Message-ID: <87ttrd6s4j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_061202_815712_8684FD1F 
X-CRM114-Status: UNSURE (   9.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> writes:

> v2: change per Jeff.
>     1. change alpha2 length from 3 to 2.
>     2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.
>
> Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID which is needed for 
> 11d scan offload to firmware. And add support for 11d scan offload for 
> WCN7850.
>
> Also fix firmware crash for country code set for WCN7850 and store country
> code for device recovery for WCN7850.
>
> Wen Gong (4):
>   wifi: ath12k: add configure country code for WCN7850
>   wifi: ath12k: add 11d scan offload support
>   wifi: ath12k: avoid firmware crash when reg set for WCN7850
>   wifi: ath12k: store and send country code to firmware after recovery

Patches 2 & 3 had trivial conflicts with rfkill patches, fixed in the
pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=3261a8fe9de8fd5a94215eaf0c8738c3f0051105

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=0f82a7f8a8d1944faea458f992d492daa74a968e

No need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
