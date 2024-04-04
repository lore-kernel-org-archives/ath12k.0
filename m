Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E17ACD1297
	for <ath12k@archiver.kernel.org>; Thu,  4 Apr 2024 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/pMhZAW3Y/wYNasiZn2aIiHZ059ZdNZjNOx9W9lId0=; b=OPtp3sy2r6Cmzl09nSzLqKCOIr
	3GlJhOdnFfopKo6IoPdZkZS8Nhhh3unnTdaMvX1xmGjJ0w7l5JpPOKHpVWC58N3HZf9LeNhnuuBCX
	AZ3Cxcs8xvQc+FxPPfUGkMFb0nZN7cl0hBwAjOVJYFkMhzBCfQQHOSO0F3MBi6u3n/gFdWshAViul
	w7Kh6cI9EfhZ/mYir21DnDVPeEr7YwgsxJEmMnN7tq3PuMMGkLQteXrkrRcs92ilo0kNU44IIZ4VN
	sBrxUBUx1huxgJGahWnyYeMvnCJcQ/18/jnxN3bmmrj5naKxRg8qDdVPnEA6iRiuFDkdULdf/A/k4
	tmVWTMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK1I-000000027zP-0gE9
	for ath12k@archiver.kernel.org;
	Thu, 04 Apr 2024 10:08:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsK1E-000000027vv-1pyg
	for ath12k@lists.infradead.org;
	Thu, 04 Apr 2024 10:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD7D8CE3085;
	Thu,  4 Apr 2024 10:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48DDC433C7;
	Thu,  4 Apr 2024 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712225306;
	bh=iONgwx5VKFrj0a7+RUjApCndLdD/ZOia0aT6oUbbeYM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ocrj+i/PpSM3aZ9cn/EaHoL0/p8pEYyx5j4+kMw+LxFQMGNicrMx8QssPq+9XUxfG
	 wGLjflwrO2V9VKKnk1+aYU42KI4saB7ArncgW8W2xiozX9yGi0COG5kVIrtBp5dC46
	 VtCWJaBODU7fAC1vnYuZ3Cojud/xKXc4xBkCHQ7+j/hkKJPZD0BZNov2KD9icpp9Gf
	 7aScoBqNv62EB3zOYANBDzn89D94pc+OpVyvDFxzYCPZ/nnSC/w6a+ljyehJcz3ga7
	 JjD4+gATVMtGTeUhSO+VgKQ5q5uXLqL4JOVOuRqVeK17+KSON4DLg4lmOwFLjOG/k9
	 XGxhJSe/EGm/A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix missing endianness conversion in
 wmi_vdev_create_cmd
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240322003726.2016208-1-quic_miaoqing@quicinc.com>
References: <20240322003726.2016208-1-quic_miaoqing@quicinc.com>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171222530320.1806092.7305157488548373424.kvalo@kernel.org>
Date: Thu,  4 Apr 2024 10:08:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_030828_682889_E02B07AC 
X-CRM114-Status: UNSURE (   4.70  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:

> The WMI commands are in little endian byte order, fix missing endianness
> conversion in wmi_vdev_create_cmd.
> 
> Tested-on: WCN7850 hw2.0 WLAN.IOE_HMT.1.0.2-00240-QCAHMTSWPL_V1.0_V2.0_SILICON-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2adcddd8a316 wifi: ath12k: fix missing endianness conversion in wmi_vdev_create_cmd()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240322003726.2016208-1-quic_miaoqing@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


