Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DCDCD68F5
	for <ath12k@archiver.kernel.org>; Tue, 10 Oct 2023 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWUP4WQMWxOsv3/vVVaakOqUu+278a/qbKKP+A39J5E=; b=CBRrgz/t3E8fUQ
	OpbkIN0JIcKdoXI/qnw9fGT9dI+9jb7Euf/1G1qr19A1TfI2ytMi6V7mXw0BDpCavo4d87dI2JBMi
	sX9kNVoEZWetV5c3q2kolFkLjHzeY8/pXY7aXpa3BuchLFjX9zmetxvLHrLjaWWP6djkxMu6qEmRH
	yZgIyg2LEzQpH3yuQ1IRaPQ4f/Aup33V2R/YU/UBG3uhHkV8VKP2U2e2JGeD5BogWksimapbGNgwe
	o6vxm/Wm7zKVqjisBppN/1CgQ31ElofbQP3FuitKED3w1oqUESE/8whGwTMmM6UJpL5gIJxfprOl2
	hY4cLTFTnS3houE0aJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq74P-00CgvL-2S
	for ath12k@archiver.kernel.org;
	Tue, 10 Oct 2023 07:22:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq74M-00Cgut-0Q
	for ath12k@lists.infradead.org;
	Tue, 10 Oct 2023 07:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E8A26152F;
	Tue, 10 Oct 2023 07:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D01C433C7;
	Tue, 10 Oct 2023 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696922536;
	bh=AfdHByMUUZajCAW8uhlGqfq1AsBB6O7960Qb6NBj9Rs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=D2nXk+/xkOBYbCt6LkRgVEFsWz/ALKhKEhbKgcDFzi979TBzCYYYb4T/q7DRiDsfz
	 B3VCfYJgq022XiQv6nrOnW0rQdVnhxDdR4ut2IrbRtSQDH+f/DQFx5gG4FrIEmzYfQ
	 60y+SHWUnVmNGYpPR3M6+s14x38FOX0skKsDOpDpDVQg3xvmEjVuOwQVAQy4lKYsc3
	 699sLhs7cgTQ3h/fnYZtGQE9zLHbMqYImbae8ieL0IThZcXgPET+zTLg+suXJaYr7v
	 fhQ7CXnTQj+0VfN8a0oSLiKl7UKtqtieOFk87MBBEEHgj9NBm/RUfJSEJw8FA2EE50
	 QWu4l+ceWih1Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: remove redundant memset() in
 ath12k_hal_reo_qdesc_setup()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231002182856.131254-1-dmantipov@yandex.ru>
References: <20231002182856.131254-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169692253271.2589238.16759325479642080708.kvalo@kernel.org>
Date: Tue, 10 Oct 2023 07:22:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_002218_210673_E780D5AB 
X-CRM114-Status: UNSURE (   5.96  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Since 'ath12k_dp_rx_peer_tid_setup()' is the only place where
> 'struct hal_rx_reo_queue' object is allocated with 'kzalloc()',
> call to 'memset()' in 'ath12k_hal_reo_qdesc_setup()' may be
> dropped. Compile tested only.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

258242dac924 wifi: ath12k: remove redundant memset() in ath12k_hal_reo_qdesc_setup()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231002182856.131254-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
