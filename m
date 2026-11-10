Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4EB606A325
	for <ath12k@archiver.kernel.org>; Tue, 10 Nov 2026 00:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H1eM1xbt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQFOp1dP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=; b=H1eM1xbtNpR67v
	xv/+9Yt94BLXYE4idsoQAiXYdQItwU1US8XpBavLTxZGdnW6IOpBd6WYC8RbW+mCVYJ7LOsvA40lK
	x8iIzT8/7DPdOwVht/bsLtw5+StaiXFwpcsWXgCZB1aMdJF3vB+ZaugSp4DQAvqkary5V3Me105OM
	vszOkIK1X9ebvp2TZ/7LI3jsM/8UEgbl561KMjeslkbZrlFOFQWiPX+K8ajyOqKsrHY39zLaLv/3p
	EFGH6C3V14bLCfJivtfcPzVZuBIiCnpZUISDWKkLRKzQpWZ1oENMXHdQ1Cjj0W0JP7gX5PuwhT0wa
	eez9hJAYkWhR0vaU5oCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZc5-000000020QA-2EaJ;
	Tue, 10 Nov 2026 00:21:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZc3-000000020Po-1gid
	for ath12k@lists.infradead.org;
	Tue, 10 Nov 2026 00:21:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4919a880834so918420f8f.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 16:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270081; x=1794874881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
        b=XQFOp1dPU/6uoi3V9qmnej2NUkqQe2dOj4gUKtQNH5CciLX/Oc0cHg0M50d/Jx+01K
         Y+CvDdwMSDvIlWaJWdsO/wscDyS01yIOIajSYAyU4pXhXtVyV8YOc6Lts/28eC06iE1z
         qyi0Wk7JmlRg09AzncWb6ATCxczXWOLe+GrU83opn44iot0MQeKVtjguoej/yPFAQdLp
         HMznFVn2QR70f82TG77HP7VG+yqa4VsgELuBnDiV8rVfYsfSKMIbj5zmlPb+ozpZoFtF
         ANom+MXzSGICXzqOdOmdXjy4ROlnD3hKcMK64dqufK8QQBXbO/sPgtDDDaeGkKSKb/Zf
         SYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270081; x=1794874881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
        b=jQrHwTjQMmsgptHsrc4+8y+V0SwqsBMYjh45lMS0486BXq7qVFvAe4pAYQlJgf3aZ8
         Im8eQzFq9P2LlYiaUE3dtX/psbVzdXw9HeIZ/b3RG6ws5KC51TrcbxSZXkst2hyTeBvd
         aZ1gWhHPCf5w7G2/OxnR/X8G1DQFdPpv+u0fjOoYuFzlOwvmTQbZ+13OQLgI3+YudZUr
         kRflFM+i1BeEYv7s8q4gA3+l3Ev5z4YMKhmU/6J0OOmzJNVX4hhyTDIlAq9dd9oFufTh
         svX3uYsi2FMnK84UghTghoL/C+JQssP9PxIbYAoR3H+nMemNYeoc0zAP+wxiLglAOvWG
         S82w==
X-Forwarded-Encrypted: i=1; AL+hErEZF6ablvcIMT3kQNDqF6l/oZAZfYXf5g29F+/Nz/uRZLhgPUeyIHCXkc6/YFon/TlAmesr/rQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+IE4DRcp5KcDLwR76Cv38XG0ul6N3Ds860OO2aMCe3DltDliJ9
	EMKTr5iAxM4AI8ZdgG6GCm9WqCSi9TaQb/vi46mR0SiLMyw/az5ND/Hx
X-Gm-Gg: AYBFou27Mgfmc2LWComy69k3eIK2VxnSN+zfSsvVgUsCxMqL76OYGY2IGjT5J9d5/FN
	BnzjU+fVhpFUeQlqO+yU72pQ7ftfku4L0t50Tb9KxCncBi3RipqmVKEDGsIWrw4BcCWKIiUWhHg
	1YvVSDWuQYd/2tuSa62NFzWXX7S9z6noUGEDlIWhpYNW6QHM7nqfpLR/AbFp5DbnGGZyESvDR2F
	J5zN15RohC/AHuQJGScgWpeDwBFY6/9GIMmhNo69bl4r8JTUBR6nRf1MNP8znhSuNtxJIh2ObMS
	P9JIF2V/jeh/IqyrIsvG4eylsWspn8XRuYWp7llK1I4q6XwtVZPoAilE0jGhwYmatnzLjYnfgEv
	MjguUj/pBOx1oM3IOhUYc99MR/u2Td1LWs0DdvsirV/M2Y1Dhpi7wzKlDkY1naf02aL9mcCOAn8
	URCZcg1MbncPhToIMVj+WaNGJCQL07CvINb1O+8GBGgfEozUxfsqtLCpv1Fj1IDiPKmgcgBaJAv
	iyQg1jIfR30zLzNcEg88/wLvcmg5L1Wd/ttFiBEEi5+uZxunRCibwRP9ZEqRIi42timd+SzTt3C
	IXwpzhyEeuevGUUzg0VkZ5PDF7GB9yVo0oX8WjruXyGZoCNz6UyCuDG/S0eIfBCNK5UCQ1apnEo
	TyyewBKFKwFA2U/45dJBA1Ilskm8zs9Nv5sdORg/gLORYL3sFzsrE9nYbZWAsSkNewAeniQ/BiE
	Uz3kAIvXWLXM6gqWBcR5vJBSb1QoVp4k8QzMqtcNM7Ay8AlQ==
X-Received: by 2002:adf:e001:0:10b0:48d:ee0d:8b3d with SMTP id ffacd0b85a97d-4982f594b83mr1089641f8f.28.1794270081225;
        Mon, 09 Nov 2026 16:21:21 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm1665099f8f.6.2026.11.09.16.21.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:20 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: report no AFC memory region to firmware
Date: Tue, 10 Nov 2026 01:21:07 +0100
Message-ID: <20261110002108.89933-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
References: <20261102200235.48973-1-gsustek@gmail.com> <20261102200235.48973-2-gsustek@gmail.com> <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_162123_477155_97D6D9A6 
X-CRM114-Status: GOOD (  13.34  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/2026 6:17 AM, Rameshkumar Sundaram wrote:
> What do you mean by "bus address" here? Do you mean the DMA address
> provided in chunk->paddr?

Yes, the DMA address in chunk->paddr. v3 says that.

> Also, the paragraph below makes it sound like without this change the
> firmware doesn't send the memory ready indication and the radios don't
> come up, which isn't the case. There is no visible functional issue
> being fixed here. Please update the commit message to precisely describe
> what changes with this patch.

Agreed, there is none. v3 states that the firmware comes up with or
without the change, and describes only what changes in the response:
size 0 instead of the requested size for a segment the host does not
provide.

> I'd rather move chunk->size = 0 to the default: case. That way, all
> unsupported memory region types are consistently reported with size 0.

Done in v3: one line in the default case, no AFC case and no new enum
value. I also restored the existing warning. v2 had moved it to debug
level, which hides a request the driver does not implement; that was
wrong.

Thanks for the review.

Goran

