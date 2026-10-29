Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAE60A2603
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=meXZCUTD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=feSCgdpn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1gm75zfLnvhGfFKJnN4ctGyUHQ34iNDpJNKslNN8jhk=; b=meXZCUTDUByLLu
	lAbhEcUlwhVkocfvILmZ8RGMjsqiEZHMcDQm6pSsZ5/JodgkbOZMHQrN+t8nG2ua1u9Rtp9UYtH20
	fPbLMkltdTJ3Yw+purTIlvCBEmG2+7nCtvFQQ487VxCwjbQDVK3ec3+34K0m4S82bbrLYzA01XqaH
	ayT/Jiu/KpwXo9U3n5jq4kPGGS/I5n3orcxyOh7ijcvbw0N5Jt7VpJPFvMxThZ3NAb3Ho7CE8rOjh
	z7rzf23vMGoV2KGm3gzDp6zQBA4z/VfAwZIDJ3TqFZ5YIoOLAqtANwaHUTo/016GBiclfkYKmBi8J
	O8d8stqeedryP+KX+QTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV6K-0000000A9PB-3nIN;
	Thu, 29 Oct 2026 18:43:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV6J-0000000A9Ob-1lCO
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 18:43:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4B9F4116A;
	Thu, 29 Oct 2026 18:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EB61F031E8;
	Thu, 29 Oct 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793299426;
	bh=1gm75zfLnvhGfFKJnN4ctGyUHQ34iNDpJNKslNN8jhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=feSCgdpn2OY7H3OU+KhljJF53i4WvcbHZvYSkB7wDb0Q3CqUXpQMPmGf0KroGVvLV
	 YEyYgJCrI1YQqtOD1aZ42Lh5LISEIyheZYqbt5XEP1RRKpBao/H5IetUks1zpUHAaG
	 WCOvf6z8ZGVJjQdeFf9ns641P13EC5i7FCgp/9FEauti0yryA+wV3hQA8GCjnsqeGn
	 b+TNoys9oQIb57qXvmvHVU2t8TmJPese/MRQ9cep+0D9ox1e7Iy35snedBuWnTCOob
	 vX/4dVvCI66NAqNowz7C8x+L3gcy/Y4aacehIQpnbmNwVPwVkRlmTqosA+T5FB6o/A
	 IBcMYlPlxpSWw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Yingying Tang <yingying.tang@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH 7.3.y] wifi: ath12k: Increase RXDMA buffer ring size for default memory profile
Date: Thu, 29 Oct 2026 14:43:18 -0400
Message-ID: <2026-10-29-1-daily-reply-0011-ath12k-rxdma-ring-7-3@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
References: <20261029095541.685879-1-shengchao.guo@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> commit 15f7603b69a83a0acc7fcc8992ecbea6110f9424 upstream.
> commit 643f0bf936176c114d5631da7547e991b5d99f10 upstream.

Queued the upstream chain for 7.3 as Greg asked, rather than the folded patch,
thanks.

-- 
Thanks,
Sasha

