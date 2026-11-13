Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7F606A333
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W9pJIRcv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIw4RN+w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YxYvxkiTr3I4fwI/607mbu2WA82tAeXABlzoiYL5+2M=; b=W9pJIRcvTaTOkn
	SHgBswesZp76tr+apxAxuchU4i1zPOOhvKNiEQhbQe0ZBvK5DFpf2mxQfZP/x9XqGtAvZomEFJc2N
	1T9cZbvALAHDHc5JbemuagbtK6/S3U6RrJsCdxPmTM53e6ldSogL1wyDhm3qmX9dG8j2Nzo9PpCg8
	+tVRHi4cmy0ATcALh5ucaj1TScgXfWgR0TpegGBV/+nyLqeKExHRjpO8M2zhrFEnvBYy4yZpUSmwS
	fmavgoUBkW2zhaEPuyWnesK8b5aHmHxbo2I7b4zyGMcy5Cf6G2ZRJpoSUIOFN1ar9KHKKNDP/mIxT
	YbGUgC+j7aueyMCMTBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzEV-0000000EdZS-2Rgz;
	Fri, 13 Nov 2026 21:54:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzEU-0000000EdZ8-08L7
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 21:54:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6897540856;
	Fri, 13 Nov 2026 21:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C996B1F000C4;
	Fri, 13 Nov 2026 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606893;
	bh=YxYvxkiTr3I4fwI/607mbu2WA82tAeXABlzoiYL5+2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KIw4RN+w49C6lIdh2OA9wim+vaxIboICMvGfKhMz3Fbixhzp9ZQgQ33Li1sLiJt/j
	 L6G84IrPlusWhqk4Z1pkyfm+Msji6bcw7r3zUW/Qbv5Fjnsf5+k2qtqDA008O0sBYG
	 yFqVz3UeDBHdT7yl7h8rbNbERlf81oKYklGGgOAyXPs+8JnuQ4zh86uNOoAS5wL5fs
	 d3O/RBaKn29it/6x/AAu1Ca7miaSMEXNRLku/CBUp0VU4BG5+GXlQ+yWOhaOPbEofy
	 tWzDV9jd/EqpIxGCh59rYUkd0dvTCRej4QyaQ8EvXwNQOaeU6irlhseg0Sb4QxKgTn
	 FSVGK5Fl0XLbA==
Message-ID: <79141341-b259-433a-9656-286f5b2fb62f@kernel.org>
Date: Fri, 13 Nov 2026 13:54:48 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] wifi: ath12k: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-8-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20261113185009.157893-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/2026 10:50 AM, Mukesh Ojha wrote:
> ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace qcom_mdt_load() with qcom_pas_context_init() +
> qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
> qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
> qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
> retains qcom_mdt_load_no_init() with the caller-provided mem_region.
> 
> Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
> consistency.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org>


