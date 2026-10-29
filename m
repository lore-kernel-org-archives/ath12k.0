Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60B606A31D
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MoCGjZNb;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FAr0qbl3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3DfZm/w12ULeMupryJ5ey+oHJ90wNbLMae75m53Le94=; b=MoCGjZNbpb6ykz6+8JoFLaEY1P
	fnTmsSXa7f0GH+5hRA+/PWR0XOAkwNiWUuwd6OR9R+CmmD+BlQPbm5GCypMMwkiTvBhm5CXH8mr8Z
	x0lNo4rbk+Y6rkDDtb73K1UgJqhViVYzC0SFlvqgnUtP0y7JrVLyvcotDwHJdKQkP+S/FfEgIsjkt
	h2ibak8YQz42vZTPwIYlGoqrkZQ/gra7Spb+JUerLC1n/ImrzbDzcG2wYjp3ZsJ7EhUK3T7Uh9CJB
	UnBQneLPLUXI2On3TqfelHW/SwLQ+LNRZpFiawjhSsjjDQteIM0Ui4A91neOA15gggMrhzFMLPMfY
	/iV3zWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN9T-00000008wFI-1mnK;
	Thu, 29 Oct 2026 10:14:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMN9S-00000008wEv-0qQS
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 10:14:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0807B41842;
	Thu, 29 Oct 2026 10:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2111F031E1;
	Thu, 29 Oct 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793268868;
	bh=3DfZm/w12ULeMupryJ5ey+oHJ90wNbLMae75m53Le94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FAr0qbl3Eo4a4LO45fLZBhLWnUbpSdL9YT5QkLBXg3MC6MgkJoml6IqrxpRBkVvOE
	 xeBV7ROlUg5yn57vAdfoY5ZatyiPkHgLjzMoSH+cFwsVlK9S9Vs9AOXoRp695yQj7m
	 ZwZdj36DSTxx3w8btErJ0ttSsK5BHCxOkOlD9EMQ=
Date: Thu, 29 Oct 2026 11:14:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Yingying Tang <yingying.tang@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for
 default memory profile
Message-ID: <2026102919-confound-remnant-f133@gregkh>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:55:41PM +0800, Shawn Guo wrote:
> From: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>
> 
> commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.

Huh?


