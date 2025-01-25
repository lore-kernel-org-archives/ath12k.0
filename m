Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B65C0218C
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dejM2pVhbH3cRZV+qO2a49sZ/LlbFOIsCPpw3y0TkzE=; b=AsyPvZLStIF2LXgopvFqG0Oa/C
	261Y8NQGHCWoeLOatOZwNxxe2H8Xqdmp/zuzmZyVmQc6yeVPW4/22rri9Mmb3u4TuSFw4C7eYenpR
	BqP/b2w7O/jyYVHuFbWn2copEfYcB3LlBg6J0zb1sse81tAPOq4K7Gebg/v0fYBJmMKFM5tLvb5vk
	XYAQcWgW7/fZUZatl14Md0XXB4s9r5wPG72G6oOzwXzwkXWZKzzRusmqfvUTM4S46GRrRUpiKH0nM
	4qYYb5vbQ1yizaV/I2Ott4zpkZitlpD0uNMieAOvYw0I5gzW+iE+0PH7ITv74p7BCOoIzeJf8KQsf
	ysYiPwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbmgg-0000000GlHV-2Gmz
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 20:23:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbmgd-0000000GlHA-2KCo
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 20:23:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1774945f8f.3
        for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 12:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737836602; x=1738441402; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dejM2pVhbH3cRZV+qO2a49sZ/LlbFOIsCPpw3y0TkzE=;
        b=Ze9ERZZY1M+HMvOBKd+NTbz+PuxORIBTfQyEkqdqziCOEfH/9ZGSw0FLUBwz1s7sSM
         I7zznBr8M0dALIbmkgmwV6twnDvAb8Twlmk76vbZS9CbayYxCLMVN8WJz7v++W9zwsBY
         h4c7akRGde14Vge6JUnZMbKc6M7/OOo+8iT0J8DgzYX76nMVEQsR5l0kj8ZoQSPyHV2u
         CZ+Uh3aCT15iW1QH2z0GlGZqo7b0a5xNHfsu/rVg0CEC9RU9itjln/IEvIr1JftwgE3q
         Ozzrj+N5rizNY1fJCJ3h2dGVolLgJVQYmSg2tJCRiebNnIcLyo2+MyXwkibGRGrvwfOM
         EEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737836602; x=1738441402;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dejM2pVhbH3cRZV+qO2a49sZ/LlbFOIsCPpw3y0TkzE=;
        b=CYj6fhNprIIYf+HAxu0Kx73zftStyQw7oU/g394qXpWFaFnDlindqLXOOfGve1F1FM
         JfURQlO7Fl6WLe9vyislEoRwDfxKzDSsNWmjFuBacArMLd0jBd7Ok8YEzTCEeokY4J9o
         CydOshF53xseYzBrWnS6ITyEB7Ug8DvmhIThnZpD2fqf/v47e9hiEeuHFj56IUNVo+Pp
         FBSbEfTbx2+T0Wy3JQDzB2/4wwRjYLKPuh6L5d6SaplBupiHzKBKi3RncZJOGRHCFkkc
         STF8zN29DdbsRF7+8UilswFTjbS6EvEPjjDEX0ZOYapUkIlbk5q0k87XaCtjnM2uBp9r
         UQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlsleBVUe2nB4wh1myGLj8oL2g5Ir8dhqBY04QVhCSxEkVHfuKwQ9jHhCp/ZMfuGjMTeR9e0A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdsRh1eY90It6+ewDoHP8qvgPkoVQqmaQPNRD3at91B+osgl7z
	douzMQFj5vRK5GgIDwyouNXU87qYnVoTDx60Le4F+5owqgkmZ87yCNXnAA==
X-Gm-Gg: ASbGnctg7umJMRlGGrLC4T/gVcbX+w+4XZxNkzr13pZOm1W6H6yx7zATMX3+1mE/61e
	I15N5MfNCNrjDeSH+asOy3eQ8/gVyX9pQanrQQERMBNg5I53N6Z+ZMwmpbKMl0fX3bSs15rDpPM
	12Mwr2FwMz7OZYJtxqUFrTZ3RcQZsAeMAI/v3HpGeDwCNBPTXAYM3k/JXPHI3tShkRMIn5MhXOj
	WNPHLFUlkGjSr7X6Zrq6qRC30cA3dIa1ti8HRSuwu6C1/ryGyekqWGCqUymcZc7NxfEylZUnhpN
	XmrZnSpAuF/NtUO3TpXPjzI=
X-Google-Smtp-Source: AGHT+IFh6bS896E6LufJZVkOiiVhAbtDqyNUA9TCia+B9toEquYH5HwBGuWERXDfR9ceCO/ZKtSpaQ==
X-Received: by 2002:a05:6000:18a8:b0:385:f69a:7e5f with SMTP id ffacd0b85a97d-38bf57a9a86mr41646771f8f.38.1737836601605;
        Sat, 25 Jan 2025 12:23:21 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a18859asm6359027f8f.42.2025.01.25.12.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 12:23:20 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jan 2025 21:23:19 +0100
Message-Id: <D7BFNSFK7P2Y.1MHPLEN8MNDLC@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Nicolas Escande" <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fbx: Add missing htt_metadata flag in
 ath12k_dp_tx()
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250124113331.93476-1-nico.escande@gmail.com>
In-Reply-To: <20250124113331.93476-1-nico.escande@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_122323_588712_118B116C 
X-CRM114-Status: UNSURE (   8.82  )
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

On Fri Jan 24, 2025 at 12:33 PM CET, Nicolas Escande wrote:
> When AP-VLAN was added, we did not add HTT_TCL_META_DATA_VALID_HTT flag t=
o
> the tx_info's meta_data_flags . Without this flag the firmware seems to
> reject all the broadcast (ap-vlan) frames. So lets add it same as ath11k
> did it in commit 5e8a373c8699 ("ath11k: Add support for dynamic vlan")
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>
> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

I left a 'fbx' in the title that needs to be removed here. I'll send a v2 i=
f
need be, but feel free to remove it yourselves if you take the patch as is.

