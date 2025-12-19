Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBC5D74960
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 07:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGi0+4XwarEQLJCKZ/PM5SfQts1Wwz+1Rb9EcnA7f2A=; b=vvYHGnePNlxOSj/bHwxptaXo35
	k8dyqhWvDbjBYXsd2bw3vqOMmzpCzCBJGDLinaNMnrzyf9pQ0N+AgzpcXzPbhMzOz6j7O2Jv/4Y2R
	N/km5LbDHbjOVkGH6Oz77q86pnoYBpQNMIj1vBbeBoe/AwQ4p3Hs6Ep8W1kuU+Z3jJ46jRFq2pvEH
	k1p89tEBzxxcwakelOnMVKEW0D2i5hdjWnp4Yf1wfdQjCrCY3Amqc4B75t7N5TqiibeNmQsNYaJrK
	bEixZS/W8RzuS41QiMGmaVUG/QVCoaf0IBkOUg/cZqgRzoip1vh3kW6UesNbflk5oLdfDqtEZJXsU
	vq4e4YrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUke-00000009kfv-2Kzu;
	Fri, 19 Dec 2025 07:18:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUka-00000009kfV-1jY0
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 07:18:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so872340f8f.3
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 23:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766128686; x=1766733486; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGi0+4XwarEQLJCKZ/PM5SfQts1Wwz+1Rb9EcnA7f2A=;
        b=an1a3kM0HVQyuwcz57uLEJnVLziUqRXeTy7ZASEvOpvl7pr/MDcVECHoxwuCAONQOF
         T/RU8zhHH4Wekfyn1M1fwO8m+G3a09hBdqZivJzsEWo49sQSKKJ/B9nt0V80+SurIBA/
         ATYmQ6RiIdWUnIYcKHJ66Ge1OfZ43oZO/RSWozAiv0PgSFpRDtjCI9XPnzNZAqXdBSkK
         1uKVPju0MQ62NmsYa93Dk9JwLAPRCajL/fVvxE0xnZADOkp6zurVF+dJEiANi/MMQ1lb
         +mX0kLVTLa/kr9AreQGr6s/E6w/6Trp0BkVZjoOhQwDGtzcR5MtJXAvdHMrCdeT22r2t
         zOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766128686; x=1766733486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGi0+4XwarEQLJCKZ/PM5SfQts1Wwz+1Rb9EcnA7f2A=;
        b=by7Vv5bL3P9ucpchRaQTTTCTrejAbNIKJd/0DQbPS0J4T8Yz7XY++WvJp1sMtj+uwx
         CUBjwlzq5N3kv+LRalfFdI2hX771RS3gtZDfApGZ/6vdnyifo9a8kVzmMPK3wAV4l3B3
         GQ6sMPir+Oceyx7cM+iaLdtTUCKKQOpxc/SPMT2/fS5lWJllexY4wgwpVbaBMyESdZYN
         PLasQig+mwB3MxSKVfSuW7a2kLW2woyvCrZIsW4WmPNiMBEB4EYB8zdmik9nFHEMwR5I
         Xh/JtLSXIqC+FlMO/aBW/gTXlYK1Hs2p5H7VCNlKl2K0+0WTfLXhCjUWD2zGzPePuFVx
         zmuA==
X-Forwarded-Encrypted: i=1; AJvYcCUbv3YwxGuYhbU7KqNYlNo1o5geGa7mK+MqjjOsvT9R5bo+c1lEa6wbenR2kYCkyv+nWytydxw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg8O9TE1MvoS/LzIbbqZwvbsvMUDJ6ABcSIbDag5OpSigrjw8p
	fPoXTBK0PXjpUb8V5lDwC0rfJCbaEq6ANDs89JU6QA0YWKpOSctsZvCzj4HKH1GkFEA=
X-Gm-Gg: AY/fxX5Ej5Ihp03VMZKpXQCEiehwDPgmukKPn2AjUpdoYVW8ZU6hNV7Onue3dxJy34q
	9mvn5Y9xyKmHSY+x0AR2+V0N9RRorwDAV5v5Y6Bn1HeOERpS2zTZqM/fCFOdsLWKm+CZHka3h9h
	r568PPbYOY50IlNW90oVTRgfO5h26Oa12RFRP8k3QK+da0rRoqxPKulhZ7R1U24eeqUgUHrgPgw
	5dCKc5iZJEPHkc3keIICsElWDjKIG7yVCV82txulFgj7M9SxvC/b1uqeEXX/qZGkR2YEgbZW51r
	3Uj/l77Zcg95ixfAyY/Z4BeubCo1hVsmsvz+perWUng8sDhSxMagG1uvMVDvF2nBWjXn7T4WtfU
	HZ7b919lr1UOmZ98H0fhlTzL59xeP7pcMxbSkVktugFfowfjfoQFYbKxFIMujbmM42IJDWyy03G
	AmirTRwdjtnhXYh//9
X-Google-Smtp-Source: AGHT+IEPtSP5+uO01zb0W8AboVxHyk9kN/vEkm/zI5MrHcwM8lX/OZgS/xyLBiTOscvkxfHoz2ZkNQ==
X-Received: by 2002:a5d:5847:0:b0:430:fbad:687a with SMTP id ffacd0b85a97d-4324e4c0d28mr1833506f8f.13.1766128686294;
        Thu, 18 Dec 2025 23:18:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm3352767f8f.7.2025.12.18.23.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:18:05 -0800 (PST)
Date: Fri, 19 Dec 2025 10:18:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <aUT8KrV36wF8ITIK@stanley.mountain>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
 <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_231810_118195_2F0EB5B4 
X-CRM114-Status: GOOD (  10.63  )
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

On Fri, Dec 19, 2025 at 10:54:03AM +0530, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 12/18/2025 1:14 PM, Dan Carpenter wrote:
> > Destroy the rhash_tbl before returning the error code.
> > 
> > Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> nit: The next branch in ath is actually ath-next.

I'm working with over 400 different branches, right?  I can't keep track
of them all so I just put "next" if it's in linux-next and leave it
blanke if it's in Linus's tree.  It's automated.

regards,
dan carpenter

