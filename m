Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F061EE7718A
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4b/GwEWm+9w4CSRO+tUSN0co/GBg9klsQwEmvZ/Mso=; b=W71u9Cv2Fi2DpUvP6Y+6d72KYA
	Ph5YFA13jk2YOl8P2xKGcA4ssUETAyF53/z+XYAQcAzf8/HSIO8jUaggPbD5Q9EIfd5Jjc1u9x6Vk
	2g13eVPe+kArsVmzJZBgZbJBc+gnnJsDvqf3Y3Tmivj2rm8ZA0ZW1N2cRV2Nz7FTU3P7OQPnwvodx
	fICJl6W8mAyzNCBMF61cSdGywelwXdFloA1+6pju27Mu1+SwbGAyzo/RGJONvUWlDWG9He3K1t0Xd
	jYf39gw+ABtk6Aws28GIjPxVKLmWVJMBEY1osVw6N9/ZGjAFM8YTUSa9lFr0ItaAlmCJ+X6czf8bc
	LwBWOglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEpL-00000001gRW-39QK
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 11:36:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEoZ-00000001gK3-48HE
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 11:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85C64A420B7;
	Thu, 19 Dec 2024 11:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FC1C4CECE;
	Thu, 19 Dec 2024 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734608134;
	bh=kbH6nhNN0eEhQyKdjC5OjHTpVmzHeem5S4mtKwEHvJ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WczcS8kHmT8/iiOvbPSVOUXbPyDSaY/65UY2UYUAwuZTUvscB8xO5zrVO4beNWvln
	 hNsWyQqvFdd+z+wc/e8gx0+Hqbqwd0xBenLrAH5b6pvW3otqKduk5i/+x6Q0OES9GI
	 hBdpxgwo7q2QY4MgQWsqlr+0h3o4SfZmj0M0P4Ulj+Vy5kkjsb6AzvuURTlF4An4NE
	 pD0o1rutiXCD9dZD7iSbBjYHS5IuX+NCceLdZ29MxFQEV8zs9JkzSTMYWz9Tt/kXDA
	 golEgsdct6tz99SRn6h1tPXHIzA7FAFHddui+mbfnp6ZiANM29nEUve3HqAnNuGLd2
	 8d85lgCpaOlPA==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath12k: Refactor the monitor Tx/RX handler
 procedure arguments
References: <20241219001006.1036495-1-quic_periyasa@quicinc.com>
	<20241219001006.1036495-3-quic_periyasa@quicinc.com>
Date: Thu, 19 Dec 2024 13:35:31 +0200
In-Reply-To: <20241219001006.1036495-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 19 Dec 2024 05:40:05 +0530")
Message-ID: <87o717j470.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033536_142292_64A3AB16 
X-CRM114-Status: UNSURE (   6.68  )
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

> Currently, the pdev handle is given along with the mac id to all the
> monitor Tx/Rx handler procedure arguments. The mac id information is
> derived from the pdev handle itself. Therefore, remove the unnecessary
> mac id argument from the handler.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

