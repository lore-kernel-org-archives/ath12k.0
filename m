Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E13FC27C53
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2u9WB1s9glTTLQDxIdiIGAHHp1sx9puuDPMd2vnsac=; b=NJn/zcNMAPUE/oHN+DdpxhQYO7
	kYqWHzdxcv6cU6rhkZpMUOgFl8hHJvXNDMGhetErq65eKoZKti42+lVg0xYTJIsuFcDERyT6CC7+F
	gSvQO73s/6atBR2QMZYV74oLhAooLRr2HRqiYMY97kzy/BFun3HXaro3tJ+NQQKFqXGfwwy02r62M
	UZLkzmun8Ns6TVRJR9578Ts9vZ2Z3dSL8zCdQIqgU7r0An9HvHEu07tUr4BT87IrJRHMarc4sVXL8
	MWOvmO791qDtiUPxmbpgDmr3LHa3fK+FiP5Qefd3wjQroBstH/yYC7H3+V27bH0JRT5E7bFQYDTRy
	4HAK52AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvt2-00000001PjT-3NJ2
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 14:02:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvt0-00000001Pio-111T
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 14:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7B8861E30;
	Wed, 19 Jun 2024 14:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278CAC4AF09;
	Wed, 19 Jun 2024 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718805725;
	bh=Av3irBLT/qJrLnpsPEfk2KQnfhItJzwZDqPrVXcn1nM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DBuU4uDzMy9jpF3+Fykqt9QGwaNh21Z0dG769q6cF0tqFn2vfhwHK+t/+9JfKb28P
	 fafzaLXwA0Tm7iAB7g11cOnHYn3sZOvqkhXb7iOiKk8QegsFfJpUmQtPvqHXvsqy93
	 YbBpHnrVda+kbqZ26mzwRUNyRRji/Y/kalqBpHTVaw7TMWaOJsA4/qqJ3NdX5VfjWU
	 9vgubJGiQNtVrY7ov6Iijtxin0sG9iyA8EnwZ1VEC3Q1x+IJxbnnmIqTgiL8XRjhBh
	 g0LcjQ0Nm/1219+xfZYlkd0H3ouGRz1QOEzTNSS/x9r9pGhcHnXerYpVzrW2j8yBT2
	 DENgEd5TcgIdQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix legacy peer association due to missing
 HT
 or 6 GHz capabilities
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240612225336.2303119-1-quic_pradeepc@quicinc.com>
References: <20240612225336.2303119-1-quic_pradeepc@quicinc.com>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>, Aditya Kumar Singh <quic_adisi@quicinc.com>,
 Zachary Smith <dr.z.smith@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171880572225.581414.15884241377177036601.kvalo@kernel.org>
Date: Wed, 19 Jun 2024 14:02:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_070206_353865_55A79D7A 
X-CRM114-Status: UNSURE (   6.14  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> wrote:

> Currently SMPS configuration failed when the Information
> Elements (IEs) did not contain HT or 6 GHz capabilities. This
> caused legacy peer association to fail as legacy peers do not
> have HT or 6 GHz capabilities. Fix this by not returning an
> error when SMPS configuration fails due to the absence of HT
> or 6 GHz capabilities.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f0e61dc7ecf9 ("wifi: ath12k: refactor SMPS configuration")
> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Reported-by: Zachary Smith <dr.z.smith@gmail.com>
> Closes: https://lore.kernel.org/all/CAM=znoFPcXrn5GhDmDmo50Syic3-hXpWvD+vkv8KX5o_ZTo8kQ@mail.gmail.com/
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Reported-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3005c63a3673 wifi: ath12k: fix legacy peer association due to missing HT or 6 GHz capabilities

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240612225336.2303119-1-quic_pradeepc@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


