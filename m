Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B22606A31F
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=izbqXZ7k;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=jtYMADve
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=; b=izbqXZ7k1AZHfU
	5WPqClSvgEjRZhi3ldJug52+X8x1zJbzL5+lXmUUdCos6giwmyudn8aqHp42fOtQXLmMhVG6VnqEF
	IzUChcKHtpwiQ4M701qZ8BRY4LNP5IY7BHtszuafoJy9W3PdFi1njeo5mZpDKD+tNXKUedUV0/ZRG
	er+qmJ3S6sgSEAO7QDKxBMpQSyELlWV6Zm1FC7VlExO1Xv95doUYbY/pejITQIlyVaS0HQJu1byRz
	93F+sJKgJD/NfIRr8VNXBzkgBBLxwNDvJF30I0NuiFMacmkc6mehZli0iair8TYnVrLozMiQWhr5p
	+UCDWI2tww3qHIwfS0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGzU-00000000jE5-3eK3;
	Sat, 28 Nov 2026 11:53:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXGzQ-00000000jDh-0R4D
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 11:53:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so10842064a12.3
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 03:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795866790; x=1796471590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
        b=jtYMADvetfY7Ytdp8m5mGIzhyqaPT+AIUOyJ+EETjFCNjY9TCFv7mvZ3CNEml1LHRd
         9WhHSi3c2kXIWtMua4UpIzG6wsnhvMgl4DzSTb3WLFGk3jRQX80kFpjnmehb4QRnPcQ3
         U85JBpf9yzUOF9VwB45g+vocK5J3r25lQL4EyxlrcGb/re1JUA2JvRCIkB18g/Sz9m/K
         o5AAbc5rFuaAP0NI+9MPAuaACu3LDs00ZQlEycdwKibi4YVz02T7EeM9iCEkY/yz6dKS
         e0KLVwtb9Q+23YhvmwEsOj52Au7P5NTj9NAb6P648OPCPjXSjg5oL7BNwnHxQyjgmnnW
         xiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866790; x=1796471590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
        b=cRFWnN4q6NSkIC/9NWvJhcvnQLXRGyx7TK4W+SKm7D2o/ZiPMFbkzD3e6I7xsBqKqY
         90WEWKeTlQHqybPH1I7lvgrprnj9+aR2zJzRZJRWfn2Oz4NzdRzr1VheGtzSnQwtK741
         nDmjITOHYxc7863MAUEimycvVPZHzU+HTaFpsH6NRvA5xR/ccu6PvSdKlmjUCjmM7JjQ
         AB6Bfbh54mVXvIO8KQKPKDzlDCj5MDUikZWU0umd+MbkWQSa1zZKzu+lynd6vT7+tcmj
         35jd8GAqUEVKKJKovUJMheqEd+zP/jxES05Brn8S8WFWSbiuWS9mLqtvEqyWFsZsGqIF
         hpQg==
X-Forwarded-Encrypted: i=1; AL+hErHrQlwXwXgVYYSf/x87tIWt3ElXRI2Dfgfnyu9EPENSa96KYPmL4a0DoAXiRT1xZ34zcxQGlFc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9dRR4jlA3w4InBR2J+w7UE/ZOH/0ABD/QNPJ/bctCk39ir3Ha4
	0/Yy1aB45Agg3uDB0SvrgoJnLk8ybnSOM+O1DGTTsb+R95Hie/5DXE3HNdpoN+uj1g==
X-Gm-Gg: AZFdTZeVtsORM807HyIur1mAKpKcIx47YQ2KHZp23SelkE+6bn/ae4ATBRxMvC0JppW
	UcLNdfhOLBqv1PNXrN3sqhL2qqNHqyAw/wdRD9y7hKNwVYRwRiNT2NIyDZOej6zVjb7bvSFKdVz
	zZ41fos/90X/xJgQyWvghaPwK/8/gqoIhwsVjvS5BnHGcjfA+4zHbxfVj04odopJacvbpeD5lLq
	dOge93pwEZeUSd7gl1zklrs1KE+IwnTASk7mytl6ojP6uqZYr9tpFIRCrFA0w+5wCcjWxNUGFvp
	kfq4eay+P3UutBMdTkRY6HsUvdwLIVC0mo7ln9Un89TWwvpAnJm51R4FFx+CLi8i+HHnstgkboL
	Ec8Vt/7yvy21KtjZ7qjRl0saH1XzLwbwLZoYv2QeMmFcbhE3pb4wf2UM7LVCSRg0lQ0aGzRklRD
	L09Jet1qKyT7ilNkPcL+B/NgH6811kgmxMy72JQqhSx5YUtobRlulilAB6z6rKH4aA0Ccbq3FBb
	RAJ5xtBaIwY9iRPWquQN+1pN1AanygycPZTtpeqm7vqUBpK78sVrxiuCC/slqoWFHgtTq5sWN1j
	uu2RnWc9UDeiFbtFNbWQ2+E1/xiTt97Xo3HT8uqULoHAp6OPW7Z7VzKkfEL+YZRATVn60v6jart
	LN8Ze0QRqILDSDW+TGuYch86T1qckB6vzE6VxAyP7aFC8lYRPEVXxGnlYPrnL1xReQfOlbfDoAQ
	6hpTXA4b9T17hrZhTIFfgsdo1vMwa0MR1DbiPEzVmDQRBLKOg+JxtBy7+wdk8z7A3CjUJKidSMZ
	07pBvDYsL+hZ7vUmmLVcPG2L+QMwISXEZQfjuHDWIlJBZmeDSNNcvq+nqjNRsz7w62aJ96gXmGT
	dwCUGH4XSVowu85bEpDQDvX9Rzj8wl3vBMu1Q7pvHHfOodBR3jtZpCzqXGutLwFXDfCvgNieSRL
	1ovVS3LMY4P754gg8tvq0
X-Received: by 2002:a17:907:6ea8:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c513a8069bcmr2557800266b.19.1795866789862;
        Sat, 28 Nov 2026 03:53:09 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470120008502fb937d9e134d.dip0.t-ipconnect.de. [2003:f2:4701:2000:8502:fb93:7d9e:134d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67bd3sm959587366b.27.2026.11.28.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:53:09 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: karthikeyan.periyasamy@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rameshkumar.sundaram@oss.qualcomm.com,
	baochen.qiang@oss.qualcomm.com,
	quic_cjhuang@quicinc.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	quic_bperumal@quicinc.com,
	kvalo@kernel.org,
	quic_pradeepc@quicinc.com
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source other than the station
Date: Sat, 28 Nov 2026 12:53:11 +0100
Message-ID: <20261128115312.428133-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
References: <20261122210809.2087836-1-julius@bairaktaris.de> <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_035314_727511_AB519F7F 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

On 11/25/2026 2:26 PM, Karthikeyan Periyasamy wrote:
> Can you explain the test scenario ?

There is none: I have no ath12k hardware to test with.
Found by an LLM review (Claude) of the code, comparing the decap path
with ieee80211_amsdu_to_8023s(), which drops such a subframe.

> How the user trigger this issue ?

A station associated to an ath12k AP with Ethernet decap, without
4-address mode, sends a 3-address A-MSDU whose subframe header carries
another host's MAC address as source. If the hardware writes that
address into the decapped header, ath12k_dp_rx_h_undecap() sets
RX_FLAG_8023, ieee80211_rx_8023() delivers the frame under it, and the
bridge learns the other host on the Wi-Fi port (br_handle_frame_finish()),
so traffic for that host goes to the station.

Julius

