Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B43C001E0
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byGGb27QGEjlQ5sj34vNPQOAMif6IX9YlKQb9zTnQLc=; b=uYM+PIfVxtwRYz
	6wg6pKiy1p99LcnuNmufPApiO3FH4dsY6ETO68pT30c9cZ4DcUeT+8wF/ftdcEoiYIm32Sht/D/4B
	MFclvg2028F/6RY12hZGCo/KD/gb/SFjTnHob97wf0o2K4RzFJ7xuq3JZPjgfypLGAGOtXnQyiLmn
	sP/Xg2LvoMRL+tMhkPh5J3KSoyNJiRoKrnlL1YnwM/Povg422VuH+vw10xbBgw3imbSZSxBvftfP1
	mIS49wFyvNDTA17ltjOJxDlNUUvDZdyuD/WG2ilDANvQn7Frr0MjsVgd7rq9nEw+IOQrWTB2ZW+Kw
	E6964QJr+8JJUy36QrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF8q-005QZH-2h
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 16:56:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF8o-005QYs-0p
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 16:56:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3D41619D7;
	Wed,  2 Aug 2023 16:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FD5C433C8;
	Wed,  2 Aug 2023 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995365;
	bh=p1sOEq/Q5nf8WlIzq4mgPmomVrjieac3zXBR6jgM+OU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OvN2f/YWa13qB7U/C1Y1ULILB3AHOJkcW25odca03FJ/yyeEdSMQ6A7kl/s80T1qZ
	 kwCbLAgLc9moV6NqBoANm0Np/D9q5JlFycmREfmKm0AjcyF924bAsJyQiJWz/h06H1
	 YzzkcYNIu3g+po5M7REs+zOGgNlxZtfBwk0pVScvpr2K6Kji4WFtyJvWxDmVL7EglQ
	 LR9UTNKTWxdZF3U7PCWVUxzLH4hl0c3+Esh6gVM+8ys34z2zs13Y6tu3x6ogQX03QA
	 /Q75UwbQanIYD5BelieZVmojpHi5XCrPbw5NbOmOyTleOYyF8MvrSSW5LqNwpaP5OP
	 u5Nwz/NX3n9rA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath12k: fix memcpy array overflow in
 ath12k_peer_assoc_h_he
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230703123737.3420464-1-arnd@kernel.org>
References: <20230703123737.3420464-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
 Wen Gong <quic_wgong@quicinc.com>, Karthik M <quic_karm@quicinc.com>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>,
 Aishwarya R <quic_aisr@quicinc.com>, Carl Huang <quic_cjhuang@quicinc.com>,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099536007.463701.11948665209748140465.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 16:56:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095606_335220_4F1B7B80 
X-CRM114-Status: UNSURE (   8.26  )
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

Arnd Bergmann <arnd@kernel.org> wrote:

> Two memory copies in this function copy from a short array into a longer one,
> using the wrong size, which leads to an out-of-bounds access:
> 
> include/linux/fortify-string.h:592:4: error: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>                         __read_overflow2_field(q_size_field, size);
>                         ^
> include/linux/fortify-string.h:592:4: error: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> 2 errors generated.
> 
> Fixes: d889913205cf7 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

603cf6c2fcdc wifi: ath12k: fix memcpy array overflow in ath12k_peer_assoc_h_he()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230703123737.3420464-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
