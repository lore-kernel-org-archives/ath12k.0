Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E308DFD3758
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1C7yIlT94IoBr8iXO/ZX1qatNSVFuy44K0ykk4DpylY=; b=0pYHXxl48l4q0ob11odkNak8yz
	HBdAxZ44xS/3TuULsYb0GLgWcWokbdQkeeNJLlUUJh4Lys28r/VpIpKnnBZdzn6DidmdraAQnWPVJ
	1X/lq4GPyK2LDunB1U6VLBemZ4EF3s3HPjft1uWrVT2M8FWpyQC4eHscvaXRn1qDUOW3Wla8sD7BR
	QHVs7mBVqDBBPquz7j32pTaZ5st+4Iwt2TwbvAxKJ3sT+AOtODHv2YYJ38RCtO4psrShL7vDo8Pf7
	OxhpQEw2e8jyLwTmjzM9GLAlY1r/eBvACW2LcViRJkYQs80FLJ1sup/Hb75a23rHN5IUBFLFhnGKs
	qPNxqOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvESA-0000000427K-2dIa;
	Wed, 25 Feb 2026 12:57:22 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvES6-0000000425z-3zZW
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 12:57:20 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-4398913af88so1353568f8f.2
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 04:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1772024236; x=1772629036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1C7yIlT94IoBr8iXO/ZX1qatNSVFuy44K0ykk4DpylY=;
        b=kJXKI7DX265TKLnPYSf2o6ME4mLxzABmiVea0z8cKduTDKQBVMSD3HmJdNL5oU+dDm
         UWK7nUQDqvqatsobF3dfZ1yliVjm2lOk5Fn8jutFoZkFZCOqe2ZZUqQDXQmHHyNT7OIY
         1wKtWdzRTPyJLIhhUTSPmhl2oPOLI70oj1SLCVeUoSHo2FkIBsFdyTCJqOLQpXGWvZ0E
         dWedFGVpog5w9qdJ3TnQT0aMRasdq13hn5ny42XNZOIML7EIkNkZvmeF8iD1WzpNUovT
         xf/j4mXM9FHulrwssyzyqSNAozDtzsvpaOTW4fgu1Mh8TKXl3yRBtpNWar3ZYA2CBcWj
         UNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772024236; x=1772629036;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1C7yIlT94IoBr8iXO/ZX1qatNSVFuy44K0ykk4DpylY=;
        b=KYQv9DhEc3H9xANK+AQ5aHhnBz6Z3nDXTKMDjnzRBkodiR5rpIxR8exq7bih+DR05/
         p77PNLj4ZymuKXgOVO3eKfCFxdA5Lo9WkaIxq8pDK/PT4zNBPFun+WDPABY2zteh8jdL
         Xlncdlu9p4FAUzSxVekzNGVHiOtF+gr0DGHHolZoFH6jP/i3gbWoddE5G7LOJWuSqR4o
         UUmGhjzQmmq2OZt2imqVZKB9M3zjtW3XyViv0rzQrux3YUx/wzLBTpu5lnonLD669Jb/
         L5qcr36FeHLzZ9ZPOt+0uDir4beb0ij+ZQFPhVVGSORvsKij0MYYsR7vXXzm72xvOjMs
         gAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOCua4rZ/7mLk5v1DslNWb5UBHV7EToyb2aWuOoJZxw7jo272HLMDdSbb4azb7bJ5zfnfuIeU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWMnPbLsdN+LPTfHHyN/YQBXz9igPH9/hhhPpshKfbR/G+8Q3N
	54g3JkauNSUq98E8SdgqRqjqbBcGQhIS7moW+1b7hfubRn1Be0LnwpJwQjLjlYOAFcw=
X-Gm-Gg: ATEYQzwwlJUpefT18SLvTaZb8pMi/ZksPkyYelPURA2BjQFONbV1fpJOikasuQZUfyt
	HERnGj4uXOgXoA/sc87G3mq6vbAqjT7/78W1B+KD+Sh0mRUO6UhkwGoz+uQhLQ5JrKtxxz0FFFJ
	OllRJ5WuCJ3UBY7tF2BAwxbGk/yz0cIcgr78XH9otBOb2ZhGOpTT3Ovonj//efDmVtvmbUQ+AjF
	H8nulOS4K8axsx3OhWD4+l7WipshqrDMzD/9ap+8qlVzuEjGgrCBLTZN3+F6eOVFY+nZD+xXPwi
	4NVj85SpMwKDp5JHSE9/A9DfCGOqraGO370QFSS+1u4NrRZFdkdTqiWtg+TLZEj9bicUfiPmOo3
	rzlcGRiUMGl97yDI4b6pfhpOa6pP0rM1mlfJp6LDu/GzltZ6PnCKRvxHCX2ixlY9mpciuXME2kV
	Veo9rRG3zS56uMYbT43qwRC7UbxFTf4t8dpyCi0Ki5XKJOm0FsJqQwMQ==
X-Received: by 2002:a05:6000:1a89:b0:439:86ac:6dae with SMTP id ffacd0b85a97d-439943068c9mr741587f8f.58.1772024236115;
        Wed, 25 Feb 2026 04:57:16 -0800 (PST)
Received: from [192.168.108.101] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4398fefa3f8sm4145940f8f.36.2026.02.25.04.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:57:15 -0800 (PST)
Message-ID: <a1057b77-de96-4fa2-8eb7-54320f0f3aca@freebox.fr>
Date: Wed, 25 Feb 2026 13:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Pass the correct value of each TID
 during a stop AMPDU session
To: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>,
 ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260225114912.966266-1-reshma.rajkumar@oss.qualcomm.com>
From: Pablo MARTIN-GOMEZ <pmartin-gomez@freebox.fr>
Content-Language: en-US
In-Reply-To: <20260225114912.966266-1-reshma.rajkumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_045719_253062_E1114364 
X-CRM114-Status: UNSURE (   9.92  )
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

Hello,

On 25/02/2026 12:49, Reshma Immaculate Rajkumar wrote:
> With traffic ongoing for data TID [TID 0], an ADDBA request to
It's a DELBA that is going to be sent to stop a BA session.
> stop AMPDU for the BA session was received on management TID [TID 4].
> The corresponding TID number was incorrectly passed to stop the BA session,
> resulting in the BA session for data TIDs being stopped and the BA size
> being reduced to 1, causing an overall dip in TCP throughput.
I'm guessing you only tested TCP traffic, but UDP throughput is also going to dip.
> 
> Fix this issue by passing the correct argument from
> ath12k_dp_rx_ampdu_stop() to ath12k_dp_arch_peer_rx_tid_reo_update()
> during an AMPDU stop session. Instead of passing peer->dp_peer->rx_tid,
> which is the base address of the array, corresponding to TID 0, pass
> the value of &peer->dp_peer->rx_tid[params->tid]. With this, the
> different TID numbers are accounted for.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
[...]

Pablo MG

